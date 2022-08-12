	send_packet_1 u0 (
		.clk_original   (_connected_to_clk_original_),   //   input,   width = 1,                   clock.clk
		.rst            (_connected_to_rst_),            //   input,   width = 1,                   reset.reset
		.ram_addr       (_connected_to_ram_addr_),       //  output,  width = 10,           avalon_master.address
		.ram_chipselect (_connected_to_ram_chipselect_), //  output,   width = 1,                        .chipselect
		.ram_write      (_connected_to_ram_write_),      //  output,   width = 1,                        .write
		.ram_readdata   (_connected_to_ram_readdata_),   //   input,  width = 32,                        .readdata
		.ram_writedata  (_connected_to_ram_writedata_),  //  output,  width = 32,                        .writedata
		.ram_byteenable (_connected_to_ram_byteenable_), //  output,   width = 4,                        .byteenable
		.ff_tx_data     (_connected_to_ff_tx_data_),     //  output,   width = 8, avalon_streaming_source.data
		.ff_tx_eop      (_connected_to_ff_tx_eop_),      //  output,   width = 1,                        .endofpacket
		.ff_tx_err      (_connected_to_ff_tx_err_),      //  output,   width = 1,                        .error
		.ff_tx_rdy      (_connected_to_ff_tx_rdy_),      //   input,   width = 1,                        .ready
		.ff_tx_sop      (_connected_to_ff_tx_sop_),      //  output,   width = 1,                        .startofpacket
		.ff_tx_wren     (_connected_to_ff_tx_wren_),     //  output,   width = 1,                        .valid
		.start_ram_addr (_connected_to_start_ram_addr_), //   input,  width = 25,                 control.start_ram_addr
		.cmd_send       (_connected_to_cmd_send_)        //   input,   width = 1,                        .cmd_send
	);

