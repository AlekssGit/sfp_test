// ddr3.v

// Generated using ACDS version 21.4 67

`timescale 1 ps / 1 ps
module ddr3 (
		input  wire         global_reset_n,            //            global_reset_n.reset_n,                 Asynchronous reset causes the memory interface to be reset and recalibrated. The global reset signal applies to all memory interfaces placed within an I/O column.
		input  wire         pll_ref_clk,               //               pll_ref_clk.clk,                     PLL reference clock input
		input  wire         oct_rzqin,                 //                       oct.oct_rzqin,               Calibrated On-Chip Termination (OCT) RZQ input pin
		output wire [0:0]   mem_ck,                    //                       mem.mem_ck,                  CK clock
		output wire [0:0]   mem_ck_n,                  //                          .mem_ck_n,                CK clock (negative leg)
		output wire [14:0]  mem_a,                     //                          .mem_a,                   Address
		output wire [2:0]   mem_ba,                    //                          .mem_ba,                  Bank address
		output wire [0:0]   mem_cke,                   //                          .mem_cke,                 Clock enable
		output wire [0:0]   mem_cs_n,                  //                          .mem_cs_n,                Chip select
		output wire [0:0]   mem_odt,                   //                          .mem_odt,                 On-die termination
		output wire [0:0]   mem_reset_n,               //                          .mem_reset_n,             Asynchronous reset
		output wire [0:0]   mem_we_n,                  //                          .mem_we_n,                WE command
		output wire [0:0]   mem_ras_n,                 //                          .mem_ras_n,               RAS command
		output wire [0:0]   mem_cas_n,                 //                          .mem_cas_n,               CAS command
		inout  wire [4:0]   mem_dqs,                   //                          .mem_dqs,                 Data strobe
		inout  wire [4:0]   mem_dqs_n,                 //                          .mem_dqs_n,               Data strobe (negative leg)
		inout  wire [39:0]  mem_dq,                    //                          .mem_dq,                  Read/write data
		output wire [4:0]   mem_dm,                    //                          .mem_dm,                  Write data mask
		output wire         local_cal_success,         //                    status.local_cal_success,       When high, indicates that PHY calibration was successful
		output wire         local_cal_fail,            //                          .local_cal_fail,          When high, indicates that PHY calibration failed
		output wire         emif_usr_reset_n,          //          emif_usr_reset_n.reset_n,                 Reset for the user clock domain. Asynchronous assertion and synchronous deassertion
		output wire         emif_usr_clk,              //              emif_usr_clk.clk,                     User clock domain
		output wire         ctrl_ecc_user_interrupt_0, // ctrl_ecc_user_interrupt_0.ctrl_ecc_user_interrupt, Controller ECC user interrupt signal to determine whether there is a bit error
		output wire         amm_ready_0,               //                ctrl_amm_0.waitrequest_n,           Wait-request is asserted when controller is busy
		input  wire         amm_read_0,                //                          .read,                    Read request signal
		input  wire         amm_write_0,               //                          .write,                   Write request signal
		input  wire [24:0]  amm_address_0,             //                          .address,                 Address for the read/write request
		output wire [255:0] amm_readdata_0,            //                          .readdata,                Read data
		input  wire [255:0] amm_writedata_0,           //                          .writedata,               Write data
		input  wire [6:0]   amm_burstcount_0,          //                          .burstcount,              Number of transfers in each read/write burst
		input  wire [31:0]  amm_byteenable_0,          //                          .byteenable,              Byte-enable for write data
		output wire         amm_readdatavalid_0        //                          .readdatavalid,           Indicates whether read data is valid
	);

	ddr3_altera_emif_c10_1910_c6wrrsi ddr3 (
		.global_reset_n            (global_reset_n),            //   input,    width = 1,            global_reset_n.reset_n
		.pll_ref_clk               (pll_ref_clk),               //   input,    width = 1,               pll_ref_clk.clk
		.oct_rzqin                 (oct_rzqin),                 //   input,    width = 1,                       oct.oct_rzqin
		.mem_ck                    (mem_ck),                    //  output,    width = 1,                       mem.mem_ck
		.mem_ck_n                  (mem_ck_n),                  //  output,    width = 1,                          .mem_ck_n
		.mem_a                     (mem_a),                     //  output,   width = 15,                          .mem_a
		.mem_ba                    (mem_ba),                    //  output,    width = 3,                          .mem_ba
		.mem_cke                   (mem_cke),                   //  output,    width = 1,                          .mem_cke
		.mem_cs_n                  (mem_cs_n),                  //  output,    width = 1,                          .mem_cs_n
		.mem_odt                   (mem_odt),                   //  output,    width = 1,                          .mem_odt
		.mem_reset_n               (mem_reset_n),               //  output,    width = 1,                          .mem_reset_n
		.mem_we_n                  (mem_we_n),                  //  output,    width = 1,                          .mem_we_n
		.mem_ras_n                 (mem_ras_n),                 //  output,    width = 1,                          .mem_ras_n
		.mem_cas_n                 (mem_cas_n),                 //  output,    width = 1,                          .mem_cas_n
		.mem_dqs                   (mem_dqs),                   //   inout,    width = 5,                          .mem_dqs
		.mem_dqs_n                 (mem_dqs_n),                 //   inout,    width = 5,                          .mem_dqs_n
		.mem_dq                    (mem_dq),                    //   inout,   width = 40,                          .mem_dq
		.mem_dm                    (mem_dm),                    //  output,    width = 5,                          .mem_dm
		.local_cal_success         (local_cal_success),         //  output,    width = 1,                    status.local_cal_success
		.local_cal_fail            (local_cal_fail),            //  output,    width = 1,                          .local_cal_fail
		.emif_usr_reset_n          (emif_usr_reset_n),          //  output,    width = 1,          emif_usr_reset_n.reset_n
		.emif_usr_clk              (emif_usr_clk),              //  output,    width = 1,              emif_usr_clk.clk
		.ctrl_ecc_user_interrupt_0 (ctrl_ecc_user_interrupt_0), //  output,    width = 1, ctrl_ecc_user_interrupt_0.ctrl_ecc_user_interrupt
		.amm_ready_0               (amm_ready_0),               //  output,    width = 1,                ctrl_amm_0.waitrequest_n
		.amm_read_0                (amm_read_0),                //   input,    width = 1,                          .read
		.amm_write_0               (amm_write_0),               //   input,    width = 1,                          .write
		.amm_address_0             (amm_address_0),             //   input,   width = 25,                          .address
		.amm_readdata_0            (amm_readdata_0),            //  output,  width = 256,                          .readdata
		.amm_writedata_0           (amm_writedata_0),           //   input,  width = 256,                          .writedata
		.amm_burstcount_0          (amm_burstcount_0),          //   input,    width = 7,                          .burstcount
		.amm_byteenable_0          (amm_byteenable_0),          //   input,   width = 32,                          .byteenable
		.amm_readdatavalid_0       (amm_readdatavalid_0)        //  output,    width = 1,                          .readdatavalid
	);

endmodule
