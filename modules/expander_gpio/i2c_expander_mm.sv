module i2c_expander_mm
(
    input logic  clk,
    input logic  reset,

    //Control signals
    input   logic           wr_rq       ,
    input   logic           rd_rq       ,
    output  logic           rd_valid    ,
    input   logic [3:0]     wr_adr      ,
    input   logic [3:0]     rd_adr      ,
    input   logic [31:0]    wr_data     ,
    output  logic [31:0]    rd_data     ,

    output  logic           action_done ,    

    // input   logic           irq         ,

    output  logic [3:0]     mm_addr     ,
    output  logic           mm_read     ,
    output  logic           mm_write    ,
    output  logic [31:0]    mm_write_data,
    input   logic [31:0]    mm_read_data

);

enum int unsigned {IDLE, READ, READ_WAIT, WRITE, WAIT_RESET_RQ} state, state_next;

assign mm_write_data = wr_data;

always_comb 
begin
    case(state)
    IDLE:
    begin
        mm_addr   = 4'd0;
        mm_read   = 1'b0;
        mm_write  = 1'b0;
    end
    READ:
    begin
        mm_addr   = rd_adr;
        mm_read   = 1'b1;
        mm_write  = 1'b0;
    end
    READ_WAIT:
    begin
        mm_addr   = 4'd0;
        mm_read   = 1'b0;
        mm_write  = 1'b0;
    end
    WRITE:
    begin
        mm_addr   = wr_adr;
        mm_read   = 1'b0;
        mm_write  = 1'b1;
    end
    WAIT_RESET_RQ:
    begin
        mm_addr   = 4'd0;
        mm_read   = 1'b0;
        mm_write  = 1'b0;
    end
    default:  
    begin
        mm_addr   = 4'd0;
        mm_read   = 1'b0;
        mm_write  = 1'b0;
    end
    endcase
end

// Read valid situation

logic [3:0] read_wait_cnt;
always_ff @(posedge clk, posedge reset)
begin
    if(reset)
    begin
        read_wait_cnt <= 4'd0;
    end
    else
    begin
        read_wait_cnt <= (state == READ_WAIT) ? read_wait_cnt + 4'd1 : 4'd0;
    end
end


assign action_done = ((state == READ_WAIT && read_wait_cnt == 4'd1) || state == WRITE) ? 1'b1: 1'b0;
// assign action_done = ((state == READ_WAIT && read_wait_cnt >= 4'd1) || state == WRITE) ? 1'b1: 1'b0;

// logic mm_read_valid;
// assign mm_read_valid = (state == READ_WAIT && read_wait_cnt == 4'd1) ? 1'b1: 1'b0;

assign rd_data = mm_read_data; // (mm_read_valid) ? mm_read_data : 32'd0;

// always_ff @(posedge clk, posedge reset) 
// begin
//     if(reset)
//     begin
//         rd_data <= 32'd0;
//     end 
//     else
//     begin
//         rd_data <= mm_read_data;
//     end
// end

// State machine
always_ff @(posedge clk, posedge reset) 
begin
    if(reset)
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
    IDLE:       state_next = (rd_rq) ? READ : ((wr_rq) ? WRITE : IDLE);
    READ:       state_next = READ_WAIT;//(!rd_rq || action_done) ? READ_WAIT : READ; 
    READ_WAIT:  state_next = (/*!rd_rq ||*/ action_done) ? /*IDLE*/WAIT_RESET_RQ : READ_WAIT; 
    WRITE:      state_next = (/*!wr_rq ||*/ action_done) ? /*IDLE*/WAIT_RESET_RQ : WRITE;

    WAIT_RESET_RQ: state_next = (!rd_rq && !wr_rq) ? IDLE : WAIT_RESET_RQ;

    default:    state_next = state_next;
    endcase
end

endmodule