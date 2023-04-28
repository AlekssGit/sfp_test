module ed_sim_global_reset_n_source #(
		parameter ASSERT_HIGH_RESET    = 0,
		parameter INITIAL_RESET_CYCLES = 5
	) (
		output wire  reset, // reset.reset_n
		input  wire  clk    //   clk.clk
	);
endmodule

