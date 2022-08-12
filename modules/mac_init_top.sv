module mac_init_top
(
    //  Standart wires
    input   logic           clk     ,
	input   logic           reset   ,

    //  Avalone MM signals
    output  logic   [9:0]   ADR_O   ,
    input   logic   [31:0]  DAT_I   ,
    output  logic   [31:0]  DAT_O   ,
    output  logic           RD      ,
    output  logic           WR      ,
    input   logic           BUSY    , 

    //  Result of work of this module
    output  logic           mac_inited,

    input   logic           led_link
);

logic           wr_rq		;
logic           rd_rq		;
logic           rd_valid	;
logic   [31:0]  wr_adr		;
logic   [31:0]  rd_adr		;
logic   [31:0]  wr_data     ;
logic   [31:0]  rd_data     ;
logic           action_done ;

avalon_mm_tse_init avalon_mm (
    .RST_I          (reset          ),
    .CLK_I          (clk            ),

    //Control signals
    .wr_rq          (wr_rq          ),
    .rd_rq          (rd_rq          ),
    .rd_valid       (rd_valid       ),
    .wr_adr         (wr_adr         ),
    .rd_adr         (rd_adr         ),
    .wr_data        (wr_data        ),
    .rd_data        (rd_data        ),
    .action_done_d  (action_done    ),

    //Avalone MM signals
    .ADR_O          (ADR_O          ),
    .DAT_I          (DAT_I          ),
    .DAT_O          (DAT_O          ),
    .RD             (RD             ),
    .WR             (WR             ),
    .BUSY           (BUSY           )    
);

initiate_mac control_init
(
	.clk            (clk        ),
	.reset          (reset      ),
	//Control avalon module signals
    .wr_rq		    (wr_rq      ),
    .rd_rq		    (rd_rq      ),
    .rd_valid	    (rd_valid   ),
    .wr_adr		    (wr_adr     ),
    .rd_adr		    (rd_adr     ),
    .wr_data        (wr_data    ),
    .rd_data        (rd_data    ),
    .action_done    (action_done),

    .mac_inited     (mac_inited ),

    .led_link       (led_link   )
);

endmodule