module avalon_mm_tse_init (
    input  logic RST_I,
    input  logic CLK_I,

    //Control signals
    input  logic wr_rq,
    input  logic rd_rq,
    output logic rd_valid,
    input  logic [31:0] wr_adr,
    input  logic [31:0] rd_adr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,

    output logic action_done_d,

    //Avalone MM signals
    output logic [9:0] ADR_O,
    input  logic [31:0] DAT_I,
    output logic [31:0] DAT_O,
    output logic RD,
    output logic WR,
    input  logic BUSY    
);

enum int unsigned {IDLE, READ, WRITE} state, state_next;

logic action_done;
always @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
    begin
        action_done <= 1'b0;
    end
    else
    begin
        action_done <= action_done_d;
    end
end

assign DAT_O = wr_data;
always_comb 
begin
    case(state)
    IDLE:
    begin
        ADR_O   = 10'd0;
        RD      = 1'b0;
        WR      = 1'b0;
    end
    READ:
    begin
        ADR_O   = rd_adr[9:0];
        RD      = 1'b1;
        WR      = 1'b0;
    end
    WRITE:
    begin
        ADR_O   = wr_adr[9:0];
        RD      = 1'b0;
        WR      = 1'b1;
    end
    default:  
    begin
        ADR_O   = 10'd0;
        RD      = 1'b0;
        WR      = 1'b0;
    end
    endcase
end

logic ack_d;
logic ack;
always @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
    begin
        ack_d = 1'b0;
    end    
    else
    begin
        ack_d <= ack;
    end
end

always  @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I) 
    begin
        ack = 1'b0;
    end    
    else
    begin
        if(state == READ || state == WRITE)
            ack <= ~BUSY;
        else
            ack <= 1'b0;
    end
end

// Read valid situation

assign action_done_d = (state == READ || state == WRITE) ? ~BUSY: 1'b0;

assign rd_valid = (state == READ) ? ~BUSY: 1'b0;

assign rd_data = (~BUSY & state == READ) ? DAT_I : 32'd0;

// State machine
always_ff @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
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
    READ:       state_next = (!rd_rq || action_done_d) ? IDLE : READ; 
    WRITE:      state_next = ( !wr_rq || action_done_d) ? IDLE : WRITE;
    default:    state_next = state_next;
    endcase
end

endmodule