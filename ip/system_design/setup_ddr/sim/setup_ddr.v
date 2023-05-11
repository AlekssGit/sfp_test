// setup_ddr.v

// Generated using ACDS version 21.3 170

`timescale 1 ps / 1 ps
module setup_ddr #(
		parameter test = 0
	) (
		output wire [24:0]  amm_addr,                 //      avalon_master.address
		input  wire [255:0] amm_readdata,             //                   .readdata
		output wire [255:0] amm_writedata,            //                   .writedata
		output wire         amm_read,                 //                   .read
		output wire         amm_write,                //                   .write
		output wire [31:0]  amm_byteenable,           //                   .byteenable
		output wire [6:0]   amm_burstcount,           //                   .burstcount
		input  wire         amm_readdatavalid,        //                   .readdatavalid
		input  wire         amm_ready,                //                   .waitrequest
		output wire         setup_done,               //              setup.setup_done
		input  wire         local_cal_success_avalon, //         ddr_status.local_cal_success
		input  wire         local_cal_fail_avalon,    //                   .local_cal_fail
		input  wire         ram_ready,                //          ddr_ready.ram_ready
		input  wire         clk,                      //    clock_125_tx_rx.clk
		input  wire         avalon_clk,               //       clock_avalon.clk
		input  wire         clk_50,                   //           clock_50.clk
		input  wire         rst_n,                    //        reset_board.reset
		input  wire         avalon_reset,             //       reset_avalon.reset
		input  wire         reset,                    //       reset_module.reset
		output wire         reset_local_cal_success,  //        cal_success.cal_success
		output wire         ddr_local_cal_success,    //     ddr_status_out.local_cal_success
		output wire         ddr_local_cal_fail,       //                   .local_cal_fail
		output wire         system_main_reset,        // resets_information.main_reset
		output wire         ddr_avalon_rst,           //                   .ddr_avalon_reset
		output wire         board_reset,              //                   .board_reset
		input  wire         ddr_setup_cmd_pci         //      ddr_setup_cmd.ddr_setup_cmd
	);

	setup_ddr_data_256 #(
		.test (test)
	) setup_ddr (
		.amm_addr                 (amm_addr),                 //  output,   width = 25,      avalon_master.address
		.amm_readdata             (amm_readdata),             //   input,  width = 256,                   .readdata
		.amm_writedata            (amm_writedata),            //  output,  width = 256,                   .writedata
		.amm_read                 (amm_read),                 //  output,    width = 1,                   .read
		.amm_write                (amm_write),                //  output,    width = 1,                   .write
		.amm_byteenable           (amm_byteenable),           //  output,   width = 32,                   .byteenable
		.amm_burstcount           (amm_burstcount),           //  output,    width = 7,                   .burstcount
		.amm_readdatavalid        (amm_readdatavalid),        //   input,    width = 1,                   .readdatavalid
		.amm_ready                (amm_ready),                //   input,    width = 1,                   .waitrequest
		.setup_done               (setup_done),               //  output,    width = 1,              setup.setup_done
		.local_cal_success_avalon (local_cal_success_avalon), //   input,    width = 1,         ddr_status.local_cal_success
		.local_cal_fail_avalon    (local_cal_fail_avalon),    //   input,    width = 1,                   .local_cal_fail
		.ram_ready                (ram_ready),                //   input,    width = 1,          ddr_ready.ram_ready
		.clk                      (clk),                      //   input,    width = 1,    clock_125_tx_rx.clk
		.avalon_clk               (avalon_clk),               //   input,    width = 1,       clock_avalon.clk
		.clk_50                   (clk_50),                   //   input,    width = 1,           clock_50.clk
		.rst_n                    (rst_n),                    //   input,    width = 1,        reset_board.reset
		.avalon_reset             (avalon_reset),             //   input,    width = 1,       reset_avalon.reset
		.reset                    (reset),                    //   input,    width = 1,       reset_module.reset
		.reset_local_cal_success  (reset_local_cal_success),  //  output,    width = 1,        cal_success.cal_success
		.ddr_local_cal_success    (ddr_local_cal_success),    //  output,    width = 1,     ddr_status_out.local_cal_success
		.ddr_local_cal_fail       (ddr_local_cal_fail),       //  output,    width = 1,                   .local_cal_fail
		.system_main_reset        (system_main_reset),        //  output,    width = 1, resets_information.main_reset
		.ddr_avalon_rst           (ddr_avalon_rst),           //  output,    width = 1,                   .ddr_avalon_reset
		.board_reset              (board_reset),              //  output,    width = 1,                   .board_reset
		.ddr_setup_cmd_pci        (ddr_setup_cmd_pci)         //   input,    width = 1,      ddr_setup_cmd.ddr_setup_cmd
	);

endmodule
