module ed_sim_mem (
		input  wire [0:0]  mem_ck,      // mem.mem_ck,      CK clock
		input  wire [0:0]  mem_ck_n,    //    .mem_ck_n,    CK clock (negative leg)
		input  wire [14:0] mem_a,       //    .mem_a,       Address
		input  wire [2:0]  mem_ba,      //    .mem_ba,      Bank address
		input  wire [0:0]  mem_cke,     //    .mem_cke,     Clock enable
		input  wire [0:0]  mem_cs_n,    //    .mem_cs_n,    Chip select
		input  wire [0:0]  mem_odt,     //    .mem_odt,     On-die termination
		input  wire [0:0]  mem_reset_n, //    .mem_reset_n, Asynchronous reset
		input  wire [0:0]  mem_we_n,    //    .mem_we_n,    WE command
		input  wire [0:0]  mem_ras_n,   //    .mem_ras_n,   RAS command
		input  wire [0:0]  mem_cas_n,   //    .mem_cas_n,   CAS command
		inout  wire [4:0]  mem_dqs,     //    .mem_dqs,     Data strobe
		inout  wire [4:0]  mem_dqs_n,   //    .mem_dqs_n,   Data strobe (negative leg)
		inout  wire [39:0] mem_dq,      //    .mem_dq,      Read/write data
		input  wire [4:0]  mem_dm       //    .mem_dm,      Write data mask
	);
endmodule

