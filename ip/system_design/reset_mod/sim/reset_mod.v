// reset_mod.v

// Generated using ACDS version 21.3 170

`timescale 1 ps / 1 ps
module reset_mod #(
		parameter TIME_RESET_PHY = 500,
		parameter TIME_WORK_PHY  = 300
	) (
		input  wire  clk,       //      clock.clk
		input  wire  rst_n,     //      reset.reset_n
		output wire  reset,     // reset_main.reset
		output wire  reset_phy  //  reset_phy.reset
	);

	reset_module #(
		.TIME_RESET_PHY (TIME_RESET_PHY),
		.TIME_WORK_PHY  (TIME_WORK_PHY)
	) reset_mod (
		.clk       (clk),       //   input,  width = 1,      clock.clk
		.rst_n     (rst_n),     //   input,  width = 1,      reset.reset_n
		.reset     (reset),     //  output,  width = 1, reset_main.reset
		.reset_phy (reset_phy)  //  output,  width = 1,  reset_phy.reset
	);

endmodule
