module system_design (
		output wire        clock_50_clk,                            //                    clock_50.clk
		output wire        ddr_avalon_clk,                          //                  ddr_avalon.clk
		input  wire        ddr3_global_reset_n_reset_n,             //         ddr3_global_reset_n.reset_n
		input  wire        ddr3_clock_clk,                          //                  ddr3_clock.clk
		input  wire        ddr3_oct_oct_rzqin,                      //                    ddr3_oct.oct_rzqin
		output wire [0:0]  ddr3_mem_mem_ck,                         //                    ddr3_mem.mem_ck
		output wire [0:0]  ddr3_mem_mem_ck_n,                       //                            .mem_ck_n
		output wire [14:0] ddr3_mem_mem_a,                          //                            .mem_a
		output wire [2:0]  ddr3_mem_mem_ba,                         //                            .mem_ba
		output wire [0:0]  ddr3_mem_mem_cke,                        //                            .mem_cke
		output wire [0:0]  ddr3_mem_mem_cs_n,                       //                            .mem_cs_n
		output wire [0:0]  ddr3_mem_mem_odt,                        //                            .mem_odt
		output wire [0:0]  ddr3_mem_mem_reset_n,                    //                            .mem_reset_n
		output wire [0:0]  ddr3_mem_mem_we_n,                       //                            .mem_we_n
		output wire [0:0]  ddr3_mem_mem_ras_n,                      //                            .mem_ras_n
		output wire [0:0]  ddr3_mem_mem_cas_n,                      //                            .mem_cas_n
		inout  wire [4:0]  ddr3_mem_mem_dqs,                        //                            .mem_dqs
		inout  wire [4:0]  ddr3_mem_mem_dqs_n,                      //                            .mem_dqs_n
		inout  wire [39:0] ddr3_mem_mem_dq,                         //                            .mem_dq
		output wire [4:0]  ddr3_mem_mem_dm,                         //                            .mem_dm
		output wire        ddr_avalon_reset_reset,                  //            ddr_avalon_reset.reset
		output wire        mac_inited_mac_inited,                   //                  mac_inited.mac_inited
		input  wire        pcie_refclk_clk,                         //                 pcie_refclk.clk
		input  wire        pcie_npor_npor,                          //                   pcie_npor.npor
		input  wire        pcie_npor_pin_perst,                     //                            .pin_perst
		input  wire        pcie_hip_serial_rx_in0,                  //             pcie_hip_serial.rx_in0
		input  wire        pcie_hip_serial_rx_in1,                  //                            .rx_in1
		input  wire        pcie_hip_serial_rx_in2,                  //                            .rx_in2
		input  wire        pcie_hip_serial_rx_in3,                  //                            .rx_in3
		output wire        pcie_hip_serial_tx_out0,                 //                            .tx_out0
		output wire        pcie_hip_serial_tx_out1,                 //                            .tx_out1
		output wire        pcie_hip_serial_tx_out2,                 //                            .tx_out2
		output wire        pcie_hip_serial_tx_out3,                 //                            .tx_out3
		input  wire        pll_refclk_clk,                          //                  pll_refclk.clk
		output wire        receive_packet_1_data_saved_data_saved,  // receive_packet_1_data_saved.data_saved
		output wire        receive_packet_2_data_saved_data_saved,  // receive_packet_2_data_saved.data_saved
		output wire        reset_main_out_reset,                    //              reset_main_out.reset
		input  wire        reset_mod_clock_clk,                     //             reset_mod_clock.clk
		input  wire        reset_mod_reset_reset_n,                 //             reset_mod_reset.reset_n
		output wire        reset_mod_reset_phy_reset,               //         reset_mod_reset_phy.reset
		output wire [5:0]  pcie_send_control_start_ram_addr,        //           pcie_send_control.start_ram_addr
		output wire        pcie_send_control_signal,                //                            .signal
		input  wire [24:0] send_packet_1_control_start_ram_addr,    //       send_packet_1_control.start_ram_addr
		input  wire        send_packet_1_control_cmd_send,          //                            .cmd_send
		input  wire [24:0] send_packet_2_control_start_ram_addr,    //       send_packet_2_control.start_ram_addr
		input  wire        send_packet_2_control_cmd_send,          //                            .cmd_send
		input  wire        ddr_ready_ram_ready,                     //                   ddr_ready.ram_ready
		input  wire        reset_board_reset,                       //                 reset_board.reset
		output wire        mem_cal_success_cal_success,             //             mem_cal_success.cal_success
		output wire        mac_misc_1_magic_wakeup,                 //                  mac_misc_1.magic_wakeup
		input  wire        mac_misc_1_magic_sleep_n,                //                            .magic_sleep_n
		input  wire        mac_misc_1_tx_crc_fwd,                   //                            .tx_crc_fwd
		output wire        mac_mdio_mdc,                            //                    mac_mdio.mdc
		input  wire        mac_mdio_mdio_in,                        //                            .mdio_in
		output wire        mac_mdio_mdio_out,                       //                            .mdio_out
		output wire        mac_mdio_mdio_oen,                       //                            .mdio_oen
		output wire        mac_misc_2_magic_wakeup,                 //                  mac_misc_2.magic_wakeup
		input  wire        mac_misc_2_magic_sleep_n,                //                            .magic_sleep_n
		input  wire        mac_misc_2_tx_crc_fwd,                   //                            .tx_crc_fwd
		input  wire        tse_ref_clk,                             //                     tse_ref.clk
		output wire        status_led_connection_0_crs,             //     status_led_connection_0.crs
		output wire        status_led_connection_0_link,            //                            .link
		output wire        status_led_connection_0_panel_link,      //                            .panel_link
		output wire        status_led_connection_0_col,             //                            .col
		output wire        status_led_connection_0_an,              //                            .an
		output wire        status_led_connection_0_char_err,        //                            .char_err
		output wire        status_led_connection_0_disp_err,        //                            .disp_err
		input  wire [0:0]  tx_analogreset_0_tx_analogreset,         //            tx_analogreset_0.tx_analogreset
		input  wire [0:0]  tx_digitalreset_0_tx_digitalreset,       //           tx_digitalreset_0.tx_digitalreset
		input  wire [0:0]  rx_analogreset_0_rx_analogreset,         //            rx_analogreset_0.rx_analogreset
		input  wire [0:0]  rx_digitalreset_0_rx_digitalreset,       //           rx_digitalreset_0.rx_digitalreset
		output wire [0:0]  tx_cal_busy_0_tx_cal_busy,               //               tx_cal_busy_0.tx_cal_busy
		output wire [0:0]  rx_cal_busy_0_rx_cal_busy,               //               rx_cal_busy_0.rx_cal_busy
		input  wire        tse_rx_cdr_refclk_0_clk,                 //         tse_rx_cdr_refclk_0.clk
		input  wire [0:0]  rx_set_locktodata_0_rx_set_locktodata,   //         rx_set_locktodata_0.rx_set_locktodata
		input  wire [0:0]  rx_set_locktoref_0_rx_set_locktoref,     //          rx_set_locktoref_0.rx_set_locktoref
		output wire [0:0]  rx_is_lockedtoref_0_rx_is_lockedtoref,   //         rx_is_lockedtoref_0.rx_is_lockedtoref
		output wire [0:0]  rx_is_lockedtodata_0_rx_is_lockedtodata, //        rx_is_lockedtodata_0.rx_is_lockedtodata
		input  wire        sgmii_1_rxp,                             //                     sgmii_1.rxp
		output wire        sgmii_1_txp,                             //                            .txp
		output wire        serdes_control_connection_0_export,      // serdes_control_connection_0.export
		output wire        status_led_connection_1_crs,             //     status_led_connection_1.crs
		output wire        status_led_connection_1_link,            //                            .link
		output wire        status_led_connection_1_panel_link,      //                            .panel_link
		output wire        status_led_connection_1_col,             //                            .col
		output wire        status_led_connection_1_an,              //                            .an
		output wire        status_led_connection_1_char_err,        //                            .char_err
		output wire        status_led_connection_1_disp_err,        //                            .disp_err
		input  wire [0:0]  tx_analogreset_1_tx_analogreset,         //            tx_analogreset_1.tx_analogreset
		input  wire [0:0]  tx_digitalreset_1_tx_digitalreset,       //           tx_digitalreset_1.tx_digitalreset
		input  wire [0:0]  rx_analogreset_1_rx_analogreset,         //            rx_analogreset_1.rx_analogreset
		input  wire [0:0]  rx_digitalreset_1_rx_digitalreset,       //           rx_digitalreset_1.rx_digitalreset
		output wire [0:0]  tx_cal_busy_1_tx_cal_busy,               //               tx_cal_busy_1.tx_cal_busy
		output wire [0:0]  rx_cal_busy_1_rx_cal_busy,               //               rx_cal_busy_1.rx_cal_busy
		input  wire        tse_rx_cdr_refclk_1_clk,                 //         tse_rx_cdr_refclk_1.clk
		input  wire [0:0]  rx_set_locktodata_1_rx_set_locktodata,   //         rx_set_locktodata_1.rx_set_locktodata
		input  wire [0:0]  rx_set_locktoref_1_rx_set_locktoref,     //          rx_set_locktoref_1.rx_set_locktoref
		output wire [0:0]  rx_is_lockedtoref_1_rx_is_lockedtoref,   //         rx_is_lockedtoref_1.rx_is_lockedtoref
		output wire [0:0]  rx_is_lockedtodata_1_rx_is_lockedtodata, //        rx_is_lockedtodata_1.rx_is_lockedtodata
		input  wire        sgmii_2_rxp,                             //                     sgmii_2.rxp
		output wire        sgmii_2_txp,                             //                            .txp
		output wire        serdes_control_connection_1_export,      // serdes_control_connection_1.export
		input  wire [0:0]  tse_tx_serial_clk_2_clk,                 //         tse_tx_serial_clk_2.clk
		input  wire        tse_rx_cdr_refclk_2_clk,                 //         tse_rx_cdr_refclk_2.clk
		input  wire        sgmii_3_rxp,                             //                     sgmii_3.rxp
		output wire        sgmii_3_txp,                             //                            .txp
		input  wire [0:0]  tse_tx_serial_clk_3_clk,                 //         tse_tx_serial_clk_3.clk
		input  wire        tse_rx_cdr_refclk_3_clk,                 //         tse_rx_cdr_refclk_3.clk
		input  wire        sgmii_4_rxp,                             //                     sgmii_4.rxp
		output wire        sgmii_4_txp,                             //                            .txp
		input  wire        xcvr_pll_powerdown_pll_powerdown,        //          xcvr_pll_powerdown.pll_powerdown
		input  wire        xcvr_pll_refclk_clk                      //             xcvr_pll_refclk.clk
	);
endmodule

