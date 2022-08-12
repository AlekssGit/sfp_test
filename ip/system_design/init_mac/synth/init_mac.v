// init_mac.v

// Generated using ACDS version 21.3 170

`timescale 1 ps / 1 ps
module init_mac (
		input  wire        clk,        //         clock.clk
		input  wire        reset,      //         reset.reset
		output wire [9:0]  ADR_O,      // avalon_master.address
		input  wire [31:0] DAT_I,      //              .readdata
		output wire [31:0] DAT_O,      //              .writedata
		output wire        RD,         //              .read
		output wire        WR,         //              .write
		input  wire        BUSY,       //              .waitrequest
		output wire        mac_inited, //    mac_inited.mac_inited
		input  wire        led_link    //      led_link.signal
	);

	mac_init_top init_mac (
		.clk        (clk),        //   input,   width = 1,         clock.clk
		.reset      (reset),      //   input,   width = 1,         reset.reset
		.ADR_O      (ADR_O),      //  output,  width = 10, avalon_master.address
		.DAT_I      (DAT_I),      //   input,  width = 32,              .readdata
		.DAT_O      (DAT_O),      //  output,  width = 32,              .writedata
		.RD         (RD),         //  output,   width = 1,              .read
		.WR         (WR),         //  output,   width = 1,              .write
		.BUSY       (BUSY),       //   input,   width = 1,              .waitrequest
		.mac_inited (mac_inited), //  output,   width = 1,    mac_inited.mac_inited
		.led_link   (led_link)    //   input,   width = 1,      led_link.signal
	);

endmodule
