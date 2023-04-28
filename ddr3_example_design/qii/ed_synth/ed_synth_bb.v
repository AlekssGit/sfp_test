module ed_synth (
		input  wire        ddr3_pll_ref_clk_clk,          // ddr3_pll_ref_clk.clk
		input  wire        ddr3_oct_oct_rzqin,            //         ddr3_oct.oct_rzqin
		output wire [0:0]  ddr3_mem_mem_ck,               //         ddr3_mem.mem_ck
		output wire [0:0]  ddr3_mem_mem_ck_n,             //                 .mem_ck_n
		output wire [14:0] ddr3_mem_mem_a,                //                 .mem_a
		output wire [2:0]  ddr3_mem_mem_ba,               //                 .mem_ba
		output wire [0:0]  ddr3_mem_mem_cke,              //                 .mem_cke
		output wire [0:0]  ddr3_mem_mem_cs_n,             //                 .mem_cs_n
		output wire [0:0]  ddr3_mem_mem_odt,              //                 .mem_odt
		output wire [0:0]  ddr3_mem_mem_reset_n,          //                 .mem_reset_n
		output wire [0:0]  ddr3_mem_mem_we_n,             //                 .mem_we_n
		output wire [0:0]  ddr3_mem_mem_ras_n,            //                 .mem_ras_n
		output wire [0:0]  ddr3_mem_mem_cas_n,            //                 .mem_cas_n
		inout  wire [4:0]  ddr3_mem_mem_dqs,              //                 .mem_dqs
		inout  wire [4:0]  ddr3_mem_mem_dqs_n,            //                 .mem_dqs_n
		inout  wire [39:0] ddr3_mem_mem_dq,               //                 .mem_dq
		output wire [4:0]  ddr3_mem_mem_dm,               //                 .mem_dm
		output wire        ddr3_status_local_cal_success, //      ddr3_status.local_cal_success
		output wire        ddr3_status_local_cal_fail,    //                 .local_cal_fail
		input  wire        global_reset_reset_n,          //     global_reset.reset_n
		output wire        ddr3_tg_0_traffic_gen_pass,    //        ddr3_tg_0.traffic_gen_pass
		output wire        ddr3_tg_0_traffic_gen_fail,    //                 .traffic_gen_fail
		output wire        ddr3_tg_0_traffic_gen_timeout  //                 .traffic_gen_timeout
	);
endmodule

