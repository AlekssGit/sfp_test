module rx_2 (
		input  wire [7:0]   ff_rx_data,        // avalon_streaming_sink.data
		input  wire         ff_rx_eop,         //                      .endofpacket
		output wire         ff_rx_rdy,         //                      .ready
		input  wire         ff_rx_sop,         //                      .startofpacket
		input  wire         ff_rx_dval,        //                      .valid
		input  wire [4:0]   rx_err,            //                      .error
		output wire [24:0]  amm_addr,          //         avalon_master.address
		input  wire [255:0] amm_readdata,      //                      .readdata
		output wire [255:0] amm_writedata,     //                      .writedata
		output wire         amm_read,          //                      .read
		output wire         amm_write,         //                      .write
		output wire [31:0]  amm_byteenable,    //                      .byteenable
		output wire [6:0]   amm_burstcount,    //                      .burstcount
		input  wire         amm_readdatavalid, //                      .readdatavalid
		input  wire         amm_ready,         //                      .waitrequest
		output wire [1:0]   rx_afull_data,     //           fifo_status.data
		output wire         rx_afull_valid,    //                      .valid
		output wire         rx_afull_channel,  //                      .channel
		output wire [11:0]  size_received,     //            rx_signals.size_received
		output wire         data_saved,        //                      .data_saved
		input  wire         rst,               //                 reset.reset
		input  wire         clk_original,      //             clock_tse.clk
		input  wire         rst_n,             //           reset_board.reset
		input  wire         avalon_clk,        //             clock_ddr.clk
		input  wire         avalon_reset,      //             reset_ddr.reset
		input  wire         fifo_status_clk    //       fifo_status_clk.clk
	);
endmodule

