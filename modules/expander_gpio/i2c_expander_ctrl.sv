`define REG_ADDR        4'h0
`define REG_DATA_0      4'h1
`define REG_DATA_1      4'h2
`define REG_CTRL        4'h3
`define REG_R_DATA      4'h4

`define WAIT_TIME_VAL   32'd4000

module i2c_expander_ctrl
(
    input   logic           clk,
    input   logic           rst_n,

    input   logic           wr_reg_rq       ,
    input   logic           rd_reg_rq       ,
    input   logic   [7:0]   reg_addr        ,
    input   logic   [7:0]   reg_write_data  ,
    output  logic   [7:0]   reg_read_data   ,

    output  logic           reg_action_done ,

    output  logic [3:0]     mm_addr     ,
    output  logic           mm_read     ,
    output  logic           mm_write    ,
    output  logic [31:0]    mm_write_data,
    input   logic [31:0]    mm_read_data
);

logic reset;
assign reset = ~rst_n;

parameter DEV_ADR = 7'h20;

logic           wr_rq       ;
logic           rd_rq       ;
logic           rd_valid    ;
logic [3:0]     wr_adr      ;
logic [3:0]     rd_adr      ;
logic [31:0]    wr_data     ;
logic [31:0]    rd_data     ;
logic           action_done ;

i2c_expander_mm mm_exp
(
    .clk        (clk    ),
    .reset      (reset  ),

    //Control signals
    .wr_rq       (wr_rq   ),
    .rd_rq       (rd_rq   ),
    .rd_valid    (rd_valid),
    .wr_adr      (wr_adr  ),
    .rd_adr      (rd_adr  ),
    .wr_data     (wr_data ),
    .rd_data     (rd_data ),

    .action_done (action_done),    

    .mm_addr        (mm_addr     ),
    .mm_read        (mm_read     ),
    .mm_write       (mm_write    ),
    .mm_write_data  (mm_write_data),
    .mm_read_data   (mm_read_data)
);

enum int unsigned { IDLE, 

                    WRITE_ADR_DEV, 
                    WRITE_ADR_REG, 
                    WRITE_DATA, 
                    START_TRANSACTION,
                    READ_DATA,

                    WAIT_END_TRANSACTION,
                    WAIT_TIME,           
                    READ_CTRL           
                    } state, state_next;

logic w_r;
assign w_r = wr_reg_rq ? 1'b0 : 1'b1;

logic reset_delay;
logic [6:0] reset_delay_cnt;

assign reset_delay = reset;

// always @(posedge clk, posedge reset)
// begin
//     if(reset)
//     begin
//         reset_delay <= 1'b1;
//         reset_delay_cnt <= 7'd0;
//     end
//     else
//     begin
//         if(reset_delay)
//         begin
//             if(reset_delay_cnt == 7'd40)
//             begin
//                 reset_delay = 1'b0;
//             end
//             else
//             begin
//                 reset_delay_cnt++;
//             end
//         end
//     end
// end

logic time_passed;
logic [31:0] cnt_time;

always_ff @(posedge clk, posedge reset_delay)
begin
    if(reset_delay)
    begin
        cnt_time <= 32'd0;
    end
    else
    begin
        if(state == WAIT_TIME)
        begin
            cnt_time <= cnt_time + 32'd1;
        end
        else
        begin
            cnt_time <= 32'd0;
        end
    end
end

always_ff @(posedge clk, posedge reset_delay) 
begin
    if(reset_delay)
    begin
        wr_rq   = 1'b0;
        rd_rq   = 1'b0;
        wr_adr  = 4'd0;
        wr_data = 32'd0;
        rd_adr  = 4'd0;
    end 
    else if(action_done)
    begin
        rd_rq = 1'b0;
        wr_rq = 1'b0;
    end   
    else
    begin
        case (state)
            IDLE:
            begin
                wr_rq   = 1'b0;
                rd_rq   = 1'b0;
                wr_adr  = 4'd0;
                wr_data = 32'd0;
                rd_adr  = 4'd0;
            end                            
            WRITE_ADR_DEV:
            begin
                wr_rq   = 1'b1;
                wr_adr  = `REG_ADDR;
                wr_data = {25'd0, 7'h20};
                
                rd_rq   = 1'b0;
                rd_adr  = 4'd0; 
            end
            WRITE_ADR_REG:
            begin
                wr_rq   = 1'b1;
                wr_adr  = `REG_DATA_0;
                wr_data = {24'd0, reg_addr};
                
                rd_rq   = 1'b0;
                rd_adr  = 4'd0; 
            end
            WRITE_DATA:
            begin
                wr_rq   = 1'b1;
                wr_adr  = `REG_DATA_1;
                wr_data = {24'd0, reg_write_data};
                
                rd_rq   = 1'b0;
                rd_adr  = 4'd0; 
            end
            START_TRANSACTION:
            begin
                wr_rq   = 1'b1;
                wr_adr  = `REG_CTRL;
                wr_data = {30'd0, wr_reg_rq, 1'b1};
                
                rd_rq   = 1'b0;
                rd_adr  = 4'd0; 
            end
            READ_DATA:
            begin
                wr_rq   = 1'b0;
                wr_adr  = 4'd0;
                wr_data = 32'd0;
                
                rd_rq   = 1'b1;
                rd_adr  = `REG_R_DATA;
            end
            WAIT_END_TRANSACTION:
            begin
                
            end
            WAIT_TIME:
            begin
                time_passed = (cnt_time >= `WAIT_TIME_VAL) ? 1'b1 : 1'b0;
            end           
            READ_CTRL:
            begin
                time_passed = 1'b0;

                wr_rq   = 1'b0;
                wr_adr  = 4'd0;
                wr_data = 32'd0;
                
                rd_rq   = 1'b1;
                rd_adr  = `REG_CTRL;
            end           
            default: ;
        endcase
    end
end

assign reg_action_done = ( (state == WAIT_END_TRANSACTION && wr_reg_rq && rd_data[5] == 1'b1 ) || (state == READ_DATA && action_done) ) ? 1'b1 : 1'b0;
assign reg_read_data = (state == READ_DATA && action_done) ? rd_data[7:0] : 8'd0;//reg_read_data;

// State machine
always_ff @(posedge clk, posedge reset_delay) 
begin
    if(reset_delay)
    begin
        state <= IDLE;
    end 
    else
    begin
        state <= state_next;
    end
end

always_comb 
begin
    case (state)
    IDLE:           state_next = (wr_reg_rq || rd_reg_rq)    ?  WRITE_ADR_DEV : IDLE;
    

    WRITE_ADR_DEV:          state_next = (action_done)  ? WRITE_ADR_REG : WRITE_ADR_DEV; 
    WRITE_ADR_REG:          state_next = (action_done)  ? (wr_reg_rq) ? WRITE_DATA : START_TRANSACTION : WRITE_ADR_REG;
    WRITE_DATA:             state_next = (action_done)  ? START_TRANSACTION : WRITE_DATA;
    
    START_TRANSACTION:      state_next = (action_done)  ? READ_CTRL : START_TRANSACTION;

    WAIT_END_TRANSACTION:   state_next = (rd_data[5] == 1'b1) ? (rd_reg_rq) ? READ_DATA : IDLE : WAIT_TIME;
    WAIT_TIME:              state_next = (time_passed)  ? READ_CTRL : WAIT_TIME;
    READ_CTRL:              state_next = (action_done)  ? WAIT_END_TRANSACTION : READ_CTRL;

    
    READ_DATA:              state_next = (action_done)  ? IDLE : READ_DATA;
    default:                state_next = state_next;
    endcase
end

endmodule