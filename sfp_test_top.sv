// `define TEST 1

`ifdef TEST
	`define ALLOW_SEND		    1'b0
	`define PERIOD_BTN_SEND_1	32'h000000ff // 32'hffffffff	//
	`define PERIOD_BTN_SEND_2	32'h000001ff // 32'hffffffff	//
    `define TIME_TO_BLINK       32'd2000
    `define BLINK_LED_DIVIDE    32'd25_000 
    `define I2C_CLK_DIVIDE      32'd62 
    `define RELAX_TIME          32'd1500
`else
	`define ALLOW_SEND		    1'b0
    `define PERIOD_BTN_SEND_1	32'h05F5E100
	`define PERIOD_BTN_SEND_2	32'h06F5E100
    `define TIME_TO_BLINK       32'd50_000_000 
    `define BLINK_LED_DIVIDE    32'd25_000_000
    `define I2C_CLK_DIVIDE      32'd124 
    `define RELAX_TIME          32'd50_000
`endif

module sfp_test_top (
    input   logic   clk_50  ,
    input   logic   rst_n   ,

    input   logic   clk_125_lvds_tse, // need to setup in clockController.exe
    output  logic   reset_phy   ,
// ---------------------------------------------------
    input   logic   sgmii_rx_1  , 
    output  logic   sgmii_tx_1  ,

    input   logic   sgmii_rx_2  , 
    output  logic   sgmii_tx_2  ,

    input   logic   sgmii_rx_3  , 
    output  logic   sgmii_tx_3  ,

    input   logic   sgmii_rx_4  , 
    output  logic   sgmii_tx_4  ,

    inout   tri1    i2c_scl_1   ,
    inout   tri1    i2c_sda_1   ,

    inout   tri1    i2c_scl_2   ,
    inout   tri1    i2c_sda_2   ,    
// ---------------------------------------------------
    // pcie signals
	input  wire         pcie_clk		,         
	input  wire         pcie_perst		,
	input  wire         pcie_rx_in0		, 
	input  wire         pcie_rx_in1		, 
	input  wire         pcie_rx_in2		, 
	input  wire         pcie_rx_in3		, 
	output wire         pcie_tx_out0	,
	output wire         pcie_tx_out1	,
	output wire         pcie_tx_out2	,
	output wire         pcie_tx_out3	,
// ---------------------------------------------------
    // ddr signals
    input logic           clk_ddr       ,

    input  wire           oct_rzqin     ,

    output wire           mem_ck        ,          
    output wire           mem_ck_n      ,          
    output wire [14:0]    mem_a         ,
    output wire [2:0]     mem_ba        ,
    output wire [0:0]     mem_cke       ,
    output wire [0:0]     mem_cs_n      ,
    output wire [0:0]     mem_odt       ,
    output wire           mem_reset_n   ,
    output wire           mem_we_n      ,
    output wire           mem_ras_n     ,
    output wire           mem_cas_n     ,
    inout  wire [4:0]     mem_dqs       ,
    inout  wire [4:0]     mem_dqs_n     ,
    inout  wire [39:0]    mem_dq        ,
    output wire [4:0]     mem_dm        ,     
// ---------------------------------------------------
    //output test leds
    output  logic   sfp_txflt_led,
    output  logic   sfp_rlos_led,
    output  logic   sfp_prsn_led,

    output  logic   blink_led
// ---------------------------------------------------    
);

logic clk_50_pll;

//Blinking led to determine the health of the system
generator #(`BLINK_LED_DIVIDE) blink_led_clk_divide	(
	.nreset_i	(rst_n),
	.i_clk		(clk_50_pll),
	.o_clk 		(blink_led)
);


logic magic_wakeup_1;
logic magic_wakeup_2;


logic mac_inited;
logic main_reset;

logic [24:0]    start_ram_addr_1;
logic [24:0]    start_ram_addr_2;

logic cmd_send_1;
logic cmd_send_2;

// logic sgmii_rx_3; 
// logic sgmii_rx_4; 

// assign sgmii_rx_3 = 1'b1;
// assign sgmii_rx_4 = 1'b1;

// logic sgmii_tx_3;
// logic sgmii_tx_4;

logic tx_analogreset;
logic tx_digitalreset;
logic rx_analogreset;
logic rx_digitalreset;
logic rx_ready;
logic tx_ready;

