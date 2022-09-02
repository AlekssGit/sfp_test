	init_mac u0 (
		.clk        (_connected_to_clk_),        //   input,   width = 1,         clock.clk
		.reset      (_connected_to_reset_),      //   input,   width = 1,         reset.reset
		.ADR_O      (_connected_to_ADR_O_),      //  output,  width = 10, avalon_master.address
		.DAT_I      (_connected_to_DAT_I_),      //   input,  width = 32,              .readdata
		.DAT_O      (_connected_to_DAT_O_),      //  output,  width = 32,              .writedata
		.RD         (_connected_to_RD_),         //  output,   width = 1,              .read
		.WR         (_connected_to_WR_),         //  output,   width = 1,              .write
		.BUSY       (_connected_to_BUSY_),       //   input,   width = 1,              .waitrequest
		.mac_inited (_connected_to_mac_inited_)  //  output,   width = 1,    mac_inited.mac_inited
	);

