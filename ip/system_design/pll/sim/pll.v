// pll.v

// Generated using ACDS version 21.3 170

`timescale 1 ps / 1 ps
module pll (
		input  wire  rst,      //   reset.reset
		input  wire  refclk,   //  refclk.clk
		output wire  outclk_0, // outclk0.clk
		output wire  outclk_1, // outclk1.clk
		output wire  outclk_2, // outclk2.clk
		output wire  outclk_3  // outclk3.clk
	);

	pll_altera_iopll_1931_bd2ubhi pll (
		.rst      (rst),      //   input,  width = 1,   reset.reset
		.refclk   (refclk),   //   input,  width = 1,  refclk.clk
		.outclk_0 (outclk_0), //  output,  width = 1, outclk0.clk
		.outclk_1 (outclk_1), //  output,  width = 1, outclk1.clk
		.outclk_2 (outclk_2), //  output,  width = 1, outclk2.clk
		.outclk_3 (outclk_3)  //  output,  width = 1, outclk3.clk
	);

endmodule