logic status_0_crs          ;
logic status_0_link         ;
logic status_0_panel_link   ;
logic status_0_col          ;
logic status_0_an           ;
logic status_0_char_err     ;
logic status_0_disp_err     ;

logic tx_analogreset_0      ;
logic tx_digitalreset_0     ;
logic rx_analogreset_0      ;
logic rx_digitalreset_0     ;

assign tx_analogreset_0  = tx_analogreset;  //main_reset;//1'b0 ;
assign tx_digitalreset_0 = tx_digitalreset; //main_reset;//1'b0 ;
assign rx_analogreset_0  = rx_analogreset;  //main_reset;//1'b0 ;
assign rx_digitalreset_0 = rx_digitalreset; //main_reset;//1'b0 ;

logic tx_cal_busy_0;
logic rx_cal_busy_0;

logic rx_set_locktodata_0;
logic rx_set_locktoref_0;
logic rx_is_lockedtoref_0;
logic rx_is_lockedtodata_0;

assign rx_set_locktodata_0  = 1'b0;
assign rx_set_locktoref_0   = 1'b0;

logic serdes_control_connection_0;


logic status_1_crs          ;
logic status_1_link         ;
logic status_1_panel_link   ;
logic status_1_col          ;
logic status_1_an           ;
logic status_1_char_err     ;
logic status_1_disp_err     ;


logic tx_analogreset_1      ;
logic tx_digitalreset_1     ;
logic rx_analogreset_1      ;
logic rx_digitalreset_1     ;

assign tx_analogreset_1  = tx_analogreset;  //main_reset;//1'b0 ;
assign tx_digitalreset_1 = tx_digitalreset; //main_reset;//1'b0 ;
assign rx_analogreset_1  = rx_analogreset;  //main_reset;//1'b0 ;
assign rx_digitalreset_1 = rx_digitalreset; //main_reset;//1'b0 ;

logic tx_cal_busy_1;
logic rx_cal_busy_1;

logic rx_set_locktodata_1;
logic rx_set_locktoref_1;
logic rx_is_lockedtoref_1;
logic rx_is_lockedtodata_1;

assign rx_set_locktodata_1  = 1'b0;
assign rx_set_locktoref_1   = 1'b0;

logic serdes_control_connection_1;

assign tx_cal_busy = tx_cal_busy_1 || tx_cal_busy_0;
assign rx_cal_busy = rx_cal_busy_1 || rx_cal_busy_0;

assign rx_is_lockedtodata = rx_is_lockedtodata_1 || rx_is_lockedtodata_0 ;

logic mdio_mdc ;
logic mdio_in  ;
logic mdio_out ;
logic mdio_oen ;

logic data_saved_1;
logic data_saved_2;

assign mdio_in = 1'b1;

// ---------------------------------------------------
// pcie signals
wire pcie_npor;
assign pcie_npor = 1'b1;

logic [5:0] pcie_start_ram_addr;
logic   pcie_send_cmd;      
// ---------------------------------------------------
// ddr signals
logic   ddr_setup_done;
logic   ddr_ready;
logic   ddr_avalon_clk;
logic   ddr_avalon_reset;
logic   ddr_cal_success;
// ---------------------------------------------------

parameter test = 0;


