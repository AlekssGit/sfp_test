	system_design u0 (
		.clock_50_clk                            (_connected_to_clock_50_clk_),                            //  output,   width = 1,                    clock_50.clk
		.ddr_avalon_clk                          (_connected_to_ddr_avalon_clk_),                          //  output,   width = 1,                  ddr_avalon.clk
		.ddr3_global_reset_n_reset_n             (_connected_to_ddr3_global_reset_n_reset_n_),             //   input,   width = 1,         ddr3_global_reset_n.reset_n
		.ddr3_clock_clk                          (_connected_to_ddr3_clock_clk_),                          //   input,   width = 1,                  ddr3_clock.clk
		.ddr3_oct_oct_rzqin                      (_connected_to_ddr3_oct_oct_rzqin_),                      //   input,   width = 1,                    ddr3_oct.oct_rzqin
		.ddr3_mem_mem_ck                         (_connected_to_ddr3_mem_mem_ck_),                         //  output,   width = 1,                    ddr3_mem.mem_ck
		.ddr3_mem_mem_ck_n                       (_connected_to_ddr3_mem_mem_ck_n_),                       //  output,   width = 1,                            .mem_ck_n
		.ddr3_mem_mem_a                          (_connected_to_ddr3_mem_mem_a_),                          //  output,  width = 15,                            .mem_a
		.ddr3_mem_mem_ba                         (_connected_to_ddr3_mem_mem_ba_),                         //  output,   width = 3,                            .mem_ba
		.ddr3_mem_mem_cke                        (_connected_to_ddr3_mem_mem_cke_),                        //  output,   width = 1,                            .mem_cke
		.ddr3_mem_mem_cs_n                       (_connected_to_ddr3_mem_mem_cs_n_),                       //  output,   width = 1,                            .mem_cs_n
		.ddr3_mem_mem_odt                        (_connected_to_ddr3_mem_mem_odt_),                        //  output,   width = 1,                            .mem_odt
		.ddr3_mem_mem_reset_n                    (_connected_to_ddr3_mem_mem_reset_n_),                    //  output,   width = 1,                            .mem_reset_n
		.ddr3_mem_mem_we_n                       (_connected_to_ddr3_mem_mem_we_n_),                       //  output,   width = 1,                            .mem_we_n
		.ddr3_mem_mem_ras_n                      (_connected_to_ddr3_mem_mem_ras_n_),                      //  output,   width = 1,                            .mem_ras_n
		.ddr3_mem_mem_cas_n                      (_connected_to_ddr3_mem_mem_cas_n_),                      //  output,   width = 1,                            .mem_cas_n
		.ddr3_mem_mem_dqs                        (_connected_to_ddr3_mem_mem_dqs_),                        //   inout,   width = 5,                            .mem_dqs
		.ddr3_mem_mem_dqs_n                      (_connected_to_ddr3_mem_mem_dqs_n_),                      //   inout,   width = 5,                            .mem_dqs_n
		.ddr3_mem_mem_dq                         (_connected_to_ddr3_mem_mem_dq_),                         //   inout,  width = 40,                            .mem_dq
		.ddr3_mem_mem_dm                         (_connected_to_ddr3_mem_mem_dm_),                         //  output,   width = 5,                            .mem_dm
		.ddr_avalon_reset_reset                  (_connected_to_ddr_avalon_reset_reset_),                  //  output,   width = 1,            ddr_avalon_reset.reset
		.mac_inited_mac_inited                   (_connected_to_mac_inited_mac_inited_),                   //  output,   width = 1,                  mac_inited.mac_inited
		.pcie_refclk_clk                         (_connected_to_pcie_refclk_clk_),                         //   input,   width = 1,                 pcie_refclk.clk
		.pcie_npor_npor                          (_connected_to_pcie_npor_npor_),                          //   input,   width = 1,                   pcie_npor.npor
		.pcie_npor_pin_perst                     (_connected_to_pcie_npor_pin_perst_),                     //   input,   width = 1,                            .pin_perst
		.pcie_hip_serial_rx_in0                  (_connected_to_pcie_hip_serial_rx_in0_),                  //   input,   width = 1,             pcie_hip_serial.rx_in0
		.pcie_hip_serial_rx_in1                  (_connected_to_pcie_hip_serial_rx_in1_),                  //   input,   width = 1,                            .rx_in1
		.pcie_hip_serial_rx_in2                  (_connected_to_pcie_hip_serial_rx_in2_),                  //   input,   width = 1,                            .rx_in2
		.pcie_hip_serial_rx_in3                  (_connected_to_pcie_hip_serial_rx_in3_),                  //   input,   width = 1,                            .rx_in3
		.pcie_hip_serial_tx_out0                 (_connected_to_pcie_hip_serial_tx_out0_),                 //  output,   width = 1,                            .tx_out0
		.pcie_hip_serial_tx_out1                 (_connected_to_pcie_hip_serial_tx_out1_),                 //  output,   width = 1,                            .tx_out1
		.pcie_hip_serial_tx_out2                 (_connected_to_pcie_hip_serial_tx_out2_),                 //  output,   width = 1,                            .tx_out2
		.pcie_hip_serial_tx_out3                 (_connected_to_pcie_hip_serial_tx_out3_),                 //  output,   width = 1,                            .tx_out3
		.pll_refclk_clk                          (_connected_to_pll_refclk_clk_),                          //   input,   width = 1,                  pll_refclk.clk
		.receive_packet_1_data_saved_data_saved  (_connected_to_receive_packet_1_data_saved_data_saved_),  //  output,   width = 1, receive_packet_1_data_saved.data_saved
		.receive_packet_2_data_saved_data_saved  (_connected_to_receive_packet_2_data_saved_data_saved_),  //  output,   width = 1, receive_packet_2_data_saved.data_saved
		.reset_main_out_reset                    (_connected_to_reset_main_out_reset_),                    //  output,   width = 1,              reset_main_out.reset
		.reset_mod_clock_clk                     (_connected_to_reset_mod_clock_clk_),                     //   input,   width = 1,             reset_mod_clock.clk
		.reset_mod_reset_reset_n                 (_connected_to_reset_mod_reset_reset_n_),                 //   input,   width = 1,             reset_mod_reset.reset_n
		.reset_mod_reset_phy_reset               (_connected_to_reset_mod_reset_phy_reset_),               //  output,   width = 1,         reset_mod_reset_phy.reset
		.pcie_send_control_start_ram_addr        (_connected_to_pcie_send_control_start_ram_addr_),        //  output,   width = 6,           pcie_send_control.start_ram_addr
		.pcie_send_control_signal                (_connected_to_pcie_send_control_signal_),                //  output,   width = 1,                            .signal
		.send_packet_1_control_start_ram_addr    (_connected_to_send_packet_1_control_start_ram_addr_),    //   input,  width = 25,       send_packet_1_control.start_ram_addr
		.send_packet_1_control_cmd_send          (_connected_to_send_packet_1_control_cmd_send_),          //   input,   width = 1,                            .cmd_send
		.send_packet_2_control_start_ram_addr    (_connected_to_send_packet_2_control_start_ram_addr_),    //   input,  width = 25,       send_packet_2_control.start_ram_addr
		.send_packet_2_control_cmd_send          (_connected_to_send_packet_2_control_cmd_send_),          //   input,   width = 1,                            .cmd_send
		.ddr_ready_ram_ready                     (_connected_to_ddr_ready_ram_ready_),                     //   input,   width = 1,                   ddr_ready.ram_ready
		.reset_board_reset                       (_connected_to_reset_board_reset_),                       //   input,   width = 1,                 reset_board.reset
		.mem_cal_success_cal_success             (_connected_to_mem_cal_success_cal_success_),             //  output,   width = 1,             mem_cal_success.cal_success
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

