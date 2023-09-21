	rx_2 u0 (
		.ff_rx_data        (_connected_to_ff_rx_data_),        //   input,    width = 8, avalon_streaming_sink.data
		.ff_rx_eop         (_connected_to_ff_rx_eop_),         //   input,    width = 1,                      .endofpacket
		.ff_rx_rdy         (_connected_to_ff_rx_rdy_),         //  output,    width = 1,                      .ready
		.ff_rx_sop         (_connected_to_ff_rx_sop_),         //   input,    width = 1,                      .startofpacket
		.ff_rx_dval        (_connected_to_ff_rx_dval_),        //   input,    width = 1,                      .valid
		.rx_err            (_connected_to_rx_err_),            //   input,    width = 5,                      .error
		.amm_addr          (_connected_to_amm_addr_),          //  output,   width = 25,         avalon_master.address
		.amm_readdata      (_connected_to_amm_readdata_),      //   input,  width = 256,                      .readdata
		.amm_writedata     (_connected_to_amm_writedata_),     //  output,  width = 256,                      .writedata
		.amm_read          (_connected_to_amm_read_),          //  output,    width = 1,                      .read
		.amm_write         (_connected_to_amm_write_),         //  output,    width = 1,                      .write
		.amm_byteenable    (_connected_to_amm_byteenable_),    //  output,   width = 32,                      .byteenable
		.amm_burstcount    (_connected_to_amm_burstcount_),    //  output,    width = 7,                      .burstcount
		.amm_readdatavalid (_connected_to_amm_readdatavalid_), //   input,    width = 1,                      .readdatavalid
		.amm_ready         (_connected_to_amm_ready_),         //   input,    width = 1,                      .waitrequest
		.rx_afull_data     (_connected_to_rx_afull_data_),     //  output,    width = 2,           fifo_status.data
		.rx_afull_valid    (_connected_to_rx_afull_valid_),    //  output,    width = 1,                      .valid
		.rx_afull_channel  (_connected_to_rx_afull_channel_),  //  output,    width = 1,                      .channel
		.size_received     (_connected_to_size_received_),     //  output,   width = 12,            rx_signals.size_received
		.data_saved        (_connected_to_data_saved_),        //  output,    width = 1,                      .data_saved
		.rst               (_connected_to_rst_),               //   input,    width = 1,                 reset.reset
		.clk_original      (_connected_to_clk_original_),      //   input,    width = 1,             clock_tse.clk
		.rst_n             (_connected_to_rst_n_),             //   input,    width = 1,           reset_board.reset
		.avalon_clk        (_connected_to_avalon_clk_),        //   input,    width = 1,             clock_ddr.clk
		.avalon_reset      (_connected_to_avalon_reset_),      //   input,    width = 1,             reset_ddr.reset
		.fifo_status_clk   (_connected_to_fifo_status_clk_)    //   input,    width = 1,       fifo_status_clk.clk
	);

