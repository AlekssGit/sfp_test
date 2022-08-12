module reset_mod #(
		parameter TIME_RESET_PHY = 500,
		parameter TIME_WORK_PHY  = 300
	) (
		input  wire  clk,       //      clock.clk
		input  wire  rst_n,     //      reset.reset_n
		output wire  reset,     // reset_main.reset
		output wire  reset_phy  //  reset_phy.reset
	);
endmodule

