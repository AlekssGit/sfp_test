`include "sfp_test_top.sv"

module expander_top 
(
    input logic clk_50,
    input logic rst_n,

    input logic clk_i2c,

    inout tri1 i2c_scl,
    inout tri1 i2c_sda
);

logic   sfp_rled    ;
logic   sfp_gled    ;
logic   sfp_txdis   ;
logic   sfp_txflt   ;
logic   sfp_rs1     ;
logic   sfp_rlos    ;
logic   sfp_rs0     ;
logic   sfp_prsn    ;

logic   need_write_reg_o;
logic   need_read_reg_i;
logic   need_read_reg_o;
logic   dev_ready;

i2c_expander_sfp expander_device
(
    // Clock module
    .clk                (clk_50 ),
    // Reset module
    .rst_n              (rst_n      ),

    // Clock for i2c, frquency is scl*2
    .clk_i2c            (clk_i2c    ),

    //  i2c wires
    .i2c_scl            (i2c_scl  ),
    .i2c_sda            (i2c_sda  ),

    //  Expander GPIO
    .sfp_rled           (sfp_rled   ),
    .sfp_gled           (sfp_gled   ),
    .sfp_txdis          (sfp_txdis  ),
    .sfp_txflt          (sfp_txflt  ),
    .sfp_rs1            (sfp_rs1    ),
    .sfp_rlos           (sfp_rlos   ),
    .sfp_rs0            (sfp_rs0    ),
    .sfp_prsn           (sfp_prsn   ),

    // Control conduit
    .need_write_reg_o   (need_write_reg_o),
    .need_read_reg_i    (need_read_reg_i ),
    .need_read_reg_o    (need_read_reg_o ),
    .ready              (dev_ready       )
);

assign sfp_rled     = ~sfp_gled;
assign sfp_txdis    = 1'b0;
assign sfp_rs1      = 1'b0;
assign sfp_rs0      = 1'b0;

logic [31:0] timer;
logic [31:0] timer_relax;

enum int unsigned { IDLE, WAIT_TIMER, WRITE_O, RELAX_1, READ_I, RELAX_2, READ_O } state, state_next, state_prev;

logic dev_ready_prev;

always_ff @(posedge clk_50, negedge rst_n)
begin
    if(~rst_n)
    begin
        dev_ready_prev <= 1'b0;
    end
    else
    begin
        dev_ready_prev <= dev_ready;
    end
end

always_ff @(posedge clk_50, negedge rst_n)
begin
    if(~rst_n)
    begin
        state <= IDLE;
    end
    else
    begin
        state <= state_next;
    end
end

always_ff @(posedge clk_50, negedge rst_n)
begin
    if(~rst_n)
    begin
        state_prev <= IDLE;
    end
    else
    begin
        state_prev <= state;
    end
end

always_comb
begin
    case(state)
    IDLE:       state_next  =   (dev_ready                                  )   ?   WAIT_TIMER  :   IDLE;
    WAIT_TIMER: state_next  =   (timer == `TIME_TO_BLINK && dev_ready       )   ?   WRITE_O     :   WAIT_TIMER;
    WRITE_O:    state_next  =   (dev_ready && ~dev_ready_prev               )   ?   /*READ_I*/ RELAX_1      :   WRITE_O;
    RELAX_1:    state_next  =   (timer_relax == `RELAX_TIME && dev_ready    )   ?   READ_I     :   RELAX_1;
    READ_I:     state_next  =   (dev_ready && ~dev_ready_prev               )   ?   /*READ_O*/ RELAX_2      :   READ_I;
    RELAX_2:    state_next  =   (timer_relax == `RELAX_TIME && dev_ready    )   ?   READ_O     :   RELAX_2;
    READ_O:     state_next  =   (dev_ready && ~dev_ready_prev               )   ?   IDLE        :   READ_O;

    default: ;
    endcase
end

always_ff @(posedge clk_50, negedge rst_n)
begin
    if(~rst_n)
    begin
        timer_relax <= 32'd0;
    end
    else
    begin
        if(state == RELAX_1 || state == RELAX_2)
        begin
            if(timer_relax > `RELAX_TIME + 32'd1000)
            begin
                timer_relax <= 32'd0;
            end
            else
            begin
                timer_relax <= timer_relax + 32'd1;
            end
        end
        else
        begin
            timer_relax <= 32'd0;
        end
    end
end

always_ff @(posedge clk_50, negedge rst_n)
begin
    if(~rst_n)
    begin
        timer <= 32'd0;
    end
    else
    begin
        if(state == WAIT_TIMER)
        begin
            if(timer > `TIME_TO_BLINK + 32'd1000)
            begin
                timer <= 32'd0;
            end
            else
            begin
                timer <= timer + 32'd1;
            end
        end
        else
        begin
            timer <= 32'd0;
        end
    end
end

always_ff @(posedge clk_50, negedge rst_n)
begin
    if(~rst_n)
    begin
        sfp_gled <= 1'b1;
    end
    else
    begin
        sfp_gled <= (timer == `TIME_TO_BLINK/32'd2) ? ~sfp_gled : sfp_gled;
    end
end

always_ff @(posedge clk_50, negedge rst_n)
begin
    if(~rst_n)
    begin
        need_write_reg_o <= 1'b0;
        need_read_reg_o  <= 1'b0;
        need_read_reg_i  <= 1'b0;
    end
    else if(~dev_ready && (state == WRITE_O || state == READ_O || state == READ_I ))
    begin
        need_write_reg_o <= 1'b0;
        need_read_reg_o  <= 1'b0;
        need_read_reg_i  <= 1'b0;        
    end
    else
    begin
        if(state == WRITE_O)
        begin
            need_write_reg_o <= state_prev == WAIT_TIMER;    //1'b1;
            need_read_reg_o  <= 1'b0;
            need_read_reg_i  <= 1'b0;            
        end
        else if(state == READ_I)
        begin
            need_write_reg_o <= 1'b0;
            need_read_reg_o  <= 1'b0;
            need_read_reg_i  <= state_prev == RELAX_1;  //1'b1;
        end         
        else if(state == READ_O)
        begin
            need_write_reg_o <= 1'b0;
            need_read_reg_o  <= state_prev == RELAX_2;   //1'b1;
            need_read_reg_i  <= 1'b0;
        end        
        else
        begin
            need_write_reg_o <= 1'b0;
            need_read_reg_o  <= 1'b0;
            need_read_reg_i  <= 1'b0;
        end
    end
end

endmodule