module ed_synth_tg (
		input  wire         emif_usr_reset_n,          //          emif_usr_reset_n.reset_n,                 Reset for the user clock domain. Asynchronous assertion and synchronous deassertion
		input  wire         ninit_done,                //                ninit_done.ninit_done
		input  wire         emif_usr_clk,              //              emif_usr_clk.clk,                     User clock domain
		input  wire         amm_ready_0,               //                ctrl_amm_0.waitrequest_n,           Wait-request is asserted when controller is busy
		output wire         amm_read_0,                //                          .read,                    Read request signal
		output wire         amm_write_0,               //                          .write,                   Write request signal
		output wire [29:0]  amm_address_0,             //                          .address,                 Address for the read/write request
		input  wire [255:0] amm_readdata_0,            //                          .readdata,                Read data
		output wire [255:0] amm_writedata_0,           //                          .writedata,               Write data
		output wire [6:0]   amm_burstcount_0,          //                          .burstcount,              Number of transfers in each read/write burst
		output wire [31:0]  amm_byteenable_0,          //                          .byteenable,              Byte-enable for write data
		input  wire         amm_readdatavalid_0,       //                          .readdatavalid,           Indicates whether read data is valid
		output wire         traffic_gen_pass_0,        //               tg_status_0.traffic_gen_pass
		output wire         traffic_gen_fail_0,        //                          .traffic_gen_fail
		output wire         traffic_gen_timeout_0,     //                          .traffic_gen_timeout
		input  wire         ctrl_ecc_user_interrupt_0  // ctrl_ecc_user_interrupt_0.ctrl_ecc_user_interrupt, Controller ECC user interrupt signal to determine whether there is a bit error
	);
endmodule
