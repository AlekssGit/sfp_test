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
endmodule

