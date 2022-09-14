module send_packet 
(
    input   logic           clk_original    ,
    input   logic           rst             ,

    input   logic           cmd_send        ,
    input   logic   [24:0]  start_ram_addr  ,

    // output  logic   [24:0]  ram_address_tx  ,
    // input   logic   [255:0] ram_data_read   ,
    // input   logic           ram_ready       ,

    output  logic   [7:0]   ff_tx_data      ,		
    output  logic           ff_tx_eop       ,		
    output  logic           ff_tx_err       ,			
    input   logic           ff_tx_rdy       ,		
    output  logic           ff_tx_sop       ,		
    output  logic           ff_tx_wren      ,

    //on chip memory avalon mm
    output  logic   [9:0]   ram_addr        ,
    // output  logic           ram_clken       ,
    output  logic           ram_chipselect  ,
    output  logic           ram_write       ,
    input   logic   [31:0]  ram_readdata    ,
    output  logic   [31:0]  ram_writedata   ,
    output  logic   [3:0]   ram_byteenable  ,
    input   logic           ram_waitrequest

);

enum int unsigned {IDLE, PREPARE_DATA, WRITE} state, state_next;

logic prev_cmd_send;
logic need_transmit;

logic [10:0] counter_data_write;

logic [7:0] packet_data [255:0];

logic [10:0] packet_size;
logic [10:0] count_prepare;
logic [10:0] count_prepared;
logic data_ready;

logic [10:0] need_count_avalon_st;