system_design #(.setup_ddr_test(test)) platform_design (
		.clock_50_clk                           (clk_50_pll         ),                         
		
        .ddr_avalon_clk                         (ddr_avalon_clk     ),       

        .ddr3_global_reset_n_reset_n            (rst_n             ),       
        .ddr3_clock_clk                         (clk_ddr            ),                    
        .ddr3_oct_oct_rzqin                     (oct_rzqin          ),                
        .ddr3_mem_mem_ck                        (mem_ck             ),                   
        .ddr3_mem_mem_ck_n                      (mem_ck_n           ),                 
        .ddr3_mem_mem_a                         (mem_a              ),                    
        .ddr3_mem_mem_ba                        (mem_ba             ),                   
        .ddr3_mem_mem_cke                       (mem_cke            ),                  
        .ddr3_mem_mem_cs_n                      (mem_cs_n           ),                 
        .ddr3_mem_mem_odt                       (mem_odt            ),                  
        .ddr3_mem_mem_reset_n                   (mem_reset_n        ),              
        .ddr3_mem_mem_we_n                      (mem_we_n           ),                 
        .ddr3_mem_mem_ras_n                     (mem_ras_n          ),                
        .ddr3_mem_mem_cas_n                     (mem_cas_n          ),                
        .ddr3_mem_mem_dqs                       (mem_dqs            ),                  
        .ddr3_mem_mem_dqs_n                     (mem_dqs_n          ),                
        .ddr3_mem_mem_dq                        (mem_dq             ),                   
        .ddr3_mem_mem_dm                        (mem_dm             ),  

        .ddr_avalon_reset_reset                 (ddr_avalon_reset   ),            

        .mac_inited_mac_inited                  (mac_inited         ),

        .pcie_refclk_clk                        (pcie_clk           ),         
        .pcie_npor_npor                         (pcie_npor          ),          
        .pcie_npor_pin_perst                    (pcie_perst         ),     
        .pcie_hip_serial_rx_in0                 (pcie_rx_in0	    ),  
        .pcie_hip_serial_rx_in1                 (pcie_rx_in1	    ),  
        .pcie_hip_serial_rx_in2                 (pcie_rx_in2	    ),  
        .pcie_hip_serial_rx_in3                 (pcie_rx_in3	    ),  
        .pcie_hip_serial_tx_out0                (pcie_tx_out0       ), 
        .pcie_hip_serial_tx_out1                (pcie_tx_out1       ), 
        .pcie_hip_serial_tx_out2                (pcie_tx_out2       ), 
        .pcie_hip_serial_tx_out3                (pcie_tx_out3       ), 

        .pll_refclk_clk                         (clk_50             ),  

        .receive_packet_1_data_saved_data_saved (data_saved_1       ),                     
		.receive_packet_2_data_saved_data_saved (data_saved_2       ),
        .reset_main_out_reset                   (main_reset         ),
        .reset_mod_clock_clk                    (clk_50             ),                  
		.reset_mod_reset_reset_n                (rst_n & (ddr_cal_success | test)),              
		.reset_mod_reset_phy_reset              (reset_phy          ),    

        .pcie_send_control_start_ram_addr       (pcie_start_ram_addr), 
        .pcie_send_control_signal               (pcie_send_cmd      ),                 
		
        .send_packet_1_control_start_ram_addr   (start_ram_addr_1   ), 
		.send_packet_1_control_cmd_send         (cmd_send_1         ),       
		
        // .send_packet_2_control_start_ram_addr   (start_ram_addr_2   ), 
		// .send_packet_2_control_cmd_send         (cmd_send_2         ),       
		
        //.ddr_setup_setup_done                   (ddr_setup_done     ),
        //.ddr_ready_ram_ready                    (ddr_ready          ),  
        .reset_board_reset                      (rst_n              ),             

        .mem_cal_success_cal_success            (ddr_cal_success    ),
        .mac_misc_1_magic_wakeup                (magic_wakeup_1     ),           
		.mac_misc_1_magic_sleep_n               (1'b1               ),           
		.mac_misc_1_tx_crc_fwd                  (1'b0               ),           
		
        .mac_mdio_mdc                           (mdio_mdc           ),     
        .mac_mdio_mdio_in                       (mdio_in            ), 
        .mac_mdio_mdio_out                      (mdio_out           ),
        .mac_mdio_mdio_oen                      (mdio_oen           ),

        .mac_misc_2_magic_wakeup                (magic_wakeup_2     ),           
		.mac_misc_2_magic_sleep_n               (1'b1               ),           
		.mac_misc_2_tx_crc_fwd                  (1'b0               ),           
		
        .tse_ref_clk                            (clk_125_lvds_tse   ),

        .status_led_connection_0_crs            (status_0_crs       ),       
        .status_led_connection_0_link           (status_0_link      ),      
        .status_led_connection_0_panel_link     (status_0_panel_link),
        .status_led_connection_0_col            (status_0_col       ),       
        .status_led_connection_0_an             (status_0_an        ),        
        .status_led_connection_0_char_err       (status_0_char_err  ),  
        .status_led_connection_0_disp_err       (status_0_disp_err  ),  

        .tx_analogreset_0_tx_analogreset        (tx_analogreset_0   ),  
        .tx_digitalreset_0_tx_digitalreset      (tx_digitalreset_0  ),
        .rx_analogreset_0_rx_analogreset        (rx_analogreset_0   ),  
        .rx_digitalreset_0_rx_digitalreset      (rx_digitalreset_0  ),

        .tx_cal_busy_0_tx_cal_busy              (tx_cal_busy_0      ),        
        .rx_cal_busy_0_rx_cal_busy              (rx_cal_busy_0      ),        
        
        // .tse_tx_serial_clk_0_clk                (clk_1250           ),
        .tse_rx_cdr_refclk_0_clk                (clk_125_lvds_tse   ),

        .rx_set_locktodata_0_rx_set_locktodata      (rx_set_locktodata_0    ),  
        .rx_set_locktoref_0_rx_set_locktoref        (rx_set_locktoref_0     ),    
        .rx_is_lockedtoref_0_rx_is_lockedtoref      (rx_is_lockedtoref_0    ),  
        .rx_is_lockedtodata_0_rx_is_lockedtodata    (rx_is_lockedtodata_0   ),

        .serdes_control_connection_0_export         (serdes_control_connection_0),

        .status_led_connection_1_crs            (status_1_crs       ),       
        .status_led_connection_1_link           (status_1_link      ),      
        .status_led_connection_1_panel_link     (status_1_panel_link),
        .status_led_connection_1_col            (status_1_col       ),       
        .status_led_connection_1_an             (status_1_an        ),        
        .status_led_connection_1_char_err       (status_1_char_err  ),  
        .status_led_connection_1_disp_err       (status_1_disp_err  ),  

        .tx_analogreset_1_tx_analogreset        (tx_analogreset_1   ),  
        .tx_digitalreset_1_tx_digitalreset      (tx_digitalreset_1  ),
        .rx_analogreset_1_rx_analogreset        (rx_analogreset_1   ),  
        .rx_digitalreset_1_rx_digitalreset      (rx_digitalreset_1  ),

        .tx_cal_busy_1_tx_cal_busy              (tx_cal_busy_1      ),        
        .rx_cal_busy_1_rx_cal_busy              (rx_cal_busy_1      ),        
        
        // .tse_tx_serial_clk_1_clk                (clk_1250           ),
        .tse_rx_cdr_refclk_1_clk                (clk_125_lvds_tse   ),

        .rx_set_locktodata_1_rx_set_locktodata      (rx_set_locktodata_1    ),  
        .rx_set_locktoref_1_rx_set_locktoref        (rx_set_locktoref_1     ),    
        .rx_is_lockedtoref_1_rx_is_lockedtoref      (rx_is_lockedtoref_1    ),  
        .rx_is_lockedtodata_1_rx_is_lockedtodata    (rx_is_lockedtodata_1   ),

        .serdes_control_connection_1_export         (serdes_control_connection_1),
        
        .sgmii_1_rxp                            (sgmii_rx_1         ),           
		.sgmii_1_txp                            (sgmii_tx_1         ),           
		
        .sgmii_2_rxp                            (sgmii_rx_2         ),           
		.sgmii_2_txp                            (sgmii_tx_2         ),   
        
        .sgmii_3_rxp                            (sgmii_rx_3         ),           
		.sgmii_3_txp                            (sgmii_tx_3         ),

        .sgmii_4_rxp                            (sgmii_rx_4         ),           
		.sgmii_4_txp                            (sgmii_tx_4         ),

        .tx_2_reset_board_reset                 (rst_n              ),                  
        .tx_2_control_start_ram_addr            (start_ram_addr_2   ),             
        .tx_2_control_cmd_send                  (cmd_send_2         ),                           

        .xcvr_pll_powerdown_pll_powerdown       (1'b0               ),
        .xcvr_pll_refclk_clk                    (clk_125_lvds_tse   )             
	);

phyip_reset phy_resets
(
   .clk                 (clk_125_lvds_tse   ), // 125 MHz clock
   .reset               (main_reset         ),

   .tx_analogreset      (tx_analogreset     ),
   .tx_digitalreset     (tx_digitalreset    ),
   .tx_ready            (tx_ready           ),

   .rx_analogreset      (rx_analogreset     ),
   .rx_digitalreset     (rx_digitalreset    ),
   .rx_ready            (rx_ready           ),

   .tx_cal_busy         (tx_cal_busy        ),
   .rx_is_lockedtodata  (rx_is_lockedtodata ),
   .rx_cal_busy         (rx_cal_busy        )
);

logic   [31:0]      counter_to_send     ;
logic               send_cmd            ;
logic	[24:0]		transmit_start_addr		;

assign start_ram_addr_1 = transmit_start_addr;
assign start_ram_addr_2 = pcie_start_ram_addr; //25'd5; //transmit_start_addr;

logic cmd_2_send_first;

always @(posedge clk_50_pll, posedge main_reset) 
begin
    if(main_reset)
    begin
        counter_to_send <= 32'd0;  
        cmd_send_1    <= 1'b0;  
    end 
    else
    begin
		if(mac_inited & rx_ready )
		begin
            if(`ALLOW_SEND == 1'b1 | pcie_send_cmd)
            begin
                counter_to_send <= counter_to_send + 1;
                if(counter_to_send == `PERIOD_BTN_SEND_1)
                begin
                    cmd_send_1 <= 1'b1;
                    transmit_start_addr <= 25'd1;
                end
                else if(counter_to_send == `PERIOD_BTN_SEND_1 + 32'd3)
                begin
                    cmd_send_1 <= 1'b0;
                end
                else if(counter_to_send == `PERIOD_BTN_SEND_2 + 32'd10)
                begin
                    counter_to_send <= 32'd0;                
                end
            end
            else if(pcie_send_cmd)
            begin
                cmd_send_1 <= 1'b1;
            end
            else
            begin
                cmd_send_1 <= 1'b0;
            end
		end   
    end   
end

always @(posedge clk_50_pll, posedge main_reset) 
begin
    if(main_reset)
    begin
        cmd_send_2    <= 1'b0;  

        cmd_2_send_first <= 1'b0;
    end 
    else
    begin
		if(mac_inited && rx_ready )
		begin
            if(pcie_send_cmd)
            begin
                if(cmd_send_2 == 1'b1)
                begin
                    if(counter_to_send == `PERIOD_BTN_SEND_2 + 32'd3)
                    begin
                        cmd_send_2 <= 1'b0;
                    end
                end
                else
                begin
                    cmd_send_2 <= 1'b1;
                end
            end
            else
            begin
                if(counter_to_send == `PERIOD_BTN_SEND_2 /*&& cmd_2_send_first == 1'b0*/ && `ALLOW_SEND)
                begin
                    cmd_send_2 <= 1'b1;
                end
                else if(counter_to_send == `PERIOD_BTN_SEND_2 + 32'd3  /*&& cmd_2_send_first == 1'b0 */ && `ALLOW_SEND)
                begin    
                    cmd_send_2 <= 1'b0; 

                    cmd_2_send_first <= 1'b1;   
                end
                else if(data_saved_2 && ~cmd_send_2)
                begin
                    cmd_send_2 <= 1'b1;
                end
                else if(~data_saved_2)
                begin
                    cmd_send_2 <= 1'b0;
                end
            end
		end   
    end   
end

// SFP expnaders gpio_led_blink
logic clk_i2c; 
generator #(`I2C_CLK_DIVIDE) i2c_clk_divide	(
	.nreset_i	(rst_n),
	.i_clk		(clk_50_pll),
	.o_clk 		(clk_i2c)
);

assign sfp_txflt_led    =   mac_inited; //sfp_txflt;
assign sfp_rlos_led     =   rx_ready; //sfp_rlos;
assign sfp_prsn_led     =   rx_is_lockedtoref_0; //sfp_prsn;


//Put in separate module and duplicate for second expander
expander_top #(.relax_time(`RELAX_TIME), .time_to_blink(`TIME_TO_BLINK)) 
first_expander
(
    .clk_50 (clk_50_pll),
    .rst_n  (rst_n),

    .clk_i2c    (clk_i2c),

    .i2c_scl    (i2c_scl_1),
    .i2c_sda    (i2c_sda_1)
);

expander_top #(.relax_time(`RELAX_TIME), .time_to_blink(`TIME_TO_BLINK)) 
second_expander
(
    .clk_50 (clk_50_pll),
    .rst_n  (rst_n),

    .clk_i2c    (clk_i2c),

    .i2c_scl    (i2c_scl_2),
    .i2c_sda    (i2c_sda_2)
);

endmodule