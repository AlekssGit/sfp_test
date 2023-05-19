	tx_2 u0 (
		.amm_addr          (_connected_to_amm_addr_),          //  output,   width = 25,           avalon_master.address
		.amm_readdata      (_connected_to_amm_readdata_),      //   input,  width = 256,                        .readdata
		.amm_writedata     (_connected_to_amm_writedata_),     //  output,  width = 256,                        .writedata
		.amm_read          (_connected_to_amm_read_),          //  output,    width = 1,                        .read
		.amm_write         (_connected_to_amm_write_),         //  output,    width = 1,                        .write
		.amm_byteenable    (_connected_to_amm_byteenable_),    //  output,   width = 32,                        .byteenable
		.amm_burstcount    (_connected_to_amm_burstcount_),    //  output,    width = 7,                        .burstcount
		.amm_readdatavalid (_connected_to_amm_readdatavalid_), //   input,    width = 1,                        .readdatavalid
		.amm_ready         (_connected_to_amm_ready_),         //   input,    width = 1,                        .waitrequest
		.clk_50            (_connected_to_clk_50_),            //   input,    width = 1,                clock_50.clk
		.rst_n             (_connected_to_rst_n_),             //   input,    width = 1,             reset_board.reset
		.avalon_clk        (_connected_to_avalon_clk_),        //   input,    width = 1,               clock_ddr.clk
		.clk_original      (_connected_to_clk_original_),      //   input,    width = 1,               clock_tse.clk
		.rst               (_connected_to_rst_),               //   input,    width = 1,                   reset.reset
		.ff_tx_data        (_connected_to_ff_tx_data_),        //  output,    width = 8, avalon_streaming_source.data
		.ff_tx_eop         (_connected_to_ff_tx_eop_),         //  output,    width = 1,                        .endofpacket
		.ff_tx_err         (_connected_to_ff_tx_err_),         //  output,    width = 1,                        .error
		.ff_tx_rdy         (_connected_to_ff_tx_rdy_),         //   input,    width = 1,                        .ready
		.ff_tx_sop         (_connected_to_ff_tx_sop_),         //  output,    width = 1,                        .startofpacket
		.ff_tx_wren        (_connected_to_ff_tx_wren_),        //  output,    width = 1,                        .valid
		.avalon_reset      (_connected_to_avalon_reset_),      //   input,    width = 1,               reset_ddr.reset
		.start_ram_addr    (_connected_to_start_ram_addr_),    //   input,   width = 25,                 control.start_ram_addr
		.cmd_send          (_connected_to_cmd_send_)           //   input,    width = 1,                        .cmd_send
	);

