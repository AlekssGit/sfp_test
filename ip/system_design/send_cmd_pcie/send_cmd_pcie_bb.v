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
		input  wire        ddr_local_cal_success, //         ddr_status.local_cal_success
		input  wire        ddr_local_cal_fail,    //                   .local_cal_fail
		input  wire        ddr_setup_done,        //     ddr_setup_done.setup_done
		input  wire        system_main_reset,     // resets_information.main_reset
		input  wire        ddr_avalon_rst,        //                   .ddr_avalon_reset
		input  wire        board_reset,           //                   .board_reset
		output wire        ddr_setup_cmd          //      ddr_setup_cmd.ddr_setup_cmd
	);
endmodule

