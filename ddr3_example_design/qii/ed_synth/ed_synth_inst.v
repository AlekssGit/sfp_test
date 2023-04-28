	ed_synth u0 (
		.ddr3_pll_ref_clk_clk          (_connected_to_ddr3_pll_ref_clk_clk_),          //   input,   width = 1, ddr3_pll_ref_clk.clk
		.ddr3_oct_oct_rzqin            (_connected_to_ddr3_oct_oct_rzqin_),            //   input,   width = 1,         ddr3_oct.oct_rzqin
		.ddr3_mem_mem_ck               (_connected_to_ddr3_mem_mem_ck_),               //  output,   width = 1,         ddr3_mem.mem_ck
		.ddr3_mem_mem_ck_n             (_connected_to_ddr3_mem_mem_ck_n_),             //  output,   width = 1,                 .mem_ck_n
		.ddr3_mem_mem_a                (_connected_to_ddr3_mem_mem_a_),                //  output,  width = 15,                 .mem_a
		.ddr3_mem_mem_ba               (_connected_to_ddr3_mem_mem_ba_),               //  output,   width = 3,                 .mem_ba
		.ddr3_mem_mem_cke              (_connected_to_ddr3_mem_mem_cke_),              //  output,   width = 1,                 .mem_cke
		.ddr3_mem_mem_cs_n             (_connected_to_ddr3_mem_mem_cs_n_),             //  output,   width = 1,                 .mem_cs_n
		.ddr3_mem_mem_odt              (_connected_to_ddr3_mem_mem_odt_),              //  output,   width = 1,                 .mem_odt
		.ddr3_mem_mem_reset_n          (_connected_to_ddr3_mem_mem_reset_n_),          //  output,   width = 1,                 .mem_reset_n
		.ddr3_mem_mem_we_n             (_connected_to_ddr3_mem_mem_we_n_),             //  output,   width = 1,                 .mem_we_n
		.ddr3_mem_mem_ras_n            (_connected_to_ddr3_mem_mem_ras_n_),            //  output,   width = 1,                 .mem_ras_n
		.ddr3_mem_mem_cas_n            (_connected_to_ddr3_mem_mem_cas_n_),            //  output,   width = 1,                 .mem_cas_n
		.ddr3_mem_mem_dqs              (_connected_to_ddr3_mem_mem_dqs_),              //   inout,   width = 5,                 .mem_dqs
		.ddr3_mem_mem_dqs_n            (_connected_to_ddr3_mem_mem_dqs_n_),            //   inout,   width = 5,                 .mem_dqs_n
		.ddr3_mem_mem_dq               (_connected_to_ddr3_mem_mem_dq_),               //   inout,  width = 40,                 .mem_dq
		.ddr3_mem_mem_dm               (_connected_to_ddr3_mem_mem_dm_),               //  output,   width = 5,                 .mem_dm
		.ddr3_status_local_cal_success (_connected_to_ddr3_status_local_cal_success_), //  output,   width = 1,      ddr3_status.local_cal_success
		.ddr3_status_local_cal_fail    (_connected_to_ddr3_status_local_cal_fail_),    //  output,   width = 1,                 .local_cal_fail
		.global_reset_reset_n          (_connected_to_global_reset_reset_n_),          //   input,   width = 1,     global_reset.reset_n
		.ddr3_tg_0_traffic_gen_pass    (_connected_to_ddr3_tg_0_traffic_gen_pass_),    //  output,   width = 1,        ddr3_tg_0.traffic_gen_pass
		.ddr3_tg_0_traffic_gen_fail    (_connected_to_ddr3_tg_0_traffic_gen_fail_),    //  output,   width = 1,                 .traffic_gen_fail
		.ddr3_tg_0_traffic_gen_timeout (_connected_to_ddr3_tg_0_traffic_gen_timeout_)  //  output,   width = 1,                 .traffic_gen_timeout
	);

