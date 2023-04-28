	send_cmd_pcie u0 (
		.clk                  (_connected_to_clk_),                  //   input,   width = 1,        clock.clk
		.rst_n                (_connected_to_rst_n_),                //   input,   width = 1,        reset.reset_n
		.avalon_mm_read       (_connected_to_avalon_mm_read_),       //   input,   width = 1, avalon_slave.read
		.avalon_mm_write      (_connected_to_avalon_mm_write_),      //   input,   width = 1,             .write
		.avalon_mm_addr       (_connected_to_avalon_mm_addr_),       //   input,  width = 16,             .address
		.avalon_mm_write_data (_connected_to_avalon_mm_write_data_), //   input,  width = 32,             .writedata
		.avalon_mm_read_data  (_connected_to_avalon_mm_read_data_),  //  output,  width = 32,             .readdata
		.avalon_mm_rd_valid   (_connected_to_avalon_mm_rd_valid_),   //  output,   width = 1,             .readdatavalid
		.start_ram_addr       (_connected_to_start_ram_addr_),       //  output,   width = 6, send_control.start_ram_addr
		.send_cmd             (_connected_to_send_cmd_)              //  output,   width = 1,             .signal
	);

