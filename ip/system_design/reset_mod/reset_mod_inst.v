	reset_mod #(
		.TIME_RESET_PHY (INTEGER_VALUE_FOR_TIME_RESET_PHY),
		.TIME_WORK_PHY  (INTEGER_VALUE_FOR_TIME_WORK_PHY)
	) u0 (
		.clk       (_connected_to_clk_),       //   input,  width = 1,      clock.clk
		.rst_n     (_connected_to_rst_n_),     //   input,  width = 1,      reset.reset_n
		.reset     (_connected_to_reset_),     //  output,  width = 1, reset_main.reset
		.reset_phy (_connected_to_reset_phy_)  //  output,  width = 1,  reset_phy.reset
	);

