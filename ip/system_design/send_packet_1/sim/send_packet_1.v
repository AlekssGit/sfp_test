// send_packet_1.v

// Generated using ACDS version 21.3 170

`timescale 1 ps / 1 ps
module send_packet_1 (
		input  wire        clk_original,    //                   clock.clk
		input  wire        rst,             //                   reset.reset
		output wire [9:0]  ram_addr,        //           avalon_master.address
		output wire        ram_chipselect,  //                        .chipselect
		output wire        ram_write,       //                        .write
		input  wire [31:0] ram_readdata,    //                        .readdata
		output wire [31:0] ram_writedata,   //                        .writedata
		output wire [3:0]  ram_byteenable,  //                        .byteenable
		input  wire        ram_waitrequest, //                        .waitrequest
		output wire [7:0]  ff_tx_data,      // avalon_streaming_source.data
		output wire        ff_tx_eop,       //                        .endofpacket
		output wire        ff_tx_err,       //                        .error
		input  wire        ff_tx_rdy,       //                        .ready
		output wire        ff_tx_sop,       //                        .startofpacket
		output wire        ff_tx_wren,      //                        .valid
		input  wire [24:0] start_ram_addr,  //                 control.start_ram_addr
		input  wire        cmd_send         //                        .cmd_send
	);

	send_packet send_packet_1 (
		.clk_original    (clk_original),    //   input,   width = 1,                   clock.clk
		.rst             (rst),             //   input,   width = 1,                   reset.reset
		.ram_addr        (ram_addr),        //  output,  width = 10,           avalon_master.address
		.ram_chipselect  (ram_chipselect),  //  output,   width = 1,                        .chipselect
		.ram_write       (ram_write),       //  output,   width = 1,                        .write
		.ram_readdata    (ram_readdata),    //   input,  width = 32,                        .readdata
		.ram_writedata   (ram_writedata),   //  output,  width = 32,                        .writedata
		.ram_byteenable  (ram_byteenable),  //  output,   width = 4,                        .byteenable
		.ram_waitrequest (ram_waitrequest), //   input,   width = 1,                        .waitrequest
		.ff_tx_data      (ff_tx_data),      //  output,   width = 8, avalon_streaming_source.data
		.ff_tx_eop       (ff_tx_eop),       //  output,   width = 1,                        .endofpacket
		.ff_tx_err       (ff_tx_err),       //  output,   width = 1,                        .error
		.ff_tx_rdy       (ff_tx_rdy),       //   input,   width = 1,                        .ready
		.ff_tx_sop       (ff_tx_sop),       //  output,   width = 1,                        .startofpacket
		.ff_tx_wren      (ff_tx_wren),      //  output,   width = 1,                        .valid
		.start_ram_addr  (start_ram_addr),  //   input,  width = 25,                 control.start_ram_addr
		.cmd_send        (cmd_send)         //   input,   width = 1,                        .cmd_send
	);

endmodule
