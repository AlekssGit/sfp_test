	receive_packet_0 u0 (
		.ff_rx_data       (_connected_to_ff_rx_data_),       //   input,   width = 8, avalon_streaming_sink.data
		.ff_rx_eop        (_connected_to_ff_rx_eop_),        //   input,   width = 1,                      .endofpacket
		.ff_rx_rdy        (_connected_to_ff_rx_rdy_),        //  output,   width = 1,                      .ready
		.ff_rx_sop        (_connected_to_ff_rx_sop_),        //   input,   width = 1,                      .startofpacket
		.ff_rx_dval       (_connected_to_ff_rx_dval_),       //   input,   width = 1,                      .valid
		.rx_err           (_connected_to_rx_err_),           //   input,   width = 5,                      .error
		.ram_addr         (_connected_to_ram_addr_),         //  output,  width = 10,         avalon_master.address
		.ram_chipselect   (_connected_to_ram_chipselect_),   //  output,   width = 1,                      .chipselect
		.ram_write        (_connected_to_ram_write_),        //  output,   width = 1,                      .write
		.ram_readdata     (_connected_to_ram_readdata_),     //   input,  width = 32,                      .readdata
		.ram_writedata    (_connected_to_ram_writedata_),    //  output,  width = 32,                      .writedata
		.ram_byteenable   (_connected_to_ram_byteenable_),   //  output,   width = 4,                      .byteenable
		.ram_waitrequest  (_connected_to_ram_waitrequest_),  //   input,   width = 1,                      .waitrequest
		.clk_original     (_connected_to_clk_original_),     //   input,   width = 1,                 clock.clk
		.rst              (_connected_to_rst_),              //   input,   width = 1,                 reset.reset
		.rx_afull_data    (_connected_to_rx_afull_data_),    //  output,   width = 2,           fifo_status.data
		.rx_afull_valid   (_connected_to_rx_afull_valid_),   //  output,   width = 1,                      .valid
		.rx_afull_channel (_connected_to_rx_afull_channel_), //  output,   width = 2,                      .channel
		.fifo_status_clk  (_connected_to_fifo_status_clk_),  //   input,   width = 1,       fifo_status_clk.clk
		.data_saved       (_connected_to_data_saved_)        //  output,   width = 1,            data_saved.data_saved
	);

