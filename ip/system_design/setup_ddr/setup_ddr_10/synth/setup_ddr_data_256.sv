module setup_ddr_data_256
(
    input   logic clk,      // clk_125_tx_rx
    input   logic reset,    // from reset module

    output  logic setup_done,

    // interface signals
    output  logic [24:0]    amm_addr           , 
    input   logic [255:0]   amm_readdata       , 
    output  logic [255:0]   amm_writedata      , 
    output  logic           amm_read           , 
    output  logic           amm_write          , 
    output  logic [31:0]    amm_byteenable     , 
    output  logic [6:0]     amm_burstcount     , 
    input   logic           amm_readdatavalid  , 
    input   logic           amm_ready          , 

    input   logic           avalon_clk      ,
    input   logic           avalon_reset    ,
    input   logic           local_cal_success_avalon,
    input   logic           local_cal_fail_avalon,
    
    output  logic           reset_local_cal_success,

    input   logic           rst_n,
    input   logic           ram_ready,
    input   logic           clk_50,

    output  logic           ddr_local_cal_success,
    output  logic           ddr_local_cal_fail,
    output  logic           system_main_reset,
    output  logic           ddr_avalon_rst,
    output  logic           board_reset
);

assign system_main_reset = reset;

assign reset_local_cal_success = local_cal_success_avalon;
assign ddr_avalon_rst = avalon_reset;
assign board_reset = rst_n;

always_ff @(posedge avalon_clk, posedge avalon_reset)
begin
    if(avalon_reset)
    begin
        ddr_local_cal_success   <= 1'b0;
        ddr_local_cal_fail      <= 1'b0;
    end
    else
    begin
        ddr_local_cal_success   <= local_cal_success_avalon;
        ddr_local_cal_fail      <= local_cal_fail_avalon;
    end
end
// assign ddr_local_cal_success   = local_cal_success_avalon;
// assign ddr_local_cal_fail      = local_cal_fail_avalon;

logic [255:0]    data ;
logic [24:0]     addr ;

logic need_setup;

always_ff @(posedge clk, posedge reset) 
begin
    if(reset)
    begin
        need_setup <= 1'b1;
    end    
    else
    begin
        need_setup <= (setup_done) ? 1'b0 : need_setup;
    end
end

logic [31:0]    ram_data_read;
logic [9:0]     ram_address;

// ram_packets	ram_inst 
// (
// 	.data		(32'd0	        ),    	//    data.datain
// 	.q			(ram_data_read	),      //       q.dataout
// 	.address	(ram_address	), 		// address.address
// 	.wren		(1'b0		    ),    	//    wren.wren
// 	.clock 		(clk        	)   	//   clock.clk
// );

logic [15:0]    count_data;
logic [15:0]     wait_data;

logic [255:0] ddr_data;
logic [3:0] count_ram_data;

logic [31:0] test_data  [28] = '{   32'd0, 
                                    32'h00000040,
                                    32'h000014CC,
                                    32'h2005BF6B,
                                    32'h1322AABB,
                                    32'hFF110800,
                                    32'h4500002E,
                                    32'h00004000,
                                    32'h4011F8CB,
                                    32'hA9FE76FA,
                                    32'hA9FE76FC,
                                    32'h00000000,
                                    32'h001ABDC6,
                                    32'h00EF1256,
                                    32'h34CCAB00,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000,
                                    32'h00000000
                                     };
assign ram_data_read = test_data[ram_address];

always_comb 
begin
    case(count_ram_data)
    4'd1:       ddr_data = {224'd0  , ram_data_read};                  
    4'd2:       ddr_data = {192'd0  , ram_data_read , ddr_data[31:0]}; 
    4'd3:       ddr_data = {160'd0  , ram_data_read , ddr_data[63:0]}; 
    4'd4:       ddr_data = {128'd0  , ram_data_read , ddr_data[95:0]}; 
    4'd5:       ddr_data = {96'd0   , ram_data_read , ddr_data[127:0]};
    4'd6:       ddr_data = {64'd0   , ram_data_read , ddr_data[159:0]};
    4'd7:       ddr_data = {32'd0   , ram_data_read , ddr_data[191:0]};
    4'd8:       ddr_data = {ram_data_read, ddr_data[223:0]};      
    // 4'd8:       ddr_data = ddr_data;      
    default:        ddr_data = 256'd0;     
    endcase        
end

