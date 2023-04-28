	ed_sim_mem u0 (
		.mem_ck      (_connected_to_mem_ck_),      //   input,   width = 1, mem.mem_ck
		.mem_ck_n    (_connected_to_mem_ck_n_),    //   input,   width = 1,    .mem_ck_n
		.mem_a       (_connected_to_mem_a_),       //   input,  width = 15,    .mem_a
		.mem_ba      (_connected_to_mem_ba_),      //   input,   width = 3,    .mem_ba
		.mem_cke     (_connected_to_mem_cke_),     //   input,   width = 1,    .mem_cke
		.mem_cs_n    (_connected_to_mem_cs_n_),    //   input,   width = 1,    .mem_cs_n
		.mem_odt     (_connected_to_mem_odt_),     //   input,   width = 1,    .mem_odt
		.mem_reset_n (_connected_to_mem_reset_n_), //   input,   width = 1,    .mem_reset_n
		.mem_we_n    (_connected_to_mem_we_n_),    //   input,   width = 1,    .mem_we_n
		.mem_ras_n   (_connected_to_mem_ras_n_),   //   input,   width = 1,    .mem_ras_n
		.mem_cas_n   (_connected_to_mem_cas_n_),   //   input,   width = 1,    .mem_cas_n
		.mem_dqs     (_connected_to_mem_dqs_),     //   inout,   width = 5,    .mem_dqs
		.mem_dqs_n   (_connected_to_mem_dqs_n_),   //   inout,   width = 5,    .mem_dqs_n
		.mem_dq      (_connected_to_mem_dq_),      //   inout,  width = 40,    .mem_dq
		.mem_dm      (_connected_to_mem_dm_)       //   input,   width = 5,    .mem_dm
	);

