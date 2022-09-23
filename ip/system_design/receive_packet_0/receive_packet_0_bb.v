module receive_packet_0 (
		input  wire [7:0]  ff_rx_data,       // avalon_streaming_sink.data
		input  wire        ff_rx_eop,        //                      .endofpacket
		output wire        ff_rx_rdy,        //                      .ready
		input  wire        ff_rx_sop,        //                      .startofpacket
		input  wire        ff_rx_dval,       //                      .valid
		input  wire [4:0]  rx_err,           //                      .error
		output wire [9:0]  ram_addr,         //         avalon_master.address
		output wire        ram_chipselect,   //                      .chipselect
		output wire        ram_write,        //                      .write
		input  wire [31:0] ram_readdata,     //                      .readdata
		output wire [31:0] ram_writedata,    //                      .writedata
		output wire [3:0]  ram_byteenable,   //                      .byteenable
		input  wire        ram_waitrequest,  //                      .waitrequest
		input  wire        clk_original,     //                 clock.clk
		input  wire        rst,              //                 reset.reset
		output wire [1:0]  rx_afull_data,    //           fifo_status.data
		output wire        rx_afull_valid,   //                      .valid
		output wire [1:0]  rx_afull_channel, //                      .channel
		input  wire        fifo_status_clk,  //       fifo_status_clk.clk
		output wire        data_saved        //            data_saved.data_saved
	);
endmodule

