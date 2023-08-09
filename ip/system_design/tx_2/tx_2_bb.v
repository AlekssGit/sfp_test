module tx_2 #(
		parameter COUNT_PREPARE_WAIT_VAL = 80
	) (
		output wire [24:0]  amm_addr,          //           avalon_master.address
		input  wire [255:0] amm_readdata,      //                        .readdata
		output wire [255:0] amm_writedata,     //                        .writedata
		output wire         amm_read,          //                        .read
		output wire         amm_write,         //                        .write
		output wire [31:0]  amm_byteenable,    //                        .byteenable
		output wire [6:0]   amm_burstcount,    //                        .burstcount
		input  wire         amm_readdatavalid, //                        .readdatavalid
		input  wire         amm_ready,         //                        .waitrequest
		input  wire         clk_50,            //                clock_50.clk
		input  wire         rst_n,             //             reset_board.reset
		input  wire         avalon_clk,        //               clock_ddr.clk
		input  wire         clk_original,      //               clock_tse.clk
		input  wire         rst,               //                   reset.reset
		output wire [7:0]   ff_tx_data,        // avalon_streaming_source.data
		output wire         ff_tx_eop,         //                        .endofpacket
		output wire         ff_tx_err,         //                        .error
		input  wire         ff_tx_rdy,         //                        .ready
		output wire         ff_tx_sop,         //                        .startofpacket
		output wire         ff_tx_wren,        //                        .valid
		input  wire         avalon_reset,      //               reset_ddr.reset
		input  wire [24:0]  start_ram_addr,    //                 control.start_ram_addr
		input  wire         cmd_send           //                        .cmd_send
	);
endmodule

