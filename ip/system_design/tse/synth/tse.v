// tse.v

// Generated using ACDS version 21.4 67

`timescale 1 ps / 1 ps
module tse (
		input  wire        clk,                  //        control_port_clock_connection.clk
		input  wire        reset,                //                     reset_connection.reset
		output wire [31:0] reg_data_out,         //                         control_port.readdata
		input  wire        reg_rd,               //                                     .read
		input  wire [31:0] reg_data_in,          //                                     .writedata
		input  wire        reg_wr,               //                                     .write
		output wire        reg_busy,             //                                     .waitrequest
		input  wire [9:0]  reg_addr,             //                                     .address
		input  wire        rx_afull_clk,         // receive_fifo_status_clock_connection.clk
		input  wire [1:0]  rx_afull_data,        //                  receive_fifo_status.data
		input  wire        rx_afull_valid,       //                                     .valid
		input  wire [1:0]  rx_afull_channel,     //                                     .channel
		output wire        mac_rx_clk_0,         //            mac_rx_clock_connection_0.clk
		output wire        mac_tx_clk_0,         //            mac_tx_clock_connection_0.clk
		output wire [7:0]  data_rx_data_0,       //                            receive_0.data
		output wire        data_rx_eop_0,        //                                     .endofpacket
		output wire [4:0]  data_rx_error_0,      //                                     .error
		input  wire        data_rx_ready_0,      //                                     .ready
		output wire        data_rx_sop_0,        //                                     .startofpacket
		output wire        data_rx_valid_0,      //                                     .valid
		input  wire [7:0]  data_tx_data_0,       //                           transmit_0.data
		input  wire        data_tx_eop_0,        //                                     .endofpacket
		input  wire        data_tx_error_0,      //                                     .error
		output wire        data_tx_ready_0,      //                                     .ready
		input  wire        data_tx_sop_0,        //                                     .startofpacket
		input  wire        data_tx_valid_0,      //                                     .valid
		output wire [4:0]  pkt_class_data_0,     //                receive_packet_type_0.data
		output wire        pkt_class_valid_0,    //                                     .valid
		output wire        magic_wakeup_0,       //                mac_misc_connection_0.magic_wakeup
		input  wire        magic_sleep_n_0,      //                                     .magic_sleep_n
		input  wire        tx_crc_fwd_0,         //                                     .tx_crc_fwd
		output wire        mdc,                  //                  mac_mdio_connection.mdc
		input  wire        mdio_in,              //                                     .mdio_in
		output wire        mdio_out,             //                                     .mdio_out
		output wire        mdio_oen,             //                                     .mdio_oen
		output wire        mac_rx_clk_1,         //            mac_rx_clock_connection_1.clk
		output wire        mac_tx_clk_1,         //            mac_tx_clock_connection_1.clk
		output wire [7:0]  data_rx_data_1,       //                            receive_1.data
		output wire        data_rx_eop_1,        //                                     .endofpacket
		output wire [4:0]  data_rx_error_1,      //                                     .error
		input  wire        data_rx_ready_1,      //                                     .ready
		output wire        data_rx_sop_1,        //                                     .startofpacket
		output wire        data_rx_valid_1,      //                                     .valid
		input  wire [7:0]  data_tx_data_1,       //                           transmit_1.data
		input  wire        data_tx_eop_1,        //                                     .endofpacket
		input  wire        data_tx_error_1,      //                                     .error
		output wire        data_tx_ready_1,      //                                     .ready
		input  wire        data_tx_sop_1,        //                                     .startofpacket
		input  wire        data_tx_valid_1,      //                                     .valid
		output wire [4:0]  pkt_class_data_1,     //                receive_packet_type_1.data
		output wire        pkt_class_valid_1,    //                                     .valid
		output wire        magic_wakeup_1,       //                mac_misc_connection_1.magic_wakeup
		input  wire        magic_sleep_n_1,      //                                     .magic_sleep_n
		input  wire        tx_crc_fwd_1,         //                                     .tx_crc_fwd
		output wire        mac_rx_clk_2,         //            mac_rx_clock_connection_2.clk
		output wire        mac_tx_clk_2,         //            mac_tx_clock_connection_2.clk
		output wire [7:0]  data_rx_data_2,       //                            receive_2.data
		output wire        data_rx_eop_2,        //                                     .endofpacket
		output wire [4:0]  data_rx_error_2,      //                                     .error
		input  wire        data_rx_ready_2,      //                                     .ready
		output wire        data_rx_sop_2,        //                                     .startofpacket
		output wire        data_rx_valid_2,      //                                     .valid
		input  wire [7:0]  data_tx_data_2,       //                           transmit_2.data
		input  wire        data_tx_eop_2,        //                                     .endofpacket
		input  wire        data_tx_error_2,      //                                     .error
		output wire        data_tx_ready_2,      //                                     .ready
		input  wire        data_tx_sop_2,        //                                     .startofpacket
		input  wire        data_tx_valid_2,      //                                     .valid
		output wire [4:0]  pkt_class_data_2,     //                receive_packet_type_2.data
		output wire        pkt_class_valid_2,    //                                     .valid
		output wire        magic_wakeup_2,       //                mac_misc_connection_2.magic_wakeup
		input  wire        magic_sleep_n_2,      //                                     .magic_sleep_n
		input  wire        tx_crc_fwd_2,         //                                     .tx_crc_fwd
		output wire        mac_rx_clk_3,         //            mac_rx_clock_connection_3.clk
		output wire        mac_tx_clk_3,         //            mac_tx_clock_connection_3.clk
		output wire [7:0]  data_rx_data_3,       //                            receive_3.data
		output wire        data_rx_eop_3,        //                                     .endofpacket
		output wire [4:0]  data_rx_error_3,      //                                     .error
		input  wire        data_rx_ready_3,      //                                     .ready
		output wire        data_rx_sop_3,        //                                     .startofpacket
		output wire        data_rx_valid_3,      //                                     .valid
		input  wire [7:0]  data_tx_data_3,       //                           transmit_3.data
		input  wire        data_tx_eop_3,        //                                     .endofpacket
		input  wire        data_tx_error_3,      //                                     .error
		output wire        data_tx_ready_3,      //                                     .ready
		input  wire        data_tx_sop_3,        //                                     .startofpacket
		input  wire        data_tx_valid_3,      //                                     .valid
		output wire [4:0]  pkt_class_data_3,     //                receive_packet_type_3.data
		output wire        pkt_class_valid_3,    //                                     .valid
		output wire        magic_wakeup_3,       //                mac_misc_connection_3.magic_wakeup
		input  wire        magic_sleep_n_3,      //                                     .magic_sleep_n
		input  wire        tx_crc_fwd_3,         //                                     .tx_crc_fwd
		input  wire        ref_clk,              //         pcs_ref_clk_clock_connection.clk
		output wire        led_crs_0,            //              status_led_connection_0.crs
		output wire        led_link_0,           //                                     .link
		output wire        led_panel_link_0,     //                                     .panel_link
		output wire        led_col_0,            //                                     .col
		output wire        led_an_0,             //                                     .an
		output wire        led_char_err_0,       //                                     .char_err
		output wire        led_disp_err_0,       //                                     .disp_err
		input  wire [0:0]  tx_analogreset_0,     //                     tx_analogreset_0.tx_analogreset
		input  wire [0:0]  tx_digitalreset_0,    //                    tx_digitalreset_0.tx_digitalreset
		input  wire [0:0]  rx_analogreset_0,     //                     rx_analogreset_0.rx_analogreset
		input  wire [0:0]  rx_digitalreset_0,    //                    rx_digitalreset_0.rx_digitalreset
		output wire [0:0]  tx_cal_busy_0,        //                        tx_cal_busy_0.tx_cal_busy
		output wire [0:0]  rx_cal_busy_0,        //                        rx_cal_busy_0.rx_cal_busy
		input  wire [0:0]  tx_serial_clk_0,      //                      tx_serial_clk_0.clk
		input  wire        rx_cdr_refclk_0,      //                      rx_cdr_refclk_0.clk
		input  wire [0:0]  rx_set_locktodata_0,  //                  rx_set_locktodata_0.rx_set_locktodata
		input  wire [0:0]  rx_set_locktoref_0,   //                   rx_set_locktoref_0.rx_set_locktoref
		output wire [0:0]  rx_is_lockedtoref_0,  //                  rx_is_lockedtoref_0.rx_is_lockedtoref
		output wire [0:0]  rx_is_lockedtodata_0, //                 rx_is_lockedtodata_0.rx_is_lockedtodata
		input  wire        rxp_0,                //                  serial_connection_0.rxp
		output wire        txp_0,                //                                     .txp
		output wire        rx_recovclkout_0,     //          serdes_control_connection_0.export
		output wire        led_crs_1,            //              status_led_connection_1.crs
		output wire        led_link_1,           //                                     .link
		output wire        led_panel_link_1,     //                                     .panel_link
		output wire        led_col_1,            //                                     .col
		output wire        led_an_1,             //                                     .an
		output wire        led_char_err_1,       //                                     .char_err
		output wire        led_disp_err_1,       //                                     .disp_err
		input  wire [0:0]  tx_analogreset_1,     //                     tx_analogreset_1.tx_analogreset
		input  wire [0:0]  tx_digitalreset_1,    //                    tx_digitalreset_1.tx_digitalreset
		input  wire [0:0]  rx_analogreset_1,     //                     rx_analogreset_1.rx_analogreset
		input  wire [0:0]  rx_digitalreset_1,    //                    rx_digitalreset_1.rx_digitalreset
		output wire [0:0]  tx_cal_busy_1,        //                        tx_cal_busy_1.tx_cal_busy
		output wire [0:0]  rx_cal_busy_1,        //                        rx_cal_busy_1.rx_cal_busy
		input  wire [0:0]  tx_serial_clk_1,      //                      tx_serial_clk_1.clk
		input  wire        rx_cdr_refclk_1,      //                      rx_cdr_refclk_1.clk
		input  wire [0:0]  rx_set_locktodata_1,  //                  rx_set_locktodata_1.rx_set_locktodata
		input  wire [0:0]  rx_set_locktoref_1,   //                   rx_set_locktoref_1.rx_set_locktoref
		output wire [0:0]  rx_is_lockedtoref_1,  //                  rx_is_lockedtoref_1.rx_is_lockedtoref
		output wire [0:0]  rx_is_lockedtodata_1, //                 rx_is_lockedtodata_1.rx_is_lockedtodata
		input  wire        rxp_1,                //                  serial_connection_1.rxp
		output wire        txp_1,                //                                     .txp
		output wire        rx_recovclkout_1,     //          serdes_control_connection_1.export
		output wire        led_crs_2,            //              status_led_connection_2.crs
		output wire        led_link_2,           //                                     .link
		output wire        led_panel_link_2,     //                                     .panel_link
		output wire        led_col_2,            //                                     .col
		output wire        led_an_2,             //                                     .an
		output wire        led_char_err_2,       //                                     .char_err
		output wire        led_disp_err_2,       //                                     .disp_err
		input  wire [0:0]  tx_analogreset_2,     //                     tx_analogreset_2.tx_analogreset
		input  wire [0:0]  tx_digitalreset_2,    //                    tx_digitalreset_2.tx_digitalreset
		input  wire [0:0]  rx_analogreset_2,     //                     rx_analogreset_2.rx_analogreset
		input  wire [0:0]  rx_digitalreset_2,    //                    rx_digitalreset_2.rx_digitalreset
		output wire [0:0]  tx_cal_busy_2,        //                        tx_cal_busy_2.tx_cal_busy
		output wire [0:0]  rx_cal_busy_2,        //                        rx_cal_busy_2.rx_cal_busy
		input  wire [0:0]  tx_serial_clk_2,      //                      tx_serial_clk_2.clk
		input  wire        rx_cdr_refclk_2,      //                      rx_cdr_refclk_2.clk
		input  wire [0:0]  rx_set_locktodata_2,  //                  rx_set_locktodata_2.rx_set_locktodata
		input  wire [0:0]  rx_set_locktoref_2,   //                   rx_set_locktoref_2.rx_set_locktoref
		output wire [0:0]  rx_is_lockedtoref_2,  //                  rx_is_lockedtoref_2.rx_is_lockedtoref
		output wire [0:0]  rx_is_lockedtodata_2, //                 rx_is_lockedtodata_2.rx_is_lockedtodata
		input  wire        rxp_2,                //                  serial_connection_2.rxp
		output wire        txp_2,                //                                     .txp
		output wire        rx_recovclkout_2,     //          serdes_control_connection_2.export
		output wire        led_crs_3,            //              status_led_connection_3.crs
		output wire        led_link_3,           //                                     .link
		output wire        led_panel_link_3,     //                                     .panel_link
		output wire        led_col_3,            //                                     .col
		output wire        led_an_3,             //                                     .an
		output wire        led_char_err_3,       //                                     .char_err
		output wire        led_disp_err_3,       //                                     .disp_err
		input  wire [0:0]  tx_analogreset_3,     //                     tx_analogreset_3.tx_analogreset
		input  wire [0:0]  tx_digitalreset_3,    //                    tx_digitalreset_3.tx_digitalreset
		input  wire [0:0]  rx_analogreset_3,     //                     rx_analogreset_3.rx_analogreset
		input  wire [0:0]  rx_digitalreset_3,    //                    rx_digitalreset_3.rx_digitalreset
		output wire [0:0]  tx_cal_busy_3,        //                        tx_cal_busy_3.tx_cal_busy
		output wire [0:0]  rx_cal_busy_3,        //                        rx_cal_busy_3.rx_cal_busy
		input  wire [0:0]  tx_serial_clk_3,      //                      tx_serial_clk_3.clk
		input  wire        rx_cdr_refclk_3,      //                      rx_cdr_refclk_3.clk
		input  wire [0:0]  rx_set_locktodata_3,  //                  rx_set_locktodata_3.rx_set_locktodata
		input  wire [0:0]  rx_set_locktoref_3,   //                   rx_set_locktoref_3.rx_set_locktoref
		output wire [0:0]  rx_is_lockedtoref_3,  //                  rx_is_lockedtoref_3.rx_is_lockedtoref
		output wire [0:0]  rx_is_lockedtodata_3, //                 rx_is_lockedtodata_3.rx_is_lockedtodata
		input  wire        rxp_3,                //                  serial_connection_3.rxp
		output wire        txp_3,                //                                     .txp
		output wire        rx_recovclkout_3      //          serdes_control_connection_3.export
	);

	tse_altera_eth_tse_1950_ag3tuna tse (
		.clk                  (clk),                  //   input,   width = 1,        control_port_clock_connection.clk
		.reset                (reset),                //   input,   width = 1,                     reset_connection.reset
		.reg_data_out         (reg_data_out),         //  output,  width = 32,                         control_port.readdata
		.reg_rd               (reg_rd),               //   input,   width = 1,                                     .read
		.reg_data_in          (reg_data_in),          //   input,  width = 32,                                     .writedata
		.reg_wr               (reg_wr),               //   input,   width = 1,                                     .write
		.reg_busy             (reg_busy),             //  output,   width = 1,                                     .waitrequest
		.reg_addr             (reg_addr),             //   input,  width = 10,                                     .address
		.rx_afull_clk         (rx_afull_clk),         //   input,   width = 1, receive_fifo_status_clock_connection.clk
		.rx_afull_data        (rx_afull_data),        //   input,   width = 2,                  receive_fifo_status.data
		.rx_afull_valid       (rx_afull_valid),       //   input,   width = 1,                                     .valid
		.rx_afull_channel     (rx_afull_channel),     //   input,   width = 2,                                     .channel
		.mac_rx_clk_0         (mac_rx_clk_0),         //  output,   width = 1,            mac_rx_clock_connection_0.clk
		.mac_tx_clk_0         (mac_tx_clk_0),         //  output,   width = 1,            mac_tx_clock_connection_0.clk
		.data_rx_data_0       (data_rx_data_0),       //  output,   width = 8,                            receive_0.data
		.data_rx_eop_0        (data_rx_eop_0),        //  output,   width = 1,                                     .endofpacket
		.data_rx_error_0      (data_rx_error_0),      //  output,   width = 5,                                     .error
		.data_rx_ready_0      (data_rx_ready_0),      //   input,   width = 1,                                     .ready
		.data_rx_sop_0        (data_rx_sop_0),        //  output,   width = 1,                                     .startofpacket
		.data_rx_valid_0      (data_rx_valid_0),      //  output,   width = 1,                                     .valid
		.data_tx_data_0       (data_tx_data_0),       //   input,   width = 8,                           transmit_0.data
		.data_tx_eop_0        (data_tx_eop_0),        //   input,   width = 1,                                     .endofpacket
		.data_tx_error_0      (data_tx_error_0),      //   input,   width = 1,                                     .error
		.data_tx_ready_0      (data_tx_ready_0),      //  output,   width = 1,                                     .ready
		.data_tx_sop_0        (data_tx_sop_0),        //   input,   width = 1,                                     .startofpacket
		.data_tx_valid_0      (data_tx_valid_0),      //   input,   width = 1,                                     .valid
		.pkt_class_data_0     (pkt_class_data_0),     //  output,   width = 5,                receive_packet_type_0.data
		.pkt_class_valid_0    (pkt_class_valid_0),    //  output,   width = 1,                                     .valid
		.magic_wakeup_0       (magic_wakeup_0),       //  output,   width = 1,                mac_misc_connection_0.magic_wakeup
		.magic_sleep_n_0      (magic_sleep_n_0),      //   input,   width = 1,                                     .magic_sleep_n
		.tx_crc_fwd_0         (tx_crc_fwd_0),         //   input,   width = 1,                                     .tx_crc_fwd
		.mdc                  (mdc),                  //  output,   width = 1,                  mac_mdio_connection.mdc
		.mdio_in              (mdio_in),              //   input,   width = 1,                                     .mdio_in
		.mdio_out             (mdio_out),             //  output,   width = 1,                                     .mdio_out
		.mdio_oen             (mdio_oen),             //  output,   width = 1,                                     .mdio_oen
		.mac_rx_clk_1         (mac_rx_clk_1),         //  output,   width = 1,            mac_rx_clock_connection_1.clk
		.mac_tx_clk_1         (mac_tx_clk_1),         //  output,   width = 1,            mac_tx_clock_connection_1.clk
		.data_rx_data_1       (data_rx_data_1),       //  output,   width = 8,                            receive_1.data
		.data_rx_eop_1        (data_rx_eop_1),        //  output,   width = 1,                                     .endofpacket
		.data_rx_error_1      (data_rx_error_1),      //  output,   width = 5,                                     .error
		.data_rx_ready_1      (data_rx_ready_1),      //   input,   width = 1,                                     .ready
		.data_rx_sop_1        (data_rx_sop_1),        //  output,   width = 1,                                     .startofpacket
		.data_rx_valid_1      (data_rx_valid_1),      //  output,   width = 1,                                     .valid
		.data_tx_data_1       (data_tx_data_1),       //   input,   width = 8,                           transmit_1.data
		.data_tx_eop_1        (data_tx_eop_1),        //   input,   width = 1,                                     .endofpacket
		.data_tx_error_1      (data_tx_error_1),      //   input,   width = 1,                                     .error
		.data_tx_ready_1      (data_tx_ready_1),      //  output,   width = 1,                                     .ready
		.data_tx_sop_1        (data_tx_sop_1),        //   input,   width = 1,                                     .startofpacket
		.data_tx_valid_1      (data_tx_valid_1),      //   input,   width = 1,                                     .valid
		.pkt_class_data_1     (pkt_class_data_1),     //  output,   width = 5,                receive_packet_type_1.data
		.pkt_class_valid_1    (pkt_class_valid_1),    //  output,   width = 1,                                     .valid
		.magic_wakeup_1       (magic_wakeup_1),       //  output,   width = 1,                mac_misc_connection_1.magic_wakeup
		.magic_sleep_n_1      (magic_sleep_n_1),      //   input,   width = 1,                                     .magic_sleep_n
		.tx_crc_fwd_1         (tx_crc_fwd_1),         //   input,   width = 1,                                     .tx_crc_fwd
		.mac_rx_clk_2         (mac_rx_clk_2),         //  output,   width = 1,            mac_rx_clock_connection_2.clk
		.mac_tx_clk_2         (mac_tx_clk_2),         //  output,   width = 1,            mac_tx_clock_connection_2.clk
		.data_rx_data_2       (data_rx_data_2),       //  output,   width = 8,                            receive_2.data
		.data_rx_eop_2        (data_rx_eop_2),        //  output,   width = 1,                                     .endofpacket
		.data_rx_error_2      (data_rx_error_2),      //  output,   width = 5,                                     .error
		.data_rx_ready_2      (data_rx_ready_2),      //   input,   width = 1,                                     .ready
		.data_rx_sop_2        (data_rx_sop_2),        //  output,   width = 1,                                     .startofpacket
		.data_rx_valid_2      (data_rx_valid_2),      //  output,   width = 1,                                     .valid
		.data_tx_data_2       (data_tx_data_2),       //   input,   width = 8,                           transmit_2.data
		.data_tx_eop_2        (data_tx_eop_2),        //   input,   width = 1,                                     .endofpacket
		.data_tx_error_2      (data_tx_error_2),      //   input,   width = 1,                                     .error
		.data_tx_ready_2      (data_tx_ready_2),      //  output,   width = 1,                                     .ready
		.data_tx_sop_2        (data_tx_sop_2),        //   input,   width = 1,                                     .startofpacket
		.data_tx_valid_2      (data_tx_valid_2),      //   input,   width = 1,                                     .valid
		.pkt_class_data_2     (pkt_class_data_2),     //  output,   width = 5,                receive_packet_type_2.data
		.pkt_class_valid_2    (pkt_class_valid_2),    //  output,   width = 1,                                     .valid
		.magic_wakeup_2       (magic_wakeup_2),       //  output,   width = 1,                mac_misc_connection_2.magic_wakeup
		.magic_sleep_n_2      (magic_sleep_n_2),      //   input,   width = 1,                                     .magic_sleep_n
		.tx_crc_fwd_2         (tx_crc_fwd_2),         //   input,   width = 1,                                     .tx_crc_fwd
		.mac_rx_clk_3         (mac_rx_clk_3),         //  output,   width = 1,            mac_rx_clock_connection_3.clk
		.mac_tx_clk_3         (mac_tx_clk_3),         //  output,   width = 1,            mac_tx_clock_connection_3.clk
		.data_rx_data_3       (data_rx_data_3),       //  output,   width = 8,                            receive_3.data
		.data_rx_eop_3        (data_rx_eop_3),        //  output,   width = 1,                                     .endofpacket
		.data_rx_error_3      (data_rx_error_3),      //  output,   width = 5,                                     .error
		.data_rx_ready_3      (data_rx_ready_3),      //   input,   width = 1,                                     .ready
		.data_rx_sop_3        (data_rx_sop_3),        //  output,   width = 1,                                     .startofpacket
		.data_rx_valid_3      (data_rx_valid_3),      //  output,   width = 1,                                     .valid
		.data_tx_data_3       (data_tx_data_3),       //   input,   width = 8,                           transmit_3.data
		.data_tx_eop_3        (data_tx_eop_3),        //   input,   width = 1,                                     .endofpacket
		.data_tx_error_3      (data_tx_error_3),      //   input,   width = 1,                                     .error
		.data_tx_ready_3      (data_tx_ready_3),      //  output,   width = 1,                                     .ready
		.data_tx_sop_3        (data_tx_sop_3),        //   input,   width = 1,                                     .startofpacket
		.data_tx_valid_3      (data_tx_valid_3),      //   input,   width = 1,                                     .valid
		.pkt_class_data_3     (pkt_class_data_3),     //  output,   width = 5,                receive_packet_type_3.data
		.pkt_class_valid_3    (pkt_class_valid_3),    //  output,   width = 1,                                     .valid
		.magic_wakeup_3       (magic_wakeup_3),       //  output,   width = 1,                mac_misc_connection_3.magic_wakeup
		.magic_sleep_n_3      (magic_sleep_n_3),      //   input,   width = 1,                                     .magic_sleep_n
		.tx_crc_fwd_3         (tx_crc_fwd_3),         //   input,   width = 1,                                     .tx_crc_fwd
		.ref_clk              (ref_clk),              //   input,   width = 1,         pcs_ref_clk_clock_connection.clk
		.led_crs_0            (led_crs_0),            //  output,   width = 1,              status_led_connection_0.crs
		.led_link_0           (led_link_0),           //  output,   width = 1,                                     .link
		.led_panel_link_0     (led_panel_link_0),     //  output,   width = 1,                                     .panel_link
		.led_col_0            (led_col_0),            //  output,   width = 1,                                     .col
		.led_an_0             (led_an_0),             //  output,   width = 1,                                     .an
		.led_char_err_0       (led_char_err_0),       //  output,   width = 1,                                     .char_err
		.led_disp_err_0       (led_disp_err_0),       //  output,   width = 1,                                     .disp_err
		.tx_analogreset_0     (tx_analogreset_0),     //   input,   width = 1,                     tx_analogreset_0.tx_analogreset
		.tx_digitalreset_0    (tx_digitalreset_0),    //   input,   width = 1,                    tx_digitalreset_0.tx_digitalreset
		.rx_analogreset_0     (rx_analogreset_0),     //   input,   width = 1,                     rx_analogreset_0.rx_analogreset
		.rx_digitalreset_0    (rx_digitalreset_0),    //   input,   width = 1,                    rx_digitalreset_0.rx_digitalreset
		.tx_cal_busy_0        (tx_cal_busy_0),        //  output,   width = 1,                        tx_cal_busy_0.tx_cal_busy
		.rx_cal_busy_0        (rx_cal_busy_0),        //  output,   width = 1,                        rx_cal_busy_0.rx_cal_busy
		.tx_serial_clk_0      (tx_serial_clk_0),      //   input,   width = 1,                      tx_serial_clk_0.clk
		.rx_cdr_refclk_0      (rx_cdr_refclk_0),      //   input,   width = 1,                      rx_cdr_refclk_0.clk
		.rx_set_locktodata_0  (rx_set_locktodata_0),  //   input,   width = 1,                  rx_set_locktodata_0.rx_set_locktodata
		.rx_set_locktoref_0   (rx_set_locktoref_0),   //   input,   width = 1,                   rx_set_locktoref_0.rx_set_locktoref
		.rx_is_lockedtoref_0  (rx_is_lockedtoref_0),  //  output,   width = 1,                  rx_is_lockedtoref_0.rx_is_lockedtoref
		.rx_is_lockedtodata_0 (rx_is_lockedtodata_0), //  output,   width = 1,                 rx_is_lockedtodata_0.rx_is_lockedtodata
		.rxp_0                (rxp_0),                //   input,   width = 1,                  serial_connection_0.rxp
		.txp_0                (txp_0),                //  output,   width = 1,                                     .txp
		.rx_recovclkout_0     (rx_recovclkout_0),     //  output,   width = 1,          serdes_control_connection_0.export
		.led_crs_1            (led_crs_1),            //  output,   width = 1,              status_led_connection_1.crs
		.led_link_1           (led_link_1),           //  output,   width = 1,                                     .link
		.led_panel_link_1     (led_panel_link_1),     //  output,   width = 1,                                     .panel_link
		.led_col_1            (led_col_1),            //  output,   width = 1,                                     .col
		.led_an_1             (led_an_1),             //  output,   width = 1,                                     .an
		.led_char_err_1       (led_char_err_1),       //  output,   width = 1,                                     .char_err
		.led_disp_err_1       (led_disp_err_1),       //  output,   width = 1,                                     .disp_err
		.tx_analogreset_1     (tx_analogreset_1),     //   input,   width = 1,                     tx_analogreset_1.tx_analogreset
		.tx_digitalreset_1    (tx_digitalreset_1),    //   input,   width = 1,                    tx_digitalreset_1.tx_digitalreset
		.rx_analogreset_1     (rx_analogreset_1),     //   input,   width = 1,                     rx_analogreset_1.rx_analogreset
		.rx_digitalreset_1    (rx_digitalreset_1),    //   input,   width = 1,                    rx_digitalreset_1.rx_digitalreset
		.tx_cal_busy_1        (tx_cal_busy_1),        //  output,   width = 1,                        tx_cal_busy_1.tx_cal_busy
		.rx_cal_busy_1        (rx_cal_busy_1),        //  output,   width = 1,                        rx_cal_busy_1.rx_cal_busy
		.tx_serial_clk_1      (tx_serial_clk_1),      //   input,   width = 1,                      tx_serial_clk_1.clk
		.rx_cdr_refclk_1      (rx_cdr_refclk_1),      //   input,   width = 1,                      rx_cdr_refclk_1.clk
		.rx_set_locktodata_1  (rx_set_locktodata_1),  //   input,   width = 1,                  rx_set_locktodata_1.rx_set_locktodata
		.rx_set_locktoref_1   (rx_set_locktoref_1),   //   input,   width = 1,                   rx_set_locktoref_1.rx_set_locktoref
		.rx_is_lockedtoref_1  (rx_is_lockedtoref_1),  //  output,   width = 1,                  rx_is_lockedtoref_1.rx_is_lockedtoref
		.rx_is_lockedtodata_1 (rx_is_lockedtodata_1), //  output,   width = 1,                 rx_is_lockedtodata_1.rx_is_lockedtodata
		.rxp_1                (rxp_1),                //   input,   width = 1,                  serial_connection_1.rxp
		.txp_1                (txp_1),                //  output,   width = 1,                                     .txp
		.rx_recovclkout_1     (rx_recovclkout_1),     //  output,   width = 1,          serdes_control_connection_1.export
		.led_crs_2            (led_crs_2),            //  output,   width = 1,              status_led_connection_2.crs
		.led_link_2           (led_link_2),           //  output,   width = 1,                                     .link
		.led_panel_link_2     (led_panel_link_2),     //  output,   width = 1,                                     .panel_link
		.led_col_2            (led_col_2),            //  output,   width = 1,                                     .col
		.led_an_2             (led_an_2),             //  output,   width = 1,                                     .an
		.led_char_err_2       (led_char_err_2),       //  output,   width = 1,                                     .char_err
		.led_disp_err_2       (led_disp_err_2),       //  output,   width = 1,                                     .disp_err
		.tx_analogreset_2     (tx_analogreset_2),     //   input,   width = 1,                     tx_analogreset_2.tx_analogreset
		.tx_digitalreset_2    (tx_digitalreset_2),    //   input,   width = 1,                    tx_digitalreset_2.tx_digitalreset
		.rx_analogreset_2     (rx_analogreset_2),     //   input,   width = 1,                     rx_analogreset_2.rx_analogreset
		.rx_digitalreset_2    (rx_digitalreset_2),    //   input,   width = 1,                    rx_digitalreset_2.rx_digitalreset
		.tx_cal_busy_2        (tx_cal_busy_2),        //  output,   width = 1,                        tx_cal_busy_2.tx_cal_busy
		.rx_cal_busy_2        (rx_cal_busy_2),        //  output,   width = 1,                        rx_cal_busy_2.rx_cal_busy
		.tx_serial_clk_2      (tx_serial_clk_2),      //   input,   width = 1,                      tx_serial_clk_2.clk
		.rx_cdr_refclk_2      (rx_cdr_refclk_2),      //   input,   width = 1,                      rx_cdr_refclk_2.clk
		.rx_set_locktodata_2  (rx_set_locktodata_2),  //   input,   width = 1,                  rx_set_locktodata_2.rx_set_locktodata
		.rx_set_locktoref_2   (rx_set_locktoref_2),   //   input,   width = 1,                   rx_set_locktoref_2.rx_set_locktoref
		.rx_is_lockedtoref_2  (rx_is_lockedtoref_2),  //  output,   width = 1,                  rx_is_lockedtoref_2.rx_is_lockedtoref
		.rx_is_lockedtodata_2 (rx_is_lockedtodata_2), //  output,   width = 1,                 rx_is_lockedtodata_2.rx_is_lockedtodata
		.rxp_2                (rxp_2),                //   input,   width = 1,                  serial_connection_2.rxp
		.txp_2                (txp_2),                //  output,   width = 1,                                     .txp
		.rx_recovclkout_2     (rx_recovclkout_2),     //  output,   width = 1,          serdes_control_connection_2.export
		.led_crs_3            (led_crs_3),            //  output,   width = 1,              status_led_connection_3.crs
		.led_link_3           (led_link_3),           //  output,   width = 1,                                     .link
		.led_panel_link_3     (led_panel_link_3),     //  output,   width = 1,                                     .panel_link
		.led_col_3            (led_col_3),            //  output,   width = 1,                                     .col
		.led_an_3             (led_an_3),             //  output,   width = 1,                                     .an
		.led_char_err_3       (led_char_err_3),       //  output,   width = 1,                                     .char_err
		.led_disp_err_3       (led_disp_err_3),       //  output,   width = 1,                                     .disp_err
		.tx_analogreset_3     (tx_analogreset_3),     //   input,   width = 1,                     tx_analogreset_3.tx_analogreset
		.tx_digitalreset_3    (tx_digitalreset_3),    //   input,   width = 1,                    tx_digitalreset_3.tx_digitalreset
		.rx_analogreset_3     (rx_analogreset_3),     //   input,   width = 1,                     rx_analogreset_3.rx_analogreset
		.rx_digitalreset_3    (rx_digitalreset_3),    //   input,   width = 1,                    rx_digitalreset_3.rx_digitalreset
		.tx_cal_busy_3        (tx_cal_busy_3),        //  output,   width = 1,                        tx_cal_busy_3.tx_cal_busy
		.rx_cal_busy_3        (rx_cal_busy_3),        //  output,   width = 1,                        rx_cal_busy_3.rx_cal_busy
		.tx_serial_clk_3      (tx_serial_clk_3),      //   input,   width = 1,                      tx_serial_clk_3.clk
		.rx_cdr_refclk_3      (rx_cdr_refclk_3),      //   input,   width = 1,                      rx_cdr_refclk_3.clk
		.rx_set_locktodata_3  (rx_set_locktodata_3),  //   input,   width = 1,                  rx_set_locktodata_3.rx_set_locktodata
		.rx_set_locktoref_3   (rx_set_locktoref_3),   //   input,   width = 1,                   rx_set_locktoref_3.rx_set_locktoref
		.rx_is_lockedtoref_3  (rx_is_lockedtoref_3),  //  output,   width = 1,                  rx_is_lockedtoref_3.rx_is_lockedtoref
		.rx_is_lockedtodata_3 (rx_is_lockedtodata_3), //  output,   width = 1,                 rx_is_lockedtodata_3.rx_is_lockedtodata
		.rxp_3                (rxp_3),                //   input,   width = 1,                  serial_connection_3.rxp
		.txp_3                (txp_3),                //  output,   width = 1,                                     .txp
		.rx_recovclkout_3     (rx_recovclkout_3)      //  output,   width = 1,          serdes_control_connection_3.export
	);

endmodule
