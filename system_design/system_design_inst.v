	system_design u0 (
		.clock_50_clk                            (_connected_to_clock_50_clk_),                            //  output,   width = 1,                    clock_50.clk
		.mac_inited_mac_inited                   (_connected_to_mac_inited_mac_inited_),                   //  output,   width = 1,                  mac_inited.mac_inited
		.pll_refclk_clk                          (_connected_to_pll_refclk_clk_),                          //   input,   width = 1,                  pll_refclk.clk
		.reset_main_out_reset                    (_connected_to_reset_main_out_reset_),                    //  output,   width = 1,              reset_main_out.reset
		.reset_mod_clock_clk                     (_connected_to_reset_mod_clock_clk_),                     //   input,   width = 1,             reset_mod_clock.clk
		.reset_mod_reset_reset_n                 (_connected_to_reset_mod_reset_reset_n_),                 //   input,   width = 1,             reset_mod_reset.reset_n
		.reset_mod_reset_phy_reset               (_connected_to_reset_mod_reset_phy_reset_),               //  output,   width = 1,         reset_mod_reset_phy.reset
		.send_packet_1_control_start_ram_addr    (_connected_to_send_packet_1_control_start_ram_addr_),    //   input,  width = 25,       send_packet_1_control.start_ram_addr
		.send_packet_1_control_cmd_send          (_connected_to_send_packet_1_control_cmd_send_),          //   input,   width = 1,                            .cmd_send
		.send_packet_2_control_start_ram_addr    (_connected_to_send_packet_2_control_start_ram_addr_),    //   input,  width = 25,       send_packet_2_control.start_ram_addr
		.send_packet_2_control_cmd_send          (_connected_to_send_packet_2_control_cmd_send_),          //   input,   width = 1,                            .cmd_send
		.mac_misc_1_magic_wakeup                 (_connected_to_mac_misc_1_magic_wakeup_),                 //  output,   width = 1,                  mac_misc_1.magic_wakeup
		.mac_misc_1_magic_sleep_n                (_connected_to_mac_misc_1_magic_sleep_n_),                //   input,   width = 1,                            .magic_sleep_n
		.mac_misc_1_tx_crc_fwd                   (_connected_to_mac_misc_1_tx_crc_fwd_),                   //   input,   width = 1,                            .tx_crc_fwd
		.mac_mdio_mdc                            (_connected_to_mac_mdio_mdc_),                            //  output,   width = 1,                    mac_mdio.mdc
		.mac_mdio_mdio_in                        (_connected_to_mac_mdio_mdio_in_),                        //   input,   width = 1,                            .mdio_in
		.mac_mdio_mdio_out                       (_connected_to_mac_mdio_mdio_out_),                       //  output,   width = 1,                            .mdio_out
		.mac_mdio_mdio_oen                       (_connected_to_mac_mdio_mdio_oen_),                       //  output,   width = 1,                            .mdio_oen
		.mac_misc_2_magic_wakeup                 (_connected_to_mac_misc_2_magic_wakeup_),                 //  output,   width = 1,                  mac_misc_2.magic_wakeup
		.mac_misc_2_magic_sleep_n                (_connected_to_mac_misc_2_magic_sleep_n_),                //   input,   width = 1,                            .magic_sleep_n
		.mac_misc_2_tx_crc_fwd                   (_connected_to_mac_misc_2_tx_crc_fwd_),                   //   input,   width = 1,                            .tx_crc_fwd
		.tse_ref_clk                             (_connected_to_tse_ref_clk_),                             //   input,   width = 1,                     tse_ref.clk
		.status_led_connection_0_crs             (_connected_to_status_led_connection_0_crs_),             //  output,   width = 1,     status_led_connection_0.crs
		.status_led_connection_0_link            (_connected_to_status_led_connection_0_link_),            //  output,   width = 1,                            .link
		.status_led_connection_0_panel_link      (_connected_to_status_led_connection_0_panel_link_),      //  output,   width = 1,                            .panel_link
		.status_led_connection_0_col             (_connected_to_status_led_connection_0_col_),             //  output,   width = 1,                            .col
		.status_led_connection_0_an              (_connected_to_status_led_connection_0_an_),              //  output,   width = 1,                            .an
		.status_led_connection_0_char_err        (_connected_to_status_led_connection_0_char_err_),        //  output,   width = 1,                            .char_err
		.status_led_connection_0_disp_err        (_connected_to_status_led_connection_0_disp_err_),        //  output,   width = 1,                            .disp_err
		.tx_analogreset_0_tx_analogreset         (_connected_to_tx_analogreset_0_tx_analogreset_),         //   input,   width = 1,            tx_analogreset_0.tx_analogreset
		.tx_digitalreset_0_tx_digitalreset       (_connected_to_tx_digitalreset_0_tx_digitalreset_),       //   input,   width = 1,           tx_digitalreset_0.tx_digitalreset
		.rx_analogreset_0_rx_analogreset         (_connected_to_rx_analogreset_0_rx_analogreset_),         //   input,   width = 1,            rx_analogreset_0.rx_analogreset
		.rx_digitalreset_0_rx_digitalreset       (_connected_to_rx_digitalreset_0_rx_digitalreset_),       //   input,   width = 1,           rx_digitalreset_0.rx_digitalreset
		.tx_cal_busy_0_tx_cal_busy               (_connected_to_tx_cal_busy_0_tx_cal_busy_),               //  output,   width = 1,               tx_cal_busy_0.tx_cal_busy
		.rx_cal_busy_0_rx_cal_busy               (_connected_to_rx_cal_busy_0_rx_cal_busy_),               //  output,   width = 1,               rx_cal_busy_0.rx_cal_busy
		.tse_rx_cdr_refclk_0_clk                 (_connected_to_tse_rx_cdr_refclk_0_clk_),                 //   input,   width = 1,         tse_rx_cdr_refclk_0.clk
		.rx_set_locktodata_0_rx_set_locktodata   (_connected_to_rx_set_locktodata_0_rx_set_locktodata_),   //   input,   width = 1,         rx_set_locktodata_0.rx_set_locktodata
		.rx_set_locktoref_0_rx_set_locktoref     (_connected_to_rx_set_locktoref_0_rx_set_locktoref_),     //   input,   width = 1,          rx_set_locktoref_0.rx_set_locktoref
		.rx_is_lockedtoref_0_rx_is_lockedtoref   (_connected_to_rx_is_lockedtoref_0_rx_is_lockedtoref_),   //  output,   width = 1,         rx_is_lockedtoref_0.rx_is_lockedtoref
		.rx_is_lockedtodata_0_rx_is_lockedtodata (_connected_to_rx_is_lockedtodata_0_rx_is_lockedtodata_), //  output,   width = 1,        rx_is_lockedtodata_0.rx_is_lockedtodata
		.sgmii_1_rxp                             (_connected_to_sgmii_1_rxp_),                             //   input,   width = 1,                     sgmii_1.rxp
		.sgmii_1_txp                             (_connected_to_sgmii_1_txp_),                             //  output,   width = 1,                            .txp
		.serdes_control_connection_0_export      (_connected_to_serdes_control_connection_0_export_),      //  output,   width = 1, serdes_control_connection_0.export
		.status_led_connection_1_crs             (_connected_to_status_led_connection_1_crs_),             //  output,   width = 1,     status_led_connection_1.crs
		.status_led_connection_1_link            (_connected_to_status_led_connection_1_link_),            //  output,   width = 1,                            .link
		.status_led_connection_1_panel_link      (_connected_to_status_led_connection_1_panel_link_),      //  output,   width = 1,                            .panel_link
		.status_led_connection_1_col             (_connected_to_status_led_connection_1_col_),             //  output,   width = 1,                            .col
		.status_led_connection_1_an              (_connected_to_status_led_connection_1_an_),              //  output,   width = 1,                            .an
		.status_led_connection_1_char_err        (_connected_to_status_led_connection_1_char_err_),        //  output,   width = 1,                            .char_err
		.status_led_connection_1_disp_err        (_connected_to_status_led_connection_1_disp_err_),        //  output,   width = 1,                            .disp_err
		.tx_analogreset_1_tx_analogreset         (_connected_to_tx_analogreset_1_tx_analogreset_),         //   input,   width = 1,            tx_analogreset_1.tx_analogreset
		.tx_digitalreset_1_tx_digitalreset       (_connected_to_tx_digitalreset_1_tx_digitalreset_),       //   input,   width = 1,           tx_digitalreset_1.tx_digitalreset
		.rx_analogreset_1_rx_analogreset         (_connected_to_rx_analogreset_1_rx_analogreset_),         //   input,   width = 1,            rx_analogreset_1.rx_analogreset
		.rx_digitalreset_1_rx_digitalreset       (_connected_to_rx_digitalreset_1_rx_digitalreset_),       //   input,   width = 1,           rx_digitalreset_1.rx_digitalreset
		.tx_cal_busy_1_tx_cal_busy               (_connected_to_tx_cal_busy_1_tx_cal_busy_),               //  output,   width = 1,               tx_cal_busy_1.tx_cal_busy
		.rx_cal_busy_1_rx_cal_busy               (_connected_to_rx_cal_busy_1_rx_cal_busy_),               //  output,   width = 1,               rx_cal_busy_1.rx_cal_busy
		.tse_rx_cdr_refclk_1_clk                 (_connected_to_tse_rx_cdr_refclk_1_clk_),                 //   input,   width = 1,         tse_rx_cdr_refclk_1.clk
		.rx_set_locktodata_1_rx_set_locktodata   (_connected_to_rx_set_locktodata_1_rx_set_locktodata_),   //   input,   width = 1,         rx_set_locktodata_1.rx_set_locktodata
		.rx_set_locktoref_1_rx_set_locktoref     (_connected_to_rx_set_locktoref_1_rx_set_locktoref_),     //   input,   width = 1,          rx_set_locktoref_1.rx_set_locktoref
		.rx_is_lockedtoref_1_rx_is_lockedtoref   (_connected_to_rx_is_lockedtoref_1_rx_is_lockedtoref_),   //  output,   width = 1,         rx_is_lockedtoref_1.rx_is_lockedtoref
		.rx_is_lockedtodata_1_rx_is_lockedtodata (_connected_to_rx_is_lockedtodata_1_rx_is_lockedtodata_), //  output,   width = 1,        rx_is_lockedtodata_1.rx_is_lockedtodata
		.sgmii_2_rxp                             (_connected_to_sgmii_2_rxp_),                             //   input,   width = 1,                     sgmii_2.rxp
		.sgmii_2_txp                             (_connected_to_sgmii_2_txp_),                             //  output,   width = 1,                            .txp
		.serdes_control_connection_1_export      (_connected_to_serdes_control_connection_1_export_),      //  output,   width = 1, serdes_control_connection_1.export
		.tse_tx_serial_clk_2_clk                 (_connected_to_tse_tx_serial_clk_2_clk_),                 //   input,   width = 1,         tse_tx_serial_clk_2.clk
		.tse_rx_cdr_refclk_2_clk                 (_connected_to_tse_rx_cdr_refclk_2_clk_),                 //   input,   width = 1,         tse_rx_cdr_refclk_2.clk
		.sgmii_3_rxp                             (_connected_to_sgmii_3_rxp_),                             //   input,   width = 1,                     sgmii_3.rxp
		.sgmii_3_txp                             (_connected_to_sgmii_3_txp_),                             //  output,   width = 1,                            .txp
		.tse_tx_serial_clk_3_clk                 (_connected_to_tse_tx_serial_clk_3_clk_),                 //   input,   width = 1,         tse_tx_serial_clk_3.clk
		.tse_rx_cdr_refclk_3_clk                 (_connected_to_tse_rx_cdr_refclk_3_clk_),                 //   input,   width = 1,         tse_rx_cdr_refclk_3.clk
		.sgmii_4_rxp                             (_connected_to_sgmii_4_rxp_),                             //   input,   width = 1,                     sgmii_4.rxp
		.sgmii_4_txp                             (_connected_to_sgmii_4_txp_),                             //  output,   width = 1,                            .txp
		.xcvr_pll_powerdown_pll_powerdown        (_connected_to_xcvr_pll_powerdown_pll_powerdown_),        //   input,   width = 1,          xcvr_pll_powerdown.pll_powerdown
		.xcvr_pll_refclk_clk                     (_connected_to_xcvr_pll_refclk_clk_)                      //   input,   width = 1,             xcvr_pll_refclk.clk
	);

