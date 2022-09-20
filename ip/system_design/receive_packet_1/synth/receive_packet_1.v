// receive_packet_1.v

// Generated using ACDS version 21.4 67

`timescale 1 ps / 1 ps
module receive_packet_1 (
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
		input  wire        fifo_status_clk   //       fifo_status_clk.clk
	);

	receive_packet_256 receive_packet_1 (
		.ff_rx_data       (ff_rx_data),       //   input,   width = 8, avalon_streaming_sink.data
		.ff_rx_eop        (ff_rx_eop),        //   input,   width = 1,                      .endofpacket
		.ff_rx_rdy        (ff_rx_rdy),        //  output,   width = 1,                      .ready
		.ff_rx_sop        (ff_rx_sop),        //   input,   width = 1,                      .startofpacket
		.ff_rx_dval       (ff_rx_dval),       //   input,   width = 1,                      .valid
		.rx_err           (rx_err),           //   input,   width = 5,                      .error
		.ram_addr         (ram_addr),         //  output,  width = 10,         avalon_master.address
		.ram_chipselect   (ram_chipselect),   //  output,   width = 1,                      .chipselect
		.ram_write        (ram_write),        //  output,   width = 1,                      .write
		.ram_readdata     (ram_readdata),     //   input,  width = 32,                      .readdata
		.ram_writedata    (ram_writedata),    //  output,  width = 32,                      .writedata
		.ram_byteenable   (ram_byteenable),   //  output,   width = 4,                      .byteenable
		.ram_waitrequest  (ram_waitrequest),  //   input,   width = 1,                      .waitrequest
		.clk_original     (clk_original),     //   input,   width = 1,                 clock.clk
		.rst              (rst),              //   input,   width = 1,                 reset.reset
		.rx_afull_data    (rx_afull_data),    //  output,   width = 2,           fifo_status.data
		.rx_afull_valid   (rx_afull_valid),   //  output,   width = 1,                      .valid
		.rx_afull_channel (rx_afull_channel), //  output,   width = 2,                      .channel
		.fifo_status_clk  (fifo_status_clk)   //   input,   width = 1,       fifo_status_clk.clk
	);

endmodule
