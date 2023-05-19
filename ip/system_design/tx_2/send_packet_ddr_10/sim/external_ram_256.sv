module external_ram_256
(
	input 	logic [255:0]  	data    ,    	// datain
	output	logic [255:0]  	q		,      	// dataout
	input 	logic [24:0]	address	, 		// address
	input 	logic 			wren	,    	// wren
	input 	logic 			clock 	,	   	// clk
	input	logic			reset	,		// reset
    output  logic           ready   ,
    input   logic           clock_50,

    output  logic           wr_rq_avalon   ,
    output  logic           rd_rq_avalon   ,
    input   logic           rd_valid       ,
    output  logic   [24:0]  wr_adr         ,
    output  logic   [24:0]  rd_adr         ,
    output  logic   [255:0] wr_data_avalon ,
    input   logic   [255:0] rd_data        ,
    output  logic   [31:0]  byte_enable    ,
    input   logic           action_done    ,

    input   logic           avalon_clk      ,
    input   logic           avalon_reset    ,
    input   logic           local_cal_success_avalon,
    output  logic           local_cal_success
);

logic [24:0]	prev_address;
logic address_changed;

logic write_cmd;
logic read_cmd;

logic wr_rq   ;
logic rd_rq   ;
logic [255:0]   wr_data ;

assign byte_enable = 32'hffffffff;

logic action_done_latch;

logic   wr_rq_clock;
logic   rd_rq_clock;

always_ff @(posedge clock) 
begin
    wr_rq_clock      <=  wr_rq           ;

    rd_rq_clock      <=  rd_rq           ;
end

logic wr_rq_avalon_1;
// logic wr_rq_avalon;
logic rd_rq_avalon_1;
// logic rd_rq_avalon;
logic write_cmd_avalon_1;
logic write_cmd_avalon;

always_ff @(posedge avalon_clk) 
begin
    wr_rq_avalon_1      <=  wr_rq_clock     ;
    wr_rq_avalon        <=  wr_rq_avalon_1  ;

    rd_rq_avalon_1      <=  rd_rq_clock     ;
    rd_rq_avalon        <=  rd_rq_avalon_1  ;
end

logic prev_act_done;

always_ff @(posedge avalon_clk, posedge avalon_reset) 
begin
    if(avalon_reset)
    begin
        action_done_latch <= 1'b0;
        prev_act_done <= 1'b0;
    end
    else
    begin
        if(action_done)
        begin
            action_done_latch <= action_done;
            prev_act_done <= action_done;
        end   
        else if(prev_act_done)
        begin
            prev_act_done <= 1'b0;
        end
        else
        begin
            action_done_latch <= 1'b0;
        end
    end
end

logic action_done_latch_local;
logic action_done_latch_local_first;
always_ff @(posedge clock) 
begin
    action_done_latch_local_first <= action_done_latch;
    action_done_latch_local <= action_done_latch_local_first;
end

logic action_done_latch_local_prev;
always_ff @( posedge clock ) 
begin
    action_done_latch_local_prev <= action_done_latch_local;    
end

logic [255:0] rd_data_local;
logic [255:0] rd_data_local_first;
logic [255:0] rd_data_avalon;
always_ff @(posedge avalon_clk) 
begin
    if(action_done)
        rd_data_avalon <= rd_data;
    else
        rd_data_avalon <= rd_data_avalon;
end

always_ff @(posedge clock) 
begin
    if(action_done_latch_local)
    begin
       rd_data_local_first <= rd_data_avalon; 
    end
end

always_ff @( posedge clock ) 
begin
    wr_data_avalon <= wr_data;
end

logic [255:0] q_local;
always_ff @( posedge clock ) 
begin
    q <= q_local;
end

logic [24:0] address_local;
always_ff @( posedge clock ) 
begin
    address_local <= address;
end

always @(posedge clock, posedge reset) 
begin
    if(reset)
    begin
        wr_rq       <= 1'b0      ;
        rd_rq       <= 1'b0      ;
        wr_adr      <= 25'd0     ; 
        rd_adr      <= 25'd0     ;
        wr_data     <= 256'd0    ;   
        q_local     <= 256'd0    ;     
        ready       <= 1'b1      ;  
    end
    else if(action_done_latch_local_prev)
    begin        
        ready <= 1'b1;
        if(rd_rq)
        begin
            q_local <= rd_data_local_first;
        end
        rd_rq <= 1'b0;
        wr_rq <= 1'b0;
    end 
    else
    begin
        if(write_cmd)
        begin
            ready <= 1'b0;
            if(wr_rq == 1'b0)
            begin
                wr_rq   <= 1'b1;
                wr_adr  <= address_local;
                wr_data <= data;
            end
        end
        else if(read_cmd)
        begin
            ready <= 1'b0;
            if(rd_rq == 1'b0)
            begin
                rd_rq   <= 1'b1;
                rd_adr  <= address_local;
            end
        end
    end
end

always@(posedge clock, posedge reset)
begin
	if(reset)
	begin
		address_changed <= 	1'b0;
		prev_address	<=	25'd0;
	end
	else
	begin
		if(prev_address != address_local)
		begin
			prev_address <= address_local;
			address_changed <= 1'b1;
		end
		else
		begin
            address_changed <= 1'b0;
		end
	end
end

logic local_cal_success_local_first;

logic local_cal_success_avalon_1;

always_ff @(posedge clock_50) 
begin
    local_cal_success_local_first   <= local_cal_success_avalon_1;
    local_cal_success         <= local_cal_success_local_first;
end

always_ff @(posedge avalon_clk) 
begin
    local_cal_success_avalon_1 <= local_cal_success_avalon;
end

always @(posedge clock, posedge reset) 
begin
    if(reset)
    begin
        write_cmd    <= 1'b0;  
    end 
    else
    begin
		if(local_cal_success_avalon)
		begin
			if(address_changed & ~write_cmd & wren)
			begin
                if(ready)
                begin
                    write_cmd <= 1'b1;    
                end			
			end
			else
			begin
				write_cmd <= 1'b0;
			end
		end   
    end   
end

always @(posedge clock, posedge reset) 
begin
    if(reset)
    begin
        read_cmd	<=	1'b0;  
    end 
    else
    begin
		if(local_cal_success_avalon)
		begin
			if(address_changed & ~read_cmd & ~wren)
			begin
				read_cmd <= 1'b1;
			end
			else
			begin
				read_cmd <= 1'b0;
			end
		end   
    end   
end
endmodule