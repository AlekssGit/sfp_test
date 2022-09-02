// `define TEST 1

`ifdef TEST
	`define ALLOW_SEND		    1'b1
	`define PERIOD_BTN_SEND_1	32'h000000ff // 32'hffffffff	//
	`define PERIOD_BTN_SEND_2	32'h000001ff // 32'hffffffff	//
    `define TIME_TO_BLINK       32'd2000
    `define BLINK_LED_DIVIDE    32'd25_000 
    `define I2C_CLK_DIVIDE      32'd62 
`else
	`define ALLOW_SEND		    1'b0
    `define PERIOD_BTN_SEND_1	32'h05F5E100
	`define PERIOD_BTN_SEND_2	32'h06F5E100
    `define TIME_TO_BLINK       32'd50_000_000 
    `define BLINK_LED_DIVIDE    32'd25_000_000
    `define I2C_CLK_DIVIDE      32'd124 
`endif

module sfp_test_top (
    input   logic   clk_50  ,
    input   logic   rst_n   ,

    input   logic   clk_125_lvds_tse,
    output  logic   reset_phy   ,

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

    //output test leds
    output  logic   sfp_txflt_led,
    output  logic   sfp_rlos_led,
    output  logic   sfp_prsn_led,

    output  logic   blink_led
);

logic magic_wakeup_1;
logic magic_wakeup_2;

logic clk_50_pll;
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

assign tx_cal_busy = tx_cal_busy_0;
assign rx_cal_busy = rx_cal_busy_0;


logic rx_set_locktodata_0;
logic rx_set_locktoref_0;
logic rx_is_lockedtoref_0;
logic rx_is_lockedtodata_0;

assign rx_is_lockedtodata = rx_is_lockedtodata_0;

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

logic mdio_mdc ;
logic mdio_in  ;
logic mdio_out ;
logic mdio_oen ;

assign mdio_in = 1'b1;

system_design platform_design (
		.clock_50_clk                           (clk_50_pll         ),                         
		
        .mac_inited_mac_inited                  (mac_inited         ),                
		.init_mac_led_link_signal               (status_0_link      ),
        .pll_refclk_clk                         (clk_50             ),                       
		
        .reset_main_out_reset                   (main_reset         ),
        .reset_mod_clock_clk                    (clk_50             ),                  
		.reset_mod_reset_reset_n                (rst_n              ),              
		.reset_mod_reset_phy_reset              (reset_phy          ),            
		
        .send_packet_1_control_start_ram_addr   (start_ram_addr_1   ), 
		.send_packet_1_control_cmd_send         (cmd_send_1         ),       
		
        .send_packet_2_control_start_ram_addr   (start_ram_addr_2   ), 
		.send_packet_2_control_cmd_send         (cmd_send_2         ),       
		
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

        .tx_analogreset_0_tx_analogreset        (tx_analogreset_0 ),  
        .tx_digitalreset_0_tx_digitalreset      (tx_digitalreset_0),
        .rx_analogreset_0_rx_analogreset        (rx_analogreset_0 ),  
        .rx_digitalreset_0_rx_digitalreset      (rx_digitalreset_0),

        .tx_cal_busy_0_tx_cal_busy              (tx_cal_busy_0),        
        .rx_cal_busy_0_rx_cal_busy              (rx_cal_busy_0),        
        
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

        .tx_analogreset_1_tx_analogreset        (tx_analogreset_1 ),  
        .tx_digitalreset_1_tx_digitalreset      (tx_digitalreset_1),
        .rx_analogreset_1_rx_analogreset        (rx_analogreset_1 ),  
        .rx_digitalreset_1_rx_digitalreset      (rx_digitalreset_1),

        .tx_cal_busy_1_tx_cal_busy              (tx_cal_busy_1),        
        .rx_cal_busy_1_rx_cal_busy              (rx_cal_busy_1),        
        
        // .tse_tx_serial_clk_1_clk                (clk_1250           ),
        .tse_rx_cdr_refclk_1_clk                (clk_125_lvds_tse   ),

        .rx_set_locktodata_1_rx_set_locktodata      (rx_set_locktodata_1    ),  
        .rx_set_locktoref_1_rx_set_locktoref        (rx_set_locktoref_1     ),    
        .rx_is_lockedtoref_1_rx_is_lockedtoref      (rx_is_lockedtoref_1    ),  
        .rx_is_lockedtodata_1_rx_is_lockedtodata    (rx_is_lockedtodata_1   ),

        .serdes_control_connection_1_export         (serdes_control_connection_1),
        
        .sgmii_1_rxp                          (sgmii_rx_1         ),           
		.sgmii_1_txp                          (sgmii_tx_1         ),           
		
        .sgmii_2_rxp                          (sgmii_rx_2         ),           
		.sgmii_2_txp                          (sgmii_tx_2         ),   
        
        .sgmii_3_rxp                          (sgmii_rx_3         ),           
		.sgmii_3_txp                          (sgmii_tx_3         ),

        .sgmii_4_rxp                          (sgmii_rx_4         ),           
		.sgmii_4_txp                          (sgmii_tx_4         ),

        .xcvr_pll_powerdown_pll_powerdown     (1'b0),
        .xcvr_pll_refclk_clk                  (clk_125_lvds_tse)             
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

// assign cmd_send_1 = send_cmd;
// assign cmd_send_2 = send_cmd;

assign start_ram_addr_1 = transmit_start_addr;
assign start_ram_addr_2 = transmit_start_addr;

always @(posedge clk_50_pll, posedge main_reset) 
begin
    if(main_reset)
    begin
        counter_to_send = 32'd0;  
        cmd_send_1    = 1'b0;  
        cmd_send_2    = 1'b0;  
    end 
    else
    begin
		if(mac_inited && rx_ready )
		begin
            counter_to_send = counter_to_send + 1;
            if(counter_to_send == `PERIOD_BTN_SEND_1)
            begin
                cmd_send_1 = 1'b1;
                transmit_start_addr = 25'd1;
            end
            else if(counter_to_send == `PERIOD_BTN_SEND_2)
            begin
                cmd_send_2 = 1'b1;
                transmit_start_addr = 25'd1;
            end
            else if(counter_to_send == `PERIOD_BTN_SEND_1 + 32'd3)
                cmd_send_1 = 1'b0;
            else if(counter_to_send == `PERIOD_BTN_SEND_2 + 32'd3)
                cmd_send_2 = 1'b0;    
            else if(counter_to_send == `PERIOD_BTN_SEND_2 + 32'd10)
                counter_to_send = 32'd0;
		end   
    end   
end



// SFP expnader gpio_led_blink
logic   sfp_rled    ;
logic   sfp_gled    ;
logic   sfp_txdis   ;
logic   sfp_txflt   ;
logic   sfp_rs1     ;
logic   sfp_rlos    ;
logic   sfp_rs0     ;
logic   sfp_prsn    ;

assign sfp_txflt_led    =   mac_inited; //sfp_txflt;
assign sfp_rlos_led     =   rx_ready; //sfp_rlos;
assign sfp_prsn_led     =   rx_is_lockedtoref_0; //sfp_prsn;

logic   need_write_reg_o;
logic   need_read_reg_i;
logic   need_read_reg_o;
logic   dev_ready;

logic clk_i2c; 
generator #(`I2C_CLK_DIVIDE) i2c_clk_divide	(
	.nreset_i	(rst_n),
	.i_clk		(clk_50_pll),
	.o_clk 		(clk_i2c)
);

generator #(`BLINK_LED_DIVIDE) blink_led_clk_divide	(
	.nreset_i	(rst_n),
	.i_clk		(clk_50_pll),
	.o_clk 		(blink_led)
);

