	setup_ddr #(
		.test (BOOLEAN_VALUE_FOR_test)
	) u0 (
		.amm_addr                 (_connected_to_amm_addr_),                 //  output,   width = 25,      avalon_master.address
		.amm_readdata             (_connected_to_amm_readdata_),             //   input,  width = 256,                   .readdata
		.amm_writedata            (_connected_to_amm_writedata_),            //  output,  width = 256,                   .writedata
		.amm_read                 (_connected_to_amm_read_),                 //  output,    width = 1,                   .read
		.amm_write                (_connected_to_amm_write_),                //  output,    width = 1,                   .write
		.amm_byteenable           (_connected_to_amm_byteenable_),           //  output,   width = 32,                   .byteenable
		.amm_burstcount           (_connected_to_amm_burstcount_),           //  output,    width = 7,                   .burstcount
		.amm_readdatavalid        (_connected_to_amm_readdatavalid_),        //   input,    width = 1,                   .readdatavalid
		.amm_ready                (_connected_to_amm_ready_),                //   input,    width = 1,                   .waitrequest
		.setup_done               (_connected_to_setup_done_),               //  output,    width = 1,              setup.setup_done
		.local_cal_success_avalon (_connected_to_local_cal_success_avalon_), //   input,    width = 1,         ddr_status.local_cal_success
		.local_cal_fail_avalon    (_connected_to_local_cal_fail_avalon_),    //   input,    width = 1,                   .local_cal_fail
		.clk                      (_connected_to_clk_),                      //   input,    width = 1,    clock_125_tx_rx.clk
		.avalon_clk               (_connected_to_avalon_clk_),               //   input,    width = 1,       clock_avalon.clk
		.clk_50                   (_connected_to_clk_50_),                   //   input,    width = 1,           clock_50.clk
		.rst_n                    (_connected_to_rst_n_),                    //   input,    width = 1,        reset_board.reset
		.avalon_reset             (_connected_to_avalon_reset_),             //   input,    width = 1,       reset_avalon.reset
		.reset                    (_connected_to_reset_),                    //   input,    width = 1,       reset_module.reset
		.reset_local_cal_success  (_connected_to_reset_local_cal_success_),  //  output,    width = 1,        cal_success.cal_success
		.ddr_local_cal_success    (_connected_to_ddr_local_cal_success_),    //  output,    width = 1,     ddr_status_out.local_cal_success
		.ddr_local_cal_fail       (_connected_to_ddr_local_cal_fail_),       //  output,    width = 1,                   .local_cal_fail
		.system_main_reset        (_connected_to_system_main_reset_),        //  output,    width = 1, resets_information.main_reset
		.ddr_avalon_rst           (_connected_to_ddr_avalon_rst_),           //  output,    width = 1,                   .ddr_avalon_reset
		.board_reset              (_connected_to_board_reset_),              //  output,    width = 1,                   .board_reset
		.ddr_setup_cmd_pci        (_connected_to_ddr_setup_cmd_pci_)         //   input,    width = 1,      ddr_setup_cmd.ddr_setup_cmd
	);

