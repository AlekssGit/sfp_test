// ed_sim_sim_checker.v

// Generated using ACDS version 21.4 67

`timescale 1 ps / 1 ps
module ed_sim_sim_checker (
		input  wire  traffic_gen_pass_0,    // tg_status_0.traffic_gen_pass
		input  wire  traffic_gen_fail_0,    //            .traffic_gen_fail
		input  wire  traffic_gen_timeout_0, //            .traffic_gen_timeout
		output wire  traffic_gen_pass,      //   tg_status.traffic_gen_pass
		output wire  traffic_gen_fail,      //            .traffic_gen_fail
		output wire  traffic_gen_timeout,   //            .traffic_gen_timeout
		input  wire  local_cal_success_0,   //    status_0.local_cal_success,  When high, indicates that PHY calibration was successful
		input  wire  local_cal_fail_0,      //            .local_cal_fail,     When high, indicates that PHY calibration failed
		output wire  local_cal_success,     //      status.local_cal_success,  When high, indicates that PHY calibration was successful
		output wire  local_cal_fail         //            .local_cal_fail,     When high, indicates that PHY calibration failed
	);

	altera_emif_sim_checker #(
		.NUM_OF_TG_IFS   (1),
		.NUM_OF_EMIF_IFS (1),
		.SKIP_TG         (0)
	) sim_checker (
		.traffic_gen_pass_0     (traffic_gen_pass_0),    //   input,  width = 1, tg_status_0.traffic_gen_pass
		.traffic_gen_fail_0     (traffic_gen_fail_0),    //   input,  width = 1,            .traffic_gen_fail
		.traffic_gen_timeout_0  (traffic_gen_timeout_0), //   input,  width = 1,            .traffic_gen_timeout
		.traffic_gen_pass       (traffic_gen_pass),      //  output,  width = 1,   tg_status.traffic_gen_pass
		.traffic_gen_fail       (traffic_gen_fail),      //  output,  width = 1,            .traffic_gen_fail
		.traffic_gen_timeout    (traffic_gen_timeout),   //  output,  width = 1,            .traffic_gen_timeout
		.local_cal_success_0    (local_cal_success_0),   //   input,  width = 1,    status_0.local_cal_success
		.local_cal_fail_0       (local_cal_fail_0),      //   input,  width = 1,            .local_cal_fail
		.local_cal_success      (local_cal_success),     //  output,  width = 1,      status.local_cal_success
		.local_cal_fail         (local_cal_fail),        //  output,  width = 1,            .local_cal_fail
		.traffic_gen_pass_1     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_1     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_1  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_2     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_2     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_2  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_3     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_3     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_3  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_4     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_4     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_4  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_5     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_5     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_5  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_6     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_6     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_6  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_7     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_7     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_7  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_8     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_8     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_8  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_9     (1'b0),                  // (terminated),                         
		.traffic_gen_fail_9     (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_9  (1'b0),                  // (terminated),                         
		.traffic_gen_pass_10    (1'b0),                  // (terminated),                         
		.traffic_gen_fail_10    (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_10 (1'b0),                  // (terminated),                         
		.traffic_gen_pass_11    (1'b0),                  // (terminated),                         
		.traffic_gen_fail_11    (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_11 (1'b0),                  // (terminated),                         
		.traffic_gen_pass_12    (1'b0),                  // (terminated),                         
		.traffic_gen_fail_12    (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_12 (1'b0),                  // (terminated),                         
		.traffic_gen_pass_13    (1'b0),                  // (terminated),                         
		.traffic_gen_fail_13    (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_13 (1'b0),                  // (terminated),                         
		.traffic_gen_pass_14    (1'b0),                  // (terminated),                         
		.traffic_gen_fail_14    (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_14 (1'b0),                  // (terminated),                         
		.traffic_gen_pass_15    (1'b0),                  // (terminated),                         
		.traffic_gen_fail_15    (1'b0),                  // (terminated),                         
		.traffic_gen_timeout_15 (1'b0),                  // (terminated),                         
		.local_cal_success_1    (1'b0),                  // (terminated),                         
		.local_cal_fail_1       (1'b0),                  // (terminated),                         
		.local_cal_success_2    (1'b0),                  // (terminated),                         
		.local_cal_fail_2       (1'b0),                  // (terminated),                         
		.local_cal_success_3    (1'b0),                  // (terminated),                         
		.local_cal_fail_3       (1'b0),                  // (terminated),                         
		.local_cal_success_4    (1'b0),                  // (terminated),                         
		.local_cal_fail_4       (1'b0),                  // (terminated),                         
		.local_cal_success_5    (1'b0),                  // (terminated),                         
		.local_cal_fail_5       (1'b0),                  // (terminated),                         
		.local_cal_success_6    (1'b0),                  // (terminated),                         
		.local_cal_fail_6       (1'b0),                  // (terminated),                         
		.local_cal_success_7    (1'b0),                  // (terminated),                         
		.local_cal_fail_7       (1'b0),                  // (terminated),                         
		.local_cal_success_8    (1'b0),                  // (terminated),                         
		.local_cal_fail_8       (1'b0),                  // (terminated),                         
		.local_cal_success_9    (1'b0),                  // (terminated),                         
		.local_cal_fail_9       (1'b0),                  // (terminated),                         
		.local_cal_success_10   (1'b0),                  // (terminated),                         
		.local_cal_fail_10      (1'b0),                  // (terminated),                         
		.local_cal_success_11   (1'b0),                  // (terminated),                         
		.local_cal_fail_11      (1'b0),                  // (terminated),                         
		.local_cal_success_12   (1'b0),                  // (terminated),                         
		.local_cal_fail_12      (1'b0),                  // (terminated),                         
		.local_cal_success_13   (1'b0),                  // (terminated),                         
		.local_cal_fail_13      (1'b0),                  // (terminated),                         
		.local_cal_success_14   (1'b0),                  // (terminated),                         
		.local_cal_fail_14      (1'b0),                  // (terminated),                         
		.local_cal_success_15   (1'b0),                  // (terminated),                         
		.local_cal_fail_15      (1'b0)                   // (terminated),                         
	);

endmodule