i2c_expander_sfp expander_device
(
    // Clock module
    .clk                (clk_50_pll ),
    // Reset module
    .rst_n              (rst_n      ),

    // Clock for i2c, frquency is scl*2
    .clk_i2c            (clk_i2c    ),

    //  i2c wires
    .i2c_scl            (i2c_scl_1  ),
    .i2c_sda            (i2c_sda_1  ),

    //  Expander GPIO
    .sfp_rled           (sfp_rled   ),
    .sfp_gled           (sfp_gled   ),
    .sfp_txdis          (sfp_txdis  ),
    .sfp_txflt          (sfp_txflt  ),
    .sfp_rs1            (sfp_rs1    ),
    .sfp_rlos           (sfp_rlos   ),
    .sfp_rs0            (sfp_rs0    ),
    .sfp_prsn           (sfp_prsn   ),

    // Control conduit
    .need_write_reg_o   (need_write_reg_o),
    .need_read_reg_i    (need_read_reg_i ),
    .need_read_reg_o    (need_read_reg_o ),
    .ready              (dev_ready       )
);

assign sfp_rled     = ~sfp_gled;
assign sfp_txdis    = 1'b0;
assign sfp_rs1      = 1'b0;
assign sfp_rs0      = 1'b0;

logic [31:0] timer;

