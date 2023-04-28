module send_cmd_pcie (
		input  wire        clk,                  //        clock.clk
		input  wire        rst_n,                //        reset.reset_n
		input  wire        avalon_mm_read,       // avalon_slave.read
		input  wire        avalon_mm_write,      //             .write
		input  wire [15:0] avalon_mm_addr,       //             .address
		input  wire [31:0] avalon_mm_write_data, //             .writedata
		output wire [31:0] avalon_mm_read_data,  //             .readdata
		output wire        avalon_mm_rd_valid,   //             .readdatavalid
		output wire [5:0]  start_ram_addr,       // send_control.start_ram_addr
		output wire        send_cmd              //             .signal
	);
endmodule

