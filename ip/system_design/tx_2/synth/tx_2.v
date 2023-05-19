// tx_2.v

// Generated using ACDS version 21.4 67

`timescale 1 ps / 1 ps
module tx_2 (
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

	send_packet_ddr tx_2 (
		.amm_addr          (amm_addr),          //  output,   width = 25,           avalon_master.address
		.amm_readdata      (amm_readdata),      //   input,  width = 256,                        .readdata
		.amm_writedata     (amm_writedata),     //  output,  width = 256,                        .writedata
		.amm_read          (amm_read),          //  output,    width = 1,                        .read
		.amm_write         (amm_write),         //  output,    width = 1,                        .write
		.amm_byteenable    (amm_byteenable),    //  output,   width = 32,                        .byteenable
		.amm_burstcount    (amm_burstcount),    //  output,    width = 7,                        .burstcount
		.amm_readdatavalid (amm_readdatavalid), //   input,    width = 1,                        .readdatavalid
		.amm_ready         (amm_ready),         //   input,    width = 1,                        .waitrequest
		.clk_50            (clk_50),            //   input,    width = 1,                clock_50.clk
		.rst_n             (rst_n),             //   input,    width = 1,             reset_board.reset
		.avalon_clk        (avalon_clk),        //   input,    width = 1,               clock_ddr.clk
		.clk_original      (clk_original),      //   input,    width = 1,               clock_tse.clk
		.rst               (rst),               //   input,    width = 1,                   reset.reset
		.ff_tx_data        (ff_tx_data),        //  output,    width = 8, avalon_streaming_source.data
		.ff_tx_eop         (ff_tx_eop),         //  output,    width = 1,                        .endofpacket
		.ff_tx_err         (ff_tx_err),         //  output,    width = 1,                        .error
		.ff_tx_rdy         (ff_tx_rdy),         //   input,    width = 1,                        .ready
		.ff_tx_sop         (ff_tx_sop),         //  output,    width = 1,                        .startofpacket
		.ff_tx_wren        (ff_tx_wren),        //  output,    width = 1,                        .valid
		.avalon_reset      (avalon_reset),      //   input,    width = 1,               reset_ddr.reset
		.start_ram_addr    (start_ram_addr),    //   input,   width = 25,                 control.start_ram_addr
		.cmd_send          (cmd_send)           //   input,    width = 1,                        .cmd_send
	);

endmodule