enum int unsigned { IDLE, WAIT_TIMER, WRITE_O, READ_I, READ_O } state, state_next;

logic dev_ready_prev;

always_ff @(posedge clk_50_pll, negedge rst_n)
begin
    if(~rst_n)
    begin
        dev_ready_prev <= 1'b0;
    end
    else
    begin
        dev_ready_prev <= dev_ready;
    end
end

always_ff @(posedge clk_50_pll, negedge rst_n)
begin
    if(~rst_n)
    begin
        state <= IDLE;
    end
    else
    begin
        state <= state_next;
    end
end

always_comb
begin
    case(state)
    IDLE:       state_next  = WAIT_TIMER;
    WAIT_TIMER: state_next  =   (timer == `TIME_TO_BLINK && dev_ready   )   ?   WRITE_O :   WAIT_TIMER;
    WRITE_O:    state_next  =   (dev_ready && ~dev_ready_prev           )   ?   READ_I  :   WRITE_O;
    READ_I:     state_next  =   (dev_ready && ~dev_ready_prev           )   ?   READ_O  :   READ_I;
    READ_O:     state_next  =   (dev_ready && ~dev_ready_prev           )   ?   IDLE    :   READ_O;

    default: ;
    endcase
end

always_ff @(posedge clk_50_pll, negedge rst_n)
begin
    if(~rst_n)
    begin
        timer <= 32'd0;
    end
    else
    begin
        if(state == WAIT_TIMER)
        begin
            if(timer > `TIME_TO_BLINK + 32'd1000)
            begin
                timer <= 32'd0;
            end
            else
            begin
                timer <= timer + 32'd1;
            end
        end
        else
        begin
            timer <= 32'd0;
        end
    end
end

always_ff @(posedge clk_50_pll, negedge rst_n)
begin
    if(~rst_n)
    begin
        sfp_gled <= 1'b1;
    end
    else
    begin
        sfp_gled <= (timer == `TIME_TO_BLINK/32'd2) ? ~sfp_gled : sfp_gled;
    end
end

always_ff @(posedge clk_50_pll, negedge rst_n)
begin
    if(~rst_n)
    begin
        need_write_reg_o <= 1'b0;
        need_read_reg_o  <= 1'b0;
        need_read_reg_i  <= 1'b0;
    end
    else
    begin
        if(state == WRITE_O)
        begin
            need_write_reg_o <= 1'b1;
            need_read_reg_o  <= 1'b0;
            need_read_reg_i  <= 1'b0;            
        end
        else if(state == READ_O)
        begin
            need_write_reg_o <= 1'b0;
            need_read_reg_o  <= 1'b1;
            need_read_reg_i  <= 1'b0;
        end   
        else if(state == READ_I)
        begin
            need_write_reg_o <= 1'b0;
            need_read_reg_o  <= 1'b0;
            need_read_reg_i  <= 1'b1;
        end      
        else
        begin
            need_write_reg_o <= 1'b0;
            need_read_reg_o  <= 1'b0;
            need_read_reg_i  <= 1'b0;
        end
    end
end

endmodule