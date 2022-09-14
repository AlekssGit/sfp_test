module send_packet_1 (
		input  wire        clk_original,    //                   clock.clk
		input  wire        rst,             //                   reset.reset
		output wire [9:0]  ram_addr,        //           avalon_master.address
		output wire        ram_chipselect,  //                        .chipselect
		output wire        ram_write,       //                        .write
		input  wire [31:0] ram_readdata,    //                        .readdata
		output wire [31:0] ram_writedata,   //                        .writedata
		output wire [3:0]  ram_byteenable,  //                        .byteenable
		input  wire        ram_waitrequest, //                        .waitrequest
		output wire [7:0]  ff_tx_data,      // avalon_streaming_source.data
		output wire        ff_tx_eop,       //                        .endofpacket
		output wire        ff_tx_err,       //                        .error
		input  wire        ff_tx_rdy,       //                        .ready
		output wire        ff_tx_sop,       //                        .startofpacket
		output wire        ff_tx_wren,      //                        .valid
		input  wire [24:0] start_ram_addr,  //                 control.start_ram_addr
		input  wire        cmd_send         //                        .cmd_send
	);
endmodule

