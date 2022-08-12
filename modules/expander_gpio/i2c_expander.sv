`define EXP_REG_INPUT       8'h00
`define EXP_REG_OUTPUT      8'h01
`define EXP_REG_POLARITY    8'h02
`define EXP_REG_CONF        8'h03

`define EXP_IO_DIRECT       8'b1010_1000

/*
0 SFP_RLED = output
1 SFP_GLED = output
2 SFP_TXDIS = output, 0 for enable
3 SFP_TXFLT = input(?)
4 SFP_RS1 = output
5 SFP_RLOS = input
6 SFP_RS0 = output
7 SFP_PRSN = input
*/

module i2c_expander_sfp
(
    // Clock module
    input   logic   clk ,
    // Reset module
    input   logic   rst_n,

    // Clock for i2c, frquency is scl*2
    input   logic   clk_i2c,

    //  i2c wires
    inout   tri1    i2c_scl,
    inout   tri1    i2c_sda,

    //  Expander GPIO
    input   logic   sfp_rled,
    input   logic   sfp_gled,
    input   logic   sfp_txdis,
    output  logic   sfp_txflt,
    input   logic   sfp_rs1,
    output  logic   sfp_rlos,
    input   logic   sfp_rs0,
    output  logic   sfp_prsn,

    // Control conduit
    input   logic   need_write_reg_o,
    input   logic   need_read_reg_i,
    input   logic   need_read_reg_o,
    output  logic   ready
);

logic reset;
assign reset = ~rst_n;

logic           wr_reg_rq       ;
logic           rd_reg_rq       ;
logic   [7:0]   reg_addr        ;
logic   [7:0]   reg_wr_data     ;
logic   [7:0]   reg_rd_data     ;
logic           reg_action_done ;

logic [3:0]     mm_addr       ;
logic           mm_read       ;
logic           mm_write      ;
logic [31:0]    mm_write_data ;
logic [31:0]    mm_read_data  ;

logic   i2c_oe      ; 
logic   i2c_sda_out ; 
bit     i2c_sda_in  ; 
bit     i2c_scl_in  ; 
logic   i2c_scl_out ;

assign i2c_scl_in   =   i2c_scl;
assign i2c_sda_in   =   i2c_sda;

assign i2c_scl = (i2c_scl_out) ? 1'bz : 1'b0;
assign i2c_sda = (i2c_sda_out) ? 1'bz : 1'b0;

i2c_expander_ctrl i2c_ctrl
(
    .clk                (clk            ),
    .rst_n              (rst_n          ),

    .wr_reg_rq          (wr_reg_rq      ),
    .rd_reg_rq          (rd_reg_rq      ),
    .reg_addr           (reg_addr       ),
    .reg_write_data     (reg_wr_data    ),
    .reg_read_data      (reg_rd_data    ),
    .reg_action_done    (reg_action_done),

    .mm_addr            (mm_addr         ),
    .mm_read            (mm_read         ),
    .mm_write           (mm_write        ),
    .mm_write_data      (mm_write_data   ),
    .mm_read_data       (mm_read_data    )
);

control_i2c_master #(.read_write_mode (0)) i2c_master
(
    .clk                (clk          ),
    .reset              (reset        ),

    .clk_i2c            (clk_i2c      ),

    .mm_addr            (mm_addr      ),
    .mm_read            (mm_read      ),
    .mm_write           (mm_write     ),
    .mm_write_data      (mm_write_data),
    .mm_read_data       (mm_read_data ),

    .i2c_oe             (i2c_oe      ),
    .i2c_sda_out        (i2c_sda_out ),
    .i2c_sda_in         (i2c_sda_in  ),
    .i2c_scl_in         (i2c_scl_in  ),
    .i2c_scl_out        (i2c_scl_out )
);

enum int unsigned {IDLE, READ_IP, READ_OP, WRITE_OP, SETUP_IO_DIRECT} state, state_next;

assign ready = (state == IDLE) ? 1'b1 : 1'b0;

always_latch 
begin : rlos_latch
    if(reg_action_done & state == READ_IP)
    begin
        sfp_rlos = reg_rd_data[5];
    end
end

always_latch 
begin : prsn_latch
    if(reg_action_done & state == READ_IP)
    begin
        sfp_prsn = reg_rd_data[7];
    end
end

always_latch 
begin : txflt_latch
    if(reg_action_done & state == READ_IP)
    begin
        sfp_txflt = reg_rd_data[3];
    end
end

logic reset_delay;
logic [6:0] reset_delay_cnt;

// assign reset_delay = reset;
always @(posedge clk, posedge reset)
begin
    if(reset)
    begin
        reset_delay <= 1'b1;
        reset_delay_cnt <= 7'd0;
    end
    else
    begin
        if(reset_delay)
        begin
            if(reset_delay_cnt == 7'd100)
            begin
                reset_delay = 1'b0;
            end
            else
            begin
                reset_delay_cnt++;
            end
        end
    end
end

always @(posedge clk, posedge reset_delay) 
begin
    if(reset_delay)
    begin
        wr_reg_rq   = 1'b0;
        rd_reg_rq   = 1'b0;
        reg_addr    = 8'd0;
        reg_wr_data = 8'd0;
    end 
    else if(reg_action_done)
    begin
        rd_reg_rq = 1'b0;
        wr_reg_rq = 1'b0;
    end   
    else
    begin
        case (state)
            IDLE:
            begin
                wr_reg_rq    = 1'b0;
                rd_reg_rq    = 1'b0;
                reg_addr     = 8'd0;
                reg_wr_data  = 8'd0;
            end 
            READ_IP:
            begin
                wr_reg_rq    = 1'b0;
                reg_addr     = `EXP_REG_INPUT;
                reg_wr_data  = 8'd0;
                
                rd_reg_rq    = 1'b1;
            end
            READ_OP:
            begin
                wr_reg_rq    = 1'b0;
                reg_addr     = `EXP_REG_OUTPUT;
                reg_wr_data  = 8'd0;
                
                rd_reg_rq    = 1'b1;
            end            
            WRITE_OP:
            begin
                wr_reg_rq   = 1'b1;
                reg_addr    = `EXP_REG_OUTPUT;
                reg_wr_data = {1'b0, sfp_rs0, 1'b0, sfp_rs1, 1'b0, sfp_txdis, sfp_gled, sfp_rled};
                
                rd_reg_rq   = 1'b0; 
            end
            SETUP_IO_DIRECT:
            begin
                wr_reg_rq   = 1'b1;
                reg_addr    = `EXP_REG_CONF;
                reg_wr_data = `EXP_IO_DIRECT;
                
                rd_reg_rq   = 1'b0;
            end
            default: ;
        endcase
    end
end

// State machine
always_ff @(posedge clk, posedge reset_delay) 
begin
    if(reset_delay)
    begin
        state <= SETUP_IO_DIRECT;
    end 
    else
    begin
        state <= state_next;
    end
end

always_comb 
begin
    case (state)
    IDLE:               state_next = (need_read_reg_i) ?  READ_IP : (need_read_reg_o) ? READ_OP : ((need_write_reg_o) ? WRITE_OP : IDLE);
    READ_IP:            state_next = (reg_action_done) ? IDLE   :   READ_IP; 
    READ_OP:            state_next = (reg_action_done) ? IDLE   :   READ_OP; 
    WRITE_OP:           state_next = (reg_action_done) ? IDLE   :   WRITE_OP;
    SETUP_IO_DIRECT:    state_next = (reg_action_done) ? IDLE   :   SETUP_IO_DIRECT;
    default:            state_next = state_next;
    endcase
end


endmodule