assign ff_tx_err    =   1'b0;
assign ff_tx_eop    = (counter_data_write == need_count_avalon_st) ? 1'b1 : 1'b0;
assign ff_tx_sop    = (counter_data_write == 11'd1) ? 1'b1 : 1'b0;
assign ff_tx_wren   = (counter_data_write >= 11'd1 & counter_data_write  <= packet_size) ? 1'b1 : 1'b0;

always@ (posedge clk_original, posedge rst)
begin
    if(rst)
    begin
       counter_data_write = 11'd0; 
    end 
    else
    begin
        if(state == WRITE)
        begin
            if(counter_data_write < need_count_avalon_st)
            begin
                if(counter_data_write >= 11'd0 & ff_tx_rdy)
                begin
                    counter_data_write = counter_data_write + 11'd1; 
                end
                else
                begin
                    counter_data_write = 11'd1;
                end 
            end
        end  
        else
        begin
            counter_data_write = 11'd0;
        end
    end   
end

always@ (posedge clk_original, posedge rst) 
begin
    if(rst)
    begin
        prev_cmd_send = 1'b0;
    end    
    else
    begin
        if(cmd_send)
        begin
            prev_cmd_send = cmd_send;
        end
        else
        begin
            if(prev_cmd_send)
            begin
                need_transmit = 1'b1;
                prev_cmd_send = 1'b0;
            end
            else
            begin
                need_transmit = 1'b0;
            end
        end
    end
end

logic ram_ready_local;
assign ram_ready_local = 1'b1;
// logic ram_ready_local_first;
// logic ram_ready_local_second;
// logic ram_ready_local_third;

// always_ff @(posedge clk_original)
// begin
//     ram_ready_local_first    <= ram_ready;
//     ram_ready_local_second   <= ram_ready_local_first;
//     ram_ready_local_third    <= ram_ready_local_second;
//     ram_ready_local          <= ram_ready_local_third;
// end

logic [255:0]   ram_data_read_local;
// logic [255:0]   ram_data_read_local_first;
 
// always_ff @(posedge clk_original)
// begin
//     ram_data_read_local_first    <= ram_data_read;
//     ram_data_read_local          <= ram_data_read_local_first;
// end

logic [24:0]    ram_address_tx_local;
 
// always_ff @(posedge clk_original) 
// begin
//     ram_address_tx    <= ram_address_tx_local;
// end
     
// assign  ram_clken                   =   1'b1;
assign  ram_write                   =   1'b0;
assign  ram_data_read_local[31 : 0] =   ram_readdata;   
assign  ram_writedata               =   32'd0;  
assign  ram_byteenable              =   4'hf;

assign ram_addr = ram_address_tx_local[9:0];
logic [24:0] ram_addr_prev;


always @(posedge clk_original, posedge rst) 
begin
    if(rst)
    begin
      ram_addr_prev = 25'd0;
    end
    else
    begin
      if(ram_address_tx_local != ram_addr_prev)
      begin
        ram_chipselect = 1'b1;
        ram_addr_prev = ram_address_tx_local;
      end
      else
      begin
        ram_chipselect = 1'b0;
      end
    end 
end

logic wait_data_flag;
logic [24:0] address_wait;

always@ (posedge clk_original, posedge rst)
begin
    if(rst)
    begin
        wait_data_flag = 1'b0;
        address_wait = 25'd0;
    end
    else
    begin
        if(/*~ram_ready_local & */ address_wait != ram_address_tx_local & state == PREPARE_DATA & ram_address_tx_local > 25'd0)
        begin
            wait_data_flag = 1'b1;
            address_wait = ram_address_tx_local;
        end
        else if(wait_data_flag & /* ram_ready_local & */ address_wait < ram_address_tx_local & state == PREPARE_DATA)
        begin
            wait_data_flag = 1'b0;
        end
        else if(state != PREPARE_DATA)
        begin
            wait_data_flag = 1'b0;
        end
    end
end

logic [9:0] count_prepare_wait;

always@ (posedge clk_original, posedge rst)
begin
    if(rst)
    begin
        count_prepare_wait = 10'd0;
    end    
    else
    begin
        if(state == PREPARE_DATA & count_prepare_wait < 10'd25)
        begin
            count_prepare_wait++;
        end
        else
        begin
            count_prepare_wait = 10'd0;
        end
    end
end

logic [7:0] need_count_prepare; 

logic [8:0] i;

always@ (posedge clk_original, posedge rst)
begin
    if(rst)
    begin
        data_ready = 1'b0;
        packet_size = 11'd0;
        need_count_avalon_st = 11'd0;
        count_prepared = 11'd0;
        ram_address_tx_local = 25'd0;
        for(i = 9'd0; i < 9'd256; i++) packet_data[i] = 7'd0;
    end
    else
    begin
        if(state == PREPARE_DATA)
        begin
            if(ram_address_tx_local == 25'd0 & count_prepare_wait >= 10'd20)
            begin
                data_ready = 1'b0;
                if(ram_ready_local)
                begin
                    ram_address_tx_local = start_ram_addr; 
                end
            end
            else if(wait_data_flag & ram_address_tx_local == start_ram_addr)
            begin
                if(ram_ready_local)
                begin
                    packet_size = ram_data_read_local[10:0];
                    if(packet_size > 0)
                    begin
                        need_count_prepare = (packet_size % 8'd4 == 0) ? packet_size/8'd4 : packet_size/8'd4 + 8'd1;
                        need_count_avalon_st = packet_size;
                        count_prepared = 11'd0;
                        ram_address_tx_local = start_ram_addr + 25'd1;
                    end
                end
            end
            else if(wait_data_flag & ram_address_tx_local > start_ram_addr & address_wait == ram_address_tx_local)
            begin
                if(ram_ready_local)
                begin
                    // for(i = 9'd0; i < 9'd8; i++) 
                    // begin
                        packet_data[1 + 0 + /*i * 4*/ + count_prepared * 9'd4] = ram_data_read_local[/*i * 32 + */ 31  -:  8];
                        packet_data[1 + 1 + /*i * 4*/ + count_prepared * 9'd4] = ram_data_read_local[/*i * 32 + */ 23  -:  8];
                        packet_data[1 + 2 + /*i * 4*/ + count_prepared * 9'd4] = ram_data_read_local[/*i * 32 + */ 15  -:  8];
                        packet_data[1 + 3 + /*i * 4*/ + count_prepared * 9'd4] = ram_data_read_local[/*i * 32 + */ 7   -:  8];
                    // end
                    
                    count_prepared++;

                    if(count_prepared < need_count_prepare)
                    begin
                        ram_address_tx_local++;
                    end
                    else
                    begin
                        data_ready = 1'b1;
                    end 
                end
            end
            else if(count_prepare_wait < 10'd20 & ram_address_tx_local == 25'd0)
            begin
                ram_address_tx_local = 25'd0;
            end
        end
        else
        begin
            ram_address_tx_local = 25'd0;
            data_ready = 1'b0;
        end
    end
end

always @(posedge clk_original, posedge rst) 
begin
    if(rst)
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
    IDLE:           state_next = (need_transmit )   ? PREPARE_DATA  : IDLE          ;
    PREPARE_DATA:   state_next = (data_ready    )   ? WRITE         : PREPARE_DATA  ;
    WRITE:          state_next = (ff_tx_eop     )   ? IDLE          : WRITE         ;
    default:        state_next = IDLE;
    endcase
end

assign ff_tx_data = packet_data [counter_data_write];
endmodule