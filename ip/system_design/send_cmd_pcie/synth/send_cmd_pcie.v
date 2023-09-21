// send_cmd_pcie.v

// Generated using ACDS version 21.3 170

`timescale 1 ps / 1 ps
module send_cmd_pcie (
		input  wire        clk,                   //              clock.clk
		input  wire        rst_n,                 //              reset.reset_n
		input  wire        avalon_mm_read,        //       avalon_slave.read
		input  wire        avalon_mm_write,       //                   .write
		input  wire [15:0] avalon_mm_addr,        //                   .address
		input  wire [31:0] avalon_mm_write_data,  //                   .writedata
		output wire [31:0] avalon_mm_read_data,   //                   .readdata
		output wire        avalon_mm_rd_valid,    //                   .readdatavalid
		output wire [5:0]  start_ram_addr,        //       send_control.start_ram_addr
		output wire        send_cmd,              //                   .signal
		output wire [31:0] send_ch_2_timer,       //                   .ch_2_timer
		input  wire        ddr_local_cal_success, //         ddr_status.local_cal_success
		input  wire        ddr_local_cal_fail,    //                   .local_cal_fail
		input  wire        ddr_setup_done,        //     ddr_setup_done.setup_done
		input  wire        system_main_reset,     // resets_information.main_reset
		input  wire        ddr_avalon_rst,        //                   .ddr_avalon_reset
		input  wire        board_reset,           //                   .board_reset
		output wire        ddr_setup_cmd          //      ddr_setup_cmd.ddr_setup_cmd
	);

	avalon_mm_slave send_cmd_pcie (
		.clk                   (clk),                   //   input,   width = 1,              clock.clk
		.rst_n                 (rst_n),                 //   input,   width = 1,              reset.reset_n
		.avalon_mm_read        (avalon_mm_read),        //   input,   width = 1,       avalon_slave.read
		.avalon_mm_write       (avalon_mm_write),       //   input,   width = 1,                   .write
		.avalon_mm_addr        (avalon_mm_addr),        //   input,  width = 16,                   .address
		.avalon_mm_write_data  (avalon_mm_write_data),  //   input,  width = 32,                   .writedata
		.avalon_mm_read_data   (avalon_mm_read_data),   //  output,  width = 32,                   .readdata
		.avalon_mm_rd_valid    (avalon_mm_rd_valid),    //  output,   width = 1,                   .readdatavalid
		.start_ram_addr        (start_ram_addr),        //  output,   width = 6,       send_control.start_ram_addr
		.send_cmd              (send_cmd),              //  output,   width = 1,                   .signal
		.send_ch_2_timer       (send_ch_2_timer),       //  output,  width = 32,                   .ch_2_timer
		.ddr_local_cal_success (ddr_local_cal_success), //   input,   width = 1,         ddr_status.local_cal_success
		.ddr_local_cal_fail    (ddr_local_cal_fail),    //   input,   width = 1,                   .local_cal_fail
		.ddr_setup_done        (ddr_setup_done),        //   input,   width = 1,     ddr_setup_done.setup_done
		.system_main_reset     (system_main_reset),     //   input,   width = 1, resets_information.main_reset
		.ddr_avalon_rst        (ddr_avalon_rst),        //   input,   width = 1,                   .ddr_avalon_reset
		.board_reset           (board_reset),           //   input,   width = 1,                   .board_reset
		.ddr_setup_cmd         (ddr_setup_cmd)          //  output,   width = 1,      ddr_setup_cmd.ddr_setup_cmd
	);

endmodule