always_comb
begin
    if(count_data == 16'd1 ) //| count_data == 16'd2)
    begin
        data = {224'd0, ram_data_read};
    end
    else
    begin
        if(count_ram_data == 4'd8 )
        begin
            data = ddr_data;  
        end      
        else
        begin
            data = data;
        end
    end
end

always_ff @(posedge clk, posedge reset) 
begin
    if(reset)
    begin
        wait_data   <=   16'd1   ;
        count_data  <=   16'd0   ;
        setup_done  <=   1'b0    ;
        ram_address <=   10'd0   ;
        addr        <=   25'd0   ;
        // data        <=   256'd0  ;
        count_ram_data <= 4'd0;
    end    
    else
    begin
        if(count_data <= 16'd3 & need_setup)
        begin
            setup_done <= 1'b0;
            if(wait_data % 16'd60 == 16'd0)
            begin
                // wait_data <= 16'd1;

                // if(count_data == 16'd0)
                // begin
                //     wait_data <= 16'd1;
                //     count_data <= count_data + 16'd1;
                //     ram_address <= count_data[9:0]; // + 10'd1;
                // end
                // else 
                if(count_data == 16'd0)
                begin
                    wait_data <= 16'd1;
                    count_data <= count_data + 16'd1; // ???
                    // ddr_data <= {224'd0, ram_data_read};
                    // data    <=   {224'd0, ram_data_read}; // ???
                    addr    <=   {15'd0, ram_address + 10'd1};
                    ram_address <= count_data[9:0] + 10'd1; // ???
                end
                else //if (count_data == 16'd2 | count_data == 16'd3)
                begin
                    // case(count_ram_data)
                    // 4'd0:   ddr_data <= {224'd0  , ram_data_read};                  
                    // 4'd1:   ddr_data <= {192'd0  , ram_data_read , ddr_data[31:0]}; 
                    // 4'd2:   ddr_data <= {160'd0  , ram_data_read , ddr_data[63:0]}; 
                    // 4'd3:   ddr_data <= {128'd0  , ram_data_read , ddr_data[95:0]}; 
                    // 4'd4:   ddr_data <= {96'd0   , ram_data_read , ddr_data[127:0]};
                    // 4'd5:   ddr_data <= {64'd0   , ram_data_read , ddr_data[159:0]};
                    // 4'd6:   ddr_data <= {32'd0   , ram_data_read , ddr_data[191:0]};
                    // 4'd7:   ddr_data <= {ram_data_read, ddr_data[223:0]};           
                    // endcase
                    if(count_ram_data == 4'd0)
                    begin
                        count_data <= count_data + 16'd1;
                    end

                    if (count_ram_data == 4'd0) //(count_data == 10'd1)
                    begin
                        ram_address <=   10'd1 + {6'd0, count_ram_data + 4'd1} + ((count_data[9:0] - 10'd1) << 3);
                    end
                    else
                    begin
                        ram_address <=   10'd1 + {6'd0, count_ram_data + 4'd1} + ((count_data[9:0] - 10'd2) << 3);
                    end
                    
                    count_ram_data <= count_ram_data + 4'd1; // ???
                end
                // else
                // begin
                    
                // end

                if(count_ram_data == 4'd7) // 4'd8
                begin
                    wait_data <= 16'd1;
                    // count_ram_data <= 4'd0;
                    // data    <=   ddr_data;
                    // addr    <=   {15'd0, count_data};
                    // count_data <= count_data + 16'd1; // ???
                end
            end
            else
            begin
                wait_data <= wait_data + 16'd1; // ???
                
                if(wait_data == 16'd10 & count_data > 16'd0 & count_ram_data == 4'd8)
                begin
                    count_ram_data <= 4'd0;
                    addr    <=   {15'd0, count_data}; // + 16'd1};
                    // count_data <= count_data + 16'd1; // ???
                end
            end
        end
        else if(count_data == 16'd100)
        begin
            setup_done <= 1'b1;
        end
        else if(need_setup)
        begin
            count_data <= count_data + 16'd1; // ???
        end
        else
        begin
            count_data = 16'd0;
        end
    end
end

logic           wr_rq_avalon   ;
logic           rd_rq_avalon   ;
logic           rd_valid       ;
logic   [24:0]  wr_adr         ;
logic   [24:0]  rd_adr         ;
logic   [255:0] wr_data_avalon ;
logic   [255:0] rd_data        ;
logic   [31:0]  byte_enable    ;
logic           action_done    ;

logic [255:0] read_data;

logic local_cal_success;

external_ram_256 ddr_cntrl(
    .data                       (data                       ),    	// datain
	.q		                    (read_data	                ),      // dataout
	.address	                (addr   	                ), 		// address
	.wren	                    (~setup_done	            ),    	// wren
	.clock 	                    (clk        	            ),	   	// clk
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

    .avalon_clk                 (avalon_clk                 ),  // (ddr_avalon_clk             ),
    .avalon_reset               (avalon_reset               ),  // (ddr_avalon_rst             ),
    .local_cal_success_avalon   (local_cal_success_avalon   ),
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

endmodule