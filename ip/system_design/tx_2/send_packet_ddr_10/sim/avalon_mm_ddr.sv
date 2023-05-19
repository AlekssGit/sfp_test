module avalon_mm_ddr (
    input   logic           RST_I       ,
    input   logic           CLK_I       ,

    //Control signals
    input   logic           wr_rq       ,
    input   logic           rd_rq       ,
    output  logic           rd_valid    ,
    input   logic [24:0]    wr_adr      ,
    input   logic [24:0]    rd_adr      ,
    input   logic [255:0]   wr_data     ,
    output  logic [255:0]   rd_data     ,
    input   logic [31:0]    byte_enable  ,

    output  logic           action_done,

    //Avalone MM signals
    output  logic [24:0]    amm_address_0       ,   //ADR_O       ,
    input   logic [255:0]   amm_readdata_0      ,   //DAT_I       ,
    output  logic [255:0]   amm_writedata_0     ,   //DAT_O       ,
    output  logic           amm_read_0          ,   //RD          ,
    output  logic           amm_write_0         ,   //WR          ,
    output  logic [31:0]    amm_byteenable_0    ,   //BYTE_ENABLE ,
    output  logic [6:0]     amm_burstcount_0    ,   //BURST_COUNT ,
    input   logic           amm_readdatavalid_0 ,   //RD_VALID    ,
    input   logic           amm_ready_0             //READY   
 
);

//Avalone MM signals
logic [24:0]    ADR_O       ;
logic [255:0]   DAT_I       ;
logic [255:0]   DAT_O       ;
logic           RD          ;
logic           WR          ;
logic [31:0]    BYTE_ENABLE ;
logic [6:0]     BURST_COUNT ;
logic           RD_VALID    ;
logic           READY       ;

assign BYTE_ENABLE = byte_enable;
assign BURST_COUNT = 7'd1;

assign amm_address_0        =   ADR_O               ;
assign DAT_I                =   amm_readdata_0      ;
assign amm_writedata_0      =   DAT_O               ;
assign amm_read_0           =   RD                  ;
assign amm_write_0          =   WR                  ;
assign amm_byteenable_0     =   BYTE_ENABLE         ;
assign amm_burstcount_0     =   BURST_COUNT         ;
assign RD_VALID             =   amm_readdatavalid_0 ;
assign READY                =   amm_ready_0         ;

enum int unsigned {IDLE, READ, WRITE, TEST} state, state_next;

logic rd_rq_local;
logic rd_rq_local_first;
logic wr_rq_local;
logic wr_rq_local_first;

logic [255:0]   wr_data_local;
logic [255:0]   wr_data_local_first;
logic [24:0]    wr_adr_local;
logic [24:0]    wr_adr_local_first;
logic [24:0]    rd_adr_local;
logic [24:0]    rd_adr_local_first;


always_ff @(posedge CLK_I) 
begin
    wr_rq_local_first   <= wr_rq;
    wr_rq_local         <= wr_rq_local_first;

    rd_rq_local_first   <= rd_rq;
    rd_rq_local         <= rd_rq_local_first;
end

always_ff @(posedge CLK_I) 
begin
    wr_data_local_first     <= wr_data;
    wr_data_local           <= wr_data_local_first;
end

always_ff @(posedge CLK_I) 
begin
    wr_adr_local_first  <= wr_adr;
    wr_adr_local        <= wr_adr_local_first;

    rd_adr_local_first  <= rd_adr;
    rd_adr_local        <= rd_adr_local_first;
end

logic flag_wr;
always @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
    begin
        flag_wr <= 1'b0;
    end    
    else
    begin
        if(WR & ~READY)
        begin
            flag_wr <= 1'b1;
        end
        else if(state != WRITE)
        begin
            flag_wr <= 1'b0;
        end
    end
end

logic flag_rd;
always @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
    begin
        flag_rd <= 1'b0;
    end    
    else
    begin
        if(RD & RD_VALID)
        begin
            flag_rd <= 1'b1;
        end
        else if(state != READ)
        begin
            flag_rd <= 1'b0;
        end
    end
end

always_comb 
begin
    case(state)
    IDLE:
    begin
        ADR_O   = wr_adr_local;
        RD      = 1'b0;
        WR      = 1'b0;
        DAT_O   = wr_data_local;
    end
    READ:
    begin
        ADR_O   = rd_adr_local;
        RD      = (flag_rd) ?    1'b0    :   1'b1;
        WR      = 1'b0;
        DAT_O   = wr_data_local;
    end
    WRITE:
    begin
        ADR_O   = wr_adr_local;
        RD      = 1'b0;
        WR      = (flag_wr) ?    1'b0    :   1'b1;
        DAT_O   = wr_data_local;
    end
    default:  
    begin
        ADR_O   = 25'd0;
        RD      = 1'b0;
        WR      = 1'b0;
        DAT_O   = wr_data_local;
    end
    endcase
end

//TODO Описать возникновение новой задачи на примере записи (проверять чтобы wr_rq_local опустился и только после этого будет новая задача)
logic new_task_write;
logic prev_wr_rq;

always @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
    begin
        prev_wr_rq <= 1'b0;
    end  
    else
    begin
        prev_wr_rq <= wr_rq_local; 
    end
end

always @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
    begin
        new_task_write <= 1'b0;
    end  
    else
    begin
        if(new_task_write)
        begin
            if(prev_wr_rq == 1'b1 & wr_rq_local == 1'b0)
            begin
                new_task_write <= 1'b0;
            end
            else if(state == WRITE)
            begin
                new_task_write <= 1'b0;
            end
        end
        else if(prev_wr_rq == 1'b0 & wr_rq_local == 1'b1)
        begin
            new_task_write <= 1'b1;
        end
    end  
end

logic new_task_read;
logic prev_rd_rq;

always @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
    begin
        prev_rd_rq <= 1'b0;
    end  
    else
    begin
        prev_rd_rq <= rd_rq_local; 
    end
end

always @(posedge CLK_I, posedge RST_I) 
begin
    if(RST_I)
    begin
        new_task_read <= 1'b0;
    end  
    else
    begin
        if(new_task_read)
        begin
            if(prev_rd_rq == 1'b1 & rd_rq_local == 1'b0)
            begin
                new_task_read <= 1'b0;
            end
            else if(state == READ)
            begin
                new_task_read <= 1'b0;
            end
        end
        else if(prev_rd_rq == 1'b0 & rd_rq_local == 1'b1)
        begin
            new_task_read <= 1'b1;
        end
    end  
end
logic WR_prev;
always_ff @( posedge CLK_I )
begin
    WR_prev <= WR;
end

logic action_done_d;
always_ff @( posedge CLK_I )
begin
    action_done_d <= action_done;
end

assign action_done = (state == READ || state == WRITE) ? (state == READ) ? RD_VALID : (WR_prev & ~WR /*& READY*/) : 1'b0;

//TODO Так не работает, ready может быть опущен в конце 
assign rd_valid = (state == READ ) ? READY : 1'b0;

assign rd_data = (state == READ & action_done) ? DAT_I : 256'd0;

// State machine
always @(posedge CLK_I, posedge RST_I) 
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
    IDLE:       state_next = (rd_rq_local & !RD_VALID & READY & new_task_read) ? READ : ((new_task_write & READY) ? WRITE : IDLE);
    READ:       state_next = (!rd_rq_local || action_done) ? IDLE : READ; 
    WRITE:      state_next = (!wr_rq_local || action_done) ? IDLE : WRITE;
    TEST:       state_next = TEST;
    default:    state_next = state_next;
    endcase
end

endmodule