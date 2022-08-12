`define START_RAM_SAVE_ADDR     25'd5

module receive_packet_256
(
    input   logic           clk_original        ,
    input   logic           rst                 ,

    input   logic [7:0]     ff_rx_data          ,
    input   logic           ff_rx_eop           , 
    output  logic           ff_rx_rdy           ,
    input   logic           ff_rx_sop           ,
    input   logic           ff_rx_dval          ,
    input   logic [4:0]     rx_err              , 

    // output  logic [11:0]    size_received       ,
    // output  logic           data_saved          ,
    // output  logic [255:0]   ram_data_write      ,
    // output  logic [24:0]    ram_address_rx      ,
    // output  logic           need_write_data     ,
    // input   logic           ram_ready           , 

    //receive fifo status
    output  logic [1:0]     rx_afull_data       ,
    output  logic           rx_afull_valid      ,
    output  logic [1:0]     rx_afull_channel    ,
    input   logic           fifo_status_clk     ,


        //on chip memory avalon mm
    output  logic   [9:0]   ram_addr        ,
    // output  logic           ram_clken       ,
    output  logic           ram_chipselect  ,
    output  logic           ram_write       ,
    input   logic   [31:0]  ram_readdata    ,
    output  logic   [31:0]  ram_writedata   ,
    output  logic   [3:0]   ram_byteenable  
);

assign rx_afull_data    =   2'd0;
assign rx_afull_valid   =   1'b0;
assign rx_afull_channel =   2'd0;

assign ff_rx_rdy = 1'b1;

logic [11:0]    size_received;
logic           data_saved      ;
logic [255:0]   ram_data_write  ;
logic [24:0]    ram_address_rx  ;
logic           need_write_data ;
logic           ram_ready       ;

logic [7:0] data_received [256:0];
logic [11:0] count_received;
logic [11:0] count_saved;

logic [11:0] need_count_save;

enum int unsigned {IDLE, READ, SAVE} state, state_next;

assign ram_byteenable = 4'hf;
assign ram_addr = ram_address_rx[9:0];


always @(posedge clk_original, posedge rst) 
begin
    if(rst)
    begin
        size_received   = 12'd0;
        need_count_save = 12'd0;        
    end
    else
    begin
        if(state == SAVE)
        begin
            size_received = count_received;
            need_count_save = (size_received % 12'd4 == 12'd0) ? (size_received / 12'd4) : (size_received / 12'd4) + 12'd1;
        end
        else if(state == IDLE)
        begin
            need_count_save = 12'd0;
        end
        else
        begin
            size_received = size_received;
            need_count_save = need_count_save;
        end        
    end
end

always @(posedge clk_original, posedge rst) 
begin
    if(rst)
    begin
        count_received = 12'd0;
    end
    else
    begin
        if(ff_rx_dval)
        begin
            data_received [count_received] = ff_rx_data; 

            count_received = count_received + 12'd1;    
        end
        else if(state == IDLE)
        begin
            count_received = 12'd0;
        end
    end        
end

logic [8:0] i;

always @(posedge clk_original, posedge rst) 
begin
    if(rst)
    begin
        count_saved     = 12'd0;
        ram_address_rx  = 25'd0;
    end
    else
    begin
        if(state == SAVE)
        begin
            if(count_saved == 12'd0)
            begin
                if(ram_ready)
                begin
                    need_write_data = 1'b1;
                    count_saved++;
                end
            end
            else    if(count_saved == 12'd10)
            begin
                if(ram_ready)
                begin
                    need_write_data = 1'b1;
                    ram_address_rx  = `START_RAM_SAVE_ADDR;
                    // ram_data_write  = {save_stamp_96b, 32'd0, save_stamp_64b, 32'd0, 20'd0, size_received};    //  {243'd0,   size_received};
                    count_saved++;
                end
            end
            else if(count_saved % 12'd30 == 0)
            begin
                if(ram_address_rx < `START_RAM_SAVE_ADDR + need_count_save + 1)
                begin
                    // for(i = 9'd0; i < 9'd8; i++) 
                    // begin
                    ram_data_write[31  -:  8]  = data_received[0 + (ram_address_rx - `START_RAM_SAVE_ADDR) * 9'd4]  ;
                    ram_data_write[23  -:  8]  = data_received[1 + (ram_address_rx - `START_RAM_SAVE_ADDR) * 9'd4]  ;
                    ram_data_write[15  -:  8]  = data_received[2 + (ram_address_rx - `START_RAM_SAVE_ADDR) * 9'd4]  ;
                    ram_data_write[7   -:  8]  = data_received[3 + (ram_address_rx - `START_RAM_SAVE_ADDR) * 9'd4]  ;
                    // end
                    
                    ram_address_rx++;
                end
                count_saved++;
            end
            else
            begin
                count_saved++;
            end 
        end
        else
        begin
            need_write_data = 1'b0;
            count_saved     = 12'd0;
            ram_address_rx  = 25'd0;
        end
    end        
end

always @(posedge clk_original, posedge rst) 
begin
    if(rst)
    begin
        data_saved = 12'd0;
    end
    else
    begin
        if(state == SAVE & count_saved > 12'd2 & (count_saved/12'd30 >= (need_count_save + 12'd2)))
        begin
            data_saved = 1'b1;
        end
        else
        begin
            data_saved = 1'b0;
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
    IDLE:    state_next = (ff_rx_sop                )   ?   READ    :   IDLE    ;
    READ:    state_next = (~ff_rx_eop & ~ff_rx_dval )   ?   SAVE    :   READ    ;
    SAVE:    state_next = (data_saved               )   ?   IDLE    :   SAVE    ;
    default: state_next = IDLE;
    endcase
end

endmodule