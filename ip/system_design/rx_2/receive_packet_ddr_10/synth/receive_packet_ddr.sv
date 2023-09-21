`define START_RAM_SAVE_ADDR     25'd5

module receive_packet_ddr
(
    input   logic           clk_original        ,
    input   logic           rst                 ,

    input   logic [7:0]     ff_rx_data          ,
    input   logic           ff_rx_eop           , 
    output  logic           ff_rx_rdy           ,
    input   logic           ff_rx_sop           ,
    input   logic           ff_rx_dval          ,
    input   logic [4:0]     rx_err              , 

    output  logic [11:0]    size_received       ,
    output  logic           data_saved          ,

//TODO Разобраться с этими сигналами 
    //receive fifo status
    output  logic [1:0]     rx_afull_data       ,
    output  logic           rx_afull_valid      ,
    output  logic           rx_afull_channel    ,
    input   logic           fifo_status_clk     ,

    // // rx ingress timestamp 96b
    // input   logic           rx_ingress_timestamp_96b_valid,
    // input   logic [95:0]    rx_ingress_timestamp_96b_data,
    // // rx ingress timestamp 64b
    // input   logic           rx_ingress_timestamp_64b_valid,
    // input   logic [63:0]    rx_ingress_timestamp_64b_data,

    // // receive packet type
    // input   logic [4:0]     pkt_class_data,
    // input   logic           pkt_class_valid,

    // avalon mm ddr
    output  logic [24:0]    amm_addr                    , 
    input   logic [255:0]   amm_readdata                , 
    output  logic [255:0]   amm_writedata               , 
    output  logic           amm_read                    , 
    output  logic           amm_write                   , 
    output  logic [31:0]    amm_byteenable              , 
    output  logic [6:0]     amm_burstcount              , 
    input   logic           amm_readdatavalid           , 
    input   logic           amm_ready                   , 

    input   logic           avalon_clk                  ,
    input   logic           avalon_reset                ,

    input   logic           rst_n                                            

);

assign rx_afull_data    =   2'd0;
assign rx_afull_valid   =   1'b0;
assign rx_afull_channel =   1'b0;

assign ff_rx_rdy = 1'b1;

// Signals for ddr
//-------------------------------------------------------------------------------------------------
logic [255:0]   ram_data_write ;
logic [24:0]    ram_address_rx ;
logic           need_write_data;
logic           ram_ready      ; 

logic [255:0]   ram_data_read;
//-------------------------------------------------------------------------------------------------

logic [7:0] data_received [256:0];
logic [11:0] count_received;
logic [11:0] count_saved;

logic [11:0] need_count_save;

enum int unsigned {IDLE, READ, SAVE} state, state_next;

// logic [63:0] save_stamp_64b;
// logic [95:0] save_stamp_96b;

// always_ff @(posedge clk_original, posedge rst)
// begin
//     if(rst)
//     begin
//         save_stamp_64b  <=   64'd0;
//         save_stamp_96b  <=   96'd0;
//     end
//     else
//     begin
//         if(rx_ingress_timestamp_64b_valid)
//         begin
//             save_stamp_64b <= rx_ingress_timestamp_64b_data;
//         end
//         if(rx_ingress_timestamp_96b_valid)
//         begin
//             save_stamp_96b <= rx_ingress_timestamp_96b_data;
//         end
//     end
// end

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
            need_count_save = (size_received % 12'd32 == 12'd0) ? (size_received / 12'd32) : (size_received / 12'd32) + 12'd1;
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
                    // ram_data_write  = {save_stamp_96b, 32'd0, save_stamp_64b, 32'd0, 20'd0, size_received};
                    ram_data_write  = {243'd0,   size_received};
                    count_saved++;
                end
            end
            else if(count_saved % 12'd30 == 0)
            begin
                if(ram_address_rx < `START_RAM_SAVE_ADDR + need_count_save + 1)
                begin
                    for(i = 9'd0; i < 9'd8; i++) 
                    begin
                        ram_data_write[i * 32 + 31  -:  8]  = data_received[0 + i * 4 + (ram_address_rx - `START_RAM_SAVE_ADDR) * 9'd32]  ;
                        ram_data_write[i * 32 + 23  -:  8]  = data_received[1 + i * 4 + (ram_address_rx - `START_RAM_SAVE_ADDR) * 9'd32]  ;
                        ram_data_write[i * 32 + 15  -:  8]  = data_received[2 + i * 4 + (ram_address_rx - `START_RAM_SAVE_ADDR) * 9'd32]  ;
                        ram_data_write[i * 32 + 7   -:  8]  = data_received[3 + i * 4 + (ram_address_rx - `START_RAM_SAVE_ADDR) * 9'd32]  ;
                    end
                    
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


//control and work with ddr
//-------------------------------------------------------------------------------------------------
logic           wr_rq_avalon   ;
logic           rd_rq_avalon   ;
logic           rd_valid       ;
logic   [24:0]  wr_adr         ;
logic   [24:0]  rd_adr         ;
logic   [255:0] wr_data_avalon ;
logic   [255:0] rd_data        ;
logic   [31:0]  byte_enable    ;
logic           action_done    ;

logic local_cal_success;

external_ram_256 ddr_cntrl(
    .data                       (ram_data_write             ),    	// datain
	.q		                    (ram_data_read              ),      // dataout
	.address	                (ram_address_rx             ), 		// address
	.wren	                    (need_write_data 	        ),    	// wren
	.clock 	                    (clk_original               ),	   	// clk
	.reset	                    (~rst_n			            ),		// reset
    .ready                      (ram_ready		            ),
    .clock_50                   (clk_50			            ),

    .wr_rq_avalon               (wr_rq_avalon               ),
    .rd_rq_avalon               (rd_rq_avalon               ),
    .rd_valid                   (rd_valid                   ),
    .wr_adr                     (wr_adr                     ),
    .rd_adr                     (rd_adr                     ),
    .wr_data_avalon             (wr_data_avalon             ),
    .rd_data                    (rd_data                    ),
    .byte_enable                (byte_enable                ),
    .action_done                (action_done                ),

    .avalon_clk                 (avalon_clk                 ),
    .avalon_reset               (avalon_reset               ),
    .local_cal_success_avalon   (1'b1                       ),
    .local_cal_success          (local_cal_success          )
);

avalon_mm_ddr avalon_mm(
    .RST_I                  (avalon_reset       ),
    .CLK_I                  (avalon_clk         ),

    //Control signals
    .wr_rq                  (wr_rq_avalon       ),
    .rd_rq                  (rd_rq_avalon       ),
    .rd_valid               (rd_valid           ),
    .wr_adr                 (wr_adr             ),
    .rd_adr                 (rd_adr             ),
    .wr_data                (wr_data_avalon     ),
    .rd_data                (rd_data            ),
    .byte_enable            (byte_enable        ),
    .action_done            (action_done        ),

    //Avalone MM signals
    .amm_address_0          (amm_addr           ),
    .amm_readdata_0         (amm_readdata       ),
    .amm_writedata_0        (amm_writedata      ),
    .amm_read_0             (amm_read           ),
    .amm_write_0            (amm_write          ),
    .amm_byteenable_0       (amm_byteenable     ),
    .amm_burstcount_0       (amm_burstcount     ),
    .amm_readdatavalid_0    (amm_readdatavalid  ),
    .amm_ready_0            (amm_ready          ) 
);
//-------------------------------------------------------------------------------------------------

endmodule