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
endmodule

