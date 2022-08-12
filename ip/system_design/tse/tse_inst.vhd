	component tse is
		port (
			clk                  : in  std_logic                     := 'X';             -- clk
			reset                : in  std_logic                     := 'X';             -- reset
			reg_data_out         : out std_logic_vector(31 downto 0);                    -- readdata
			reg_rd               : in  std_logic                     := 'X';             -- read
			reg_data_in          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			reg_wr               : in  std_logic                     := 'X';             -- write
			reg_busy             : out std_logic;                                        -- waitrequest
			reg_addr             : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			rx_afull_clk         : in  std_logic                     := 'X';             -- clk
			rx_afull_data        : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- data
			rx_afull_valid       : in  std_logic                     := 'X';             -- valid
			rx_afull_channel     : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- channel
			mac_rx_clk_0         : out std_logic;                                        -- clk
			mac_tx_clk_0         : out std_logic;                                        -- clk
			data_rx_data_0       : out std_logic_vector(7 downto 0);                     -- data
			data_rx_eop_0        : out std_logic;                                        -- endofpacket
			data_rx_error_0      : out std_logic_vector(4 downto 0);                     -- error
			data_rx_ready_0      : in  std_logic                     := 'X';             -- ready
			data_rx_sop_0        : out std_logic;                                        -- startofpacket
			data_rx_valid_0      : out std_logic;                                        -- valid
			data_tx_data_0       : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			data_tx_eop_0        : in  std_logic                     := 'X';             -- endofpacket
			data_tx_error_0      : in  std_logic                     := 'X';             -- error
			data_tx_ready_0      : out std_logic;                                        -- ready
			data_tx_sop_0        : in  std_logic                     := 'X';             -- startofpacket
			data_tx_valid_0      : in  std_logic                     := 'X';             -- valid
			pkt_class_data_0     : out std_logic_vector(4 downto 0);                     -- data
			pkt_class_valid_0    : out std_logic;                                        -- valid
			magic_wakeup_0       : out std_logic;                                        -- magic_wakeup
			magic_sleep_n_0      : in  std_logic                     := 'X';             -- magic_sleep_n
			tx_crc_fwd_0         : in  std_logic                     := 'X';             -- tx_crc_fwd
			mdc                  : out std_logic;                                        -- mdc
			mdio_in              : in  std_logic                     := 'X';             -- mdio_in
			mdio_out             : out std_logic;                                        -- mdio_out
			mdio_oen             : out std_logic;                                        -- mdio_oen
			mac_rx_clk_1         : out std_logic;                                        -- clk
			mac_tx_clk_1         : out std_logic;                                        -- clk
			data_rx_data_1       : out std_logic_vector(7 downto 0);                     -- data
			data_rx_eop_1        : out std_logic;                                        -- endofpacket
			data_rx_error_1      : out std_logic_vector(4 downto 0);                     -- error
			data_rx_ready_1      : in  std_logic                     := 'X';             -- ready
			data_rx_sop_1        : out std_logic;                                        -- startofpacket
			data_rx_valid_1      : out std_logic;                                        -- valid
			data_tx_data_1       : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			data_tx_eop_1        : in  std_logic                     := 'X';             -- endofpacket
			data_tx_error_1      : in  std_logic                     := 'X';             -- error
			data_tx_ready_1      : out std_logic;                                        -- ready
			data_tx_sop_1        : in  std_logic                     := 'X';             -- startofpacket
			data_tx_valid_1      : in  std_logic                     := 'X';             -- valid
			pkt_class_data_1     : out std_logic_vector(4 downto 0);                     -- data
			pkt_class_valid_1    : out std_logic;                                        -- valid
			magic_wakeup_1       : out std_logic;                                        -- magic_wakeup
			magic_sleep_n_1      : in  std_logic                     := 'X';             -- magic_sleep_n
			tx_crc_fwd_1         : in  std_logic                     := 'X';             -- tx_crc_fwd
			mac_rx_clk_2         : out std_logic;                                        -- clk
			mac_tx_clk_2         : out std_logic;                                        -- clk
			data_rx_data_2       : out std_logic_vector(7 downto 0);                     -- data
			data_rx_eop_2        : out std_logic;                                        -- endofpacket
			data_rx_error_2      : out std_logic_vector(4 downto 0);                     -- error
			data_rx_ready_2      : in  std_logic                     := 'X';             -- ready
			data_rx_sop_2        : out std_logic;                                        -- startofpacket
			data_rx_valid_2      : out std_logic;                                        -- valid
			data_tx_data_2       : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			data_tx_eop_2        : in  std_logic                     := 'X';             -- endofpacket
			data_tx_error_2      : in  std_logic                     := 'X';             -- error
			data_tx_ready_2      : out std_logic;                                        -- ready
			data_tx_sop_2        : in  std_logic                     := 'X';             -- startofpacket
			data_tx_valid_2      : in  std_logic                     := 'X';             -- valid
			pkt_class_data_2     : out std_logic_vector(4 downto 0);                     -- data
			pkt_class_valid_2    : out std_logic;                                        -- valid
			magic_wakeup_2       : out std_logic;                                        -- magic_wakeup
			magic_sleep_n_2      : in  std_logic                     := 'X';             -- magic_sleep_n
			tx_crc_fwd_2         : in  std_logic                     := 'X';             -- tx_crc_fwd
			mac_rx_clk_3         : out std_logic;                                        -- clk
			mac_tx_clk_3         : out std_logic;                                        -- clk
			data_rx_data_3       : out std_logic_vector(7 downto 0);                     -- data
			data_rx_eop_3        : out std_logic;                                        -- endofpacket
			data_rx_error_3      : out std_logic_vector(4 downto 0);                     -- error
			data_rx_ready_3      : in  std_logic                     := 'X';             -- ready
			data_rx_sop_3        : out std_logic;                                        -- startofpacket
			data_rx_valid_3      : out std_logic;                                        -- valid
			data_tx_data_3       : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			data_tx_eop_3        : in  std_logic                     := 'X';             -- endofpacket
			data_tx_error_3      : in  std_logic                     := 'X';             -- error
			data_tx_ready_3      : out std_logic;                                        -- ready
			data_tx_sop_3        : in  std_logic                     := 'X';             -- startofpacket
			data_tx_valid_3      : in  std_logic                     := 'X';             -- valid
			pkt_class_data_3     : out std_logic_vector(4 downto 0);                     -- data
			pkt_class_valid_3    : out std_logic;                                        -- valid
			magic_wakeup_3       : out std_logic;                                        -- magic_wakeup
			magic_sleep_n_3      : in  std_logic                     := 'X';             -- magic_sleep_n
			tx_crc_fwd_3         : in  std_logic                     := 'X';             -- tx_crc_fwd
			ref_clk              : in  std_logic                     := 'X';             -- clk
			led_crs_0            : out std_logic;                                        -- crs
			led_link_0           : out std_logic;                                        -- link
			led_panel_link_0     : out std_logic;                                        -- panel_link
			led_col_0            : out std_logic;                                        -- col
			led_an_0             : out std_logic;                                        -- an
			led_char_err_0       : out std_logic;                                        -- char_err
			led_disp_err_0       : out std_logic;                                        -- disp_err
			tx_analogreset_0     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset_0    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset_0     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset_0    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy_0        : out std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy_0        : out std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tx_serial_clk_0      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			rx_cdr_refclk_0      : in  std_logic                     := 'X';             -- clk
			rx_set_locktodata_0  : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref_0   : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref_0  : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata_0 : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			rxp_0                : in  std_logic                     := 'X';             -- rxp
			txp_0                : out std_logic;                                        -- txp
			rx_recovclkout_0     : out std_logic;                                        -- export
			led_crs_1            : out std_logic;                                        -- crs
			led_link_1           : out std_logic;                                        -- link
			led_panel_link_1     : out std_logic;                                        -- panel_link
			led_col_1            : out std_logic;                                        -- col
			led_an_1             : out std_logic;                                        -- an
			led_char_err_1       : out std_logic;                                        -- char_err
			led_disp_err_1       : out std_logic;                                        -- disp_err
			tx_analogreset_1     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset_1    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset_1     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset_1    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy_1        : out std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy_1        : out std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tx_serial_clk_1      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			rx_cdr_refclk_1      : in  std_logic                     := 'X';             -- clk
			rx_set_locktodata_1  : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref_1   : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref_1  : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata_1 : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			rxp_1                : in  std_logic                     := 'X';             -- rxp
			txp_1                : out std_logic;                                        -- txp
			rx_recovclkout_1     : out std_logic;                                        -- export
			led_crs_2            : out std_logic;                                        -- crs
			led_link_2           : out std_logic;                                        -- link
			led_panel_link_2     : out std_logic;                                        -- panel_link
			led_col_2            : out std_logic;                                        -- col
			led_an_2             : out std_logic;                                        -- an
			led_char_err_2       : out std_logic;                                        -- char_err
			led_disp_err_2       : out std_logic;                                        -- disp_err
			tx_analogreset_2     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset_2    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset_2     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset_2    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy_2        : out std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy_2        : out std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tx_serial_clk_2      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			rx_cdr_refclk_2      : in  std_logic                     := 'X';             -- clk
			rx_set_locktodata_2  : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref_2   : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref_2  : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata_2 : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			rxp_2                : in  std_logic                     := 'X';             -- rxp
			txp_2                : out std_logic;                                        -- txp
			rx_recovclkout_2     : out std_logic;                                        -- export
			led_crs_3            : out std_logic;                                        -- crs
			led_link_3           : out std_logic;                                        -- link
			led_panel_link_3     : out std_logic;                                        -- panel_link
			led_col_3            : out std_logic;                                        -- col
			led_an_3             : out std_logic;                                        -- an
			led_char_err_3       : out std_logic;                                        -- char_err
			led_disp_err_3       : out std_logic;                                        -- disp_err
			tx_analogreset_3     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset_3    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset_3     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset_3    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy_3        : out std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy_3        : out std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tx_serial_clk_3      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			rx_cdr_refclk_3      : in  std_logic                     := 'X';             -- clk
			rx_set_locktodata_3  : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref_3   : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref_3  : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata_3 : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			rxp_3                : in  std_logic                     := 'X';             -- rxp
			txp_3                : out std_logic;                                        -- txp
			rx_recovclkout_3     : out std_logic                                         -- export
		);
	end component tse;

	u0 : component tse
		port map (
			clk                  => CONNECTED_TO_clk,                  --        control_port_clock_connection.clk
			reset                => CONNECTED_TO_reset,                --                     reset_connection.reset
			reg_data_out         => CONNECTED_TO_reg_data_out,         --                         control_port.readdata
			reg_rd               => CONNECTED_TO_reg_rd,               --                                     .read
			reg_data_in          => CONNECTED_TO_reg_data_in,          --                                     .writedata
			reg_wr               => CONNECTED_TO_reg_wr,               --                                     .write
			reg_busy             => CONNECTED_TO_reg_busy,             --                                     .waitrequest
			reg_addr             => CONNECTED_TO_reg_addr,             --                                     .address
			rx_afull_clk         => CONNECTED_TO_rx_afull_clk,         -- receive_fifo_status_clock_connection.clk
			rx_afull_data        => CONNECTED_TO_rx_afull_data,        --                  receive_fifo_status.data
			rx_afull_valid       => CONNECTED_TO_rx_afull_valid,       --                                     .valid
			rx_afull_channel     => CONNECTED_TO_rx_afull_channel,     --                                     .channel
			mac_rx_clk_0         => CONNECTED_TO_mac_rx_clk_0,         --            mac_rx_clock_connection_0.clk
			mac_tx_clk_0         => CONNECTED_TO_mac_tx_clk_0,         --            mac_tx_clock_connection_0.clk
			data_rx_data_0       => CONNECTED_TO_data_rx_data_0,       --                            receive_0.data
			data_rx_eop_0        => CONNECTED_TO_data_rx_eop_0,        --                                     .endofpacket
			data_rx_error_0      => CONNECTED_TO_data_rx_error_0,      --                                     .error
			data_rx_ready_0      => CONNECTED_TO_data_rx_ready_0,      --                                     .ready
			data_rx_sop_0        => CONNECTED_TO_data_rx_sop_0,        --                                     .startofpacket
			data_rx_valid_0      => CONNECTED_TO_data_rx_valid_0,      --                                     .valid
			data_tx_data_0       => CONNECTED_TO_data_tx_data_0,       --                           transmit_0.data
			data_tx_eop_0        => CONNECTED_TO_data_tx_eop_0,        --                                     .endofpacket
			data_tx_error_0      => CONNECTED_TO_data_tx_error_0,      --                                     .error
			data_tx_ready_0      => CONNECTED_TO_data_tx_ready_0,      --                                     .ready
			data_tx_sop_0        => CONNECTED_TO_data_tx_sop_0,        --                                     .startofpacket
			data_tx_valid_0      => CONNECTED_TO_data_tx_valid_0,      --                                     .valid
			pkt_class_data_0     => CONNECTED_TO_pkt_class_data_0,     --                receive_packet_type_0.data
			pkt_class_valid_0    => CONNECTED_TO_pkt_class_valid_0,    --                                     .valid
			magic_wakeup_0       => CONNECTED_TO_magic_wakeup_0,       --                mac_misc_connection_0.magic_wakeup
			magic_sleep_n_0      => CONNECTED_TO_magic_sleep_n_0,      --                                     .magic_sleep_n
			tx_crc_fwd_0         => CONNECTED_TO_tx_crc_fwd_0,         --                                     .tx_crc_fwd
			mdc                  => CONNECTED_TO_mdc,                  --                  mac_mdio_connection.mdc
			mdio_in              => CONNECTED_TO_mdio_in,              --                                     .mdio_in
			mdio_out             => CONNECTED_TO_mdio_out,             --                                     .mdio_out
			mdio_oen             => CONNECTED_TO_mdio_oen,             --                                     .mdio_oen
			mac_rx_clk_1         => CONNECTED_TO_mac_rx_clk_1,         --            mac_rx_clock_connection_1.clk
			mac_tx_clk_1         => CONNECTED_TO_mac_tx_clk_1,         --            mac_tx_clock_connection_1.clk
			data_rx_data_1       => CONNECTED_TO_data_rx_data_1,       --                            receive_1.data
			data_rx_eop_1        => CONNECTED_TO_data_rx_eop_1,        --                                     .endofpacket
			data_rx_error_1      => CONNECTED_TO_data_rx_error_1,      --                                     .error
			data_rx_ready_1      => CONNECTED_TO_data_rx_ready_1,      --                                     .ready
			data_rx_sop_1        => CONNECTED_TO_data_rx_sop_1,        --                                     .startofpacket
			data_rx_valid_1      => CONNECTED_TO_data_rx_valid_1,      --                                     .valid
			data_tx_data_1       => CONNECTED_TO_data_tx_data_1,       --                           transmit_1.data
			data_tx_eop_1        => CONNECTED_TO_data_tx_eop_1,        --                                     .endofpacket
			data_tx_error_1      => CONNECTED_TO_data_tx_error_1,      --                                     .error
			data_tx_ready_1      => CONNECTED_TO_data_tx_ready_1,      --                                     .ready
			data_tx_sop_1        => CONNECTED_TO_data_tx_sop_1,        --                                     .startofpacket
			data_tx_valid_1      => CONNECTED_TO_data_tx_valid_1,      --                                     .valid
			pkt_class_data_1     => CONNECTED_TO_pkt_class_data_1,     --                receive_packet_type_1.data
			pkt_class_valid_1    => CONNECTED_TO_pkt_class_valid_1,    --                                     .valid
			magic_wakeup_1       => CONNECTED_TO_magic_wakeup_1,       --                mac_misc_connection_1.magic_wakeup
			magic_sleep_n_1      => CONNECTED_TO_magic_sleep_n_1,      --                                     .magic_sleep_n
			tx_crc_fwd_1         => CONNECTED_TO_tx_crc_fwd_1,         --                                     .tx_crc_fwd
			mac_rx_clk_2         => CONNECTED_TO_mac_rx_clk_2,         --            mac_rx_clock_connection_2.clk
			mac_tx_clk_2         => CONNECTED_TO_mac_tx_clk_2,         --            mac_tx_clock_connection_2.clk
			data_rx_data_2       => CONNECTED_TO_data_rx_data_2,       --                            receive_2.data
			data_rx_eop_2        => CONNECTED_TO_data_rx_eop_2,        --                                     .endofpacket
			data_rx_error_2      => CONNECTED_TO_data_rx_error_2,      --                                     .error
			data_rx_ready_2      => CONNECTED_TO_data_rx_ready_2,      --                                     .ready
			data_rx_sop_2        => CONNECTED_TO_data_rx_sop_2,        --                                     .startofpacket
			data_rx_valid_2      => CONNECTED_TO_data_rx_valid_2,      --                                     .valid
			data_tx_data_2       => CONNECTED_TO_data_tx_data_2,       --                           transmit_2.data
			data_tx_eop_2        => CONNECTED_TO_data_tx_eop_2,        --                                     .endofpacket
			data_tx_error_2      => CONNECTED_TO_data_tx_error_2,      --                                     .error
			data_tx_ready_2      => CONNECTED_TO_data_tx_ready_2,      --                                     .ready
			data_tx_sop_2        => CONNECTED_TO_data_tx_sop_2,        --                                     .startofpacket
			data_tx_valid_2      => CONNECTED_TO_data_tx_valid_2,      --                                     .valid
			pkt_class_data_2     => CONNECTED_TO_pkt_class_data_2,     --                receive_packet_type_2.data
			pkt_class_valid_2    => CONNECTED_TO_pkt_class_valid_2,    --                                     .valid
			magic_wakeup_2       => CONNECTED_TO_magic_wakeup_2,       --                mac_misc_connection_2.magic_wakeup
			magic_sleep_n_2      => CONNECTED_TO_magic_sleep_n_2,      --                                     .magic_sleep_n
			tx_crc_fwd_2         => CONNECTED_TO_tx_crc_fwd_2,         --                                     .tx_crc_fwd
			mac_rx_clk_3         => CONNECTED_TO_mac_rx_clk_3,         --            mac_rx_clock_connection_3.clk
			mac_tx_clk_3         => CONNECTED_TO_mac_tx_clk_3,         --            mac_tx_clock_connection_3.clk
			data_rx_data_3       => CONNECTED_TO_data_rx_data_3,       --                            receive_3.data
			data_rx_eop_3        => CONNECTED_TO_data_rx_eop_3,        --                                     .endofpacket
			data_rx_error_3      => CONNECTED_TO_data_rx_error_3,      --                                     .error
			data_rx_ready_3      => CONNECTED_TO_data_rx_ready_3,      --                                     .ready
			data_rx_sop_3        => CONNECTED_TO_data_rx_sop_3,        --                                     .startofpacket
			data_rx_valid_3      => CONNECTED_TO_data_rx_valid_3,      --                                     .valid
			data_tx_data_3       => CONNECTED_TO_data_tx_data_3,       --                           transmit_3.data
			data_tx_eop_3        => CONNECTED_TO_data_tx_eop_3,        --                                     .endofpacket
			data_tx_error_3      => CONNECTED_TO_data_tx_error_3,      --                                     .error
			data_tx_ready_3      => CONNECTED_TO_data_tx_ready_3,      --                                     .ready
			data_tx_sop_3        => CONNECTED_TO_data_tx_sop_3,        --                                     .startofpacket
			data_tx_valid_3      => CONNECTED_TO_data_tx_valid_3,      --                                     .valid
			pkt_class_data_3     => CONNECTED_TO_pkt_class_data_3,     --                receive_packet_type_3.data
			pkt_class_valid_3    => CONNECTED_TO_pkt_class_valid_3,    --                                     .valid
			magic_wakeup_3       => CONNECTED_TO_magic_wakeup_3,       --                mac_misc_connection_3.magic_wakeup
			magic_sleep_n_3      => CONNECTED_TO_magic_sleep_n_3,      --                                     .magic_sleep_n
			tx_crc_fwd_3         => CONNECTED_TO_tx_crc_fwd_3,         --                                     .tx_crc_fwd
			ref_clk              => CONNECTED_TO_ref_clk,              --         pcs_ref_clk_clock_connection.clk
			led_crs_0            => CONNECTED_TO_led_crs_0,            --              status_led_connection_0.crs
			led_link_0           => CONNECTED_TO_led_link_0,           --                                     .link
			led_panel_link_0     => CONNECTED_TO_led_panel_link_0,     --                                     .panel_link
			led_col_0            => CONNECTED_TO_led_col_0,            --                                     .col
			led_an_0             => CONNECTED_TO_led_an_0,             --                                     .an
			led_char_err_0       => CONNECTED_TO_led_char_err_0,       --                                     .char_err
			led_disp_err_0       => CONNECTED_TO_led_disp_err_0,       --                                     .disp_err
			tx_analogreset_0     => CONNECTED_TO_tx_analogreset_0,     --                     tx_analogreset_0.tx_analogreset
			tx_digitalreset_0    => CONNECTED_TO_tx_digitalreset_0,    --                    tx_digitalreset_0.tx_digitalreset
			rx_analogreset_0     => CONNECTED_TO_rx_analogreset_0,     --                     rx_analogreset_0.rx_analogreset
			rx_digitalreset_0    => CONNECTED_TO_rx_digitalreset_0,    --                    rx_digitalreset_0.rx_digitalreset
			tx_cal_busy_0        => CONNECTED_TO_tx_cal_busy_0,        --                        tx_cal_busy_0.tx_cal_busy
			rx_cal_busy_0        => CONNECTED_TO_rx_cal_busy_0,        --                        rx_cal_busy_0.rx_cal_busy
			tx_serial_clk_0      => CONNECTED_TO_tx_serial_clk_0,      --                      tx_serial_clk_0.clk
			rx_cdr_refclk_0      => CONNECTED_TO_rx_cdr_refclk_0,      --                      rx_cdr_refclk_0.clk
			rx_set_locktodata_0  => CONNECTED_TO_rx_set_locktodata_0,  --                  rx_set_locktodata_0.rx_set_locktodata
			rx_set_locktoref_0   => CONNECTED_TO_rx_set_locktoref_0,   --                   rx_set_locktoref_0.rx_set_locktoref
			rx_is_lockedtoref_0  => CONNECTED_TO_rx_is_lockedtoref_0,  --                  rx_is_lockedtoref_0.rx_is_lockedtoref
			rx_is_lockedtodata_0 => CONNECTED_TO_rx_is_lockedtodata_0, --                 rx_is_lockedtodata_0.rx_is_lockedtodata
			rxp_0                => CONNECTED_TO_rxp_0,                --                  serial_connection_0.rxp
			txp_0                => CONNECTED_TO_txp_0,                --                                     .txp
			rx_recovclkout_0     => CONNECTED_TO_rx_recovclkout_0,     --          serdes_control_connection_0.export
			led_crs_1            => CONNECTED_TO_led_crs_1,            --              status_led_connection_1.crs
			led_link_1           => CONNECTED_TO_led_link_1,           --                                     .link
			led_panel_link_1     => CONNECTED_TO_led_panel_link_1,     --                                     .panel_link
			led_col_1            => CONNECTED_TO_led_col_1,            --                                     .col
			led_an_1             => CONNECTED_TO_led_an_1,             --                                     .an
			led_char_err_1       => CONNECTED_TO_led_char_err_1,       --                                     .char_err
			led_disp_err_1       => CONNECTED_TO_led_disp_err_1,       --                                     .disp_err
			tx_analogreset_1     => CONNECTED_TO_tx_analogreset_1,     --                     tx_analogreset_1.tx_analogreset
			tx_digitalreset_1    => CONNECTED_TO_tx_digitalreset_1,    --                    tx_digitalreset_1.tx_digitalreset
			rx_analogreset_1     => CONNECTED_TO_rx_analogreset_1,     --                     rx_analogreset_1.rx_analogreset
			rx_digitalreset_1    => CONNECTED_TO_rx_digitalreset_1,    --                    rx_digitalreset_1.rx_digitalreset
			tx_cal_busy_1        => CONNECTED_TO_tx_cal_busy_1,        --                        tx_cal_busy_1.tx_cal_busy
			rx_cal_busy_1        => CONNECTED_TO_rx_cal_busy_1,        --                        rx_cal_busy_1.rx_cal_busy
			tx_serial_clk_1      => CONNECTED_TO_tx_serial_clk_1,      --                      tx_serial_clk_1.clk
			rx_cdr_refclk_1      => CONNECTED_TO_rx_cdr_refclk_1,      --                      rx_cdr_refclk_1.clk
			rx_set_locktodata_1  => CONNECTED_TO_rx_set_locktodata_1,  --                  rx_set_locktodata_1.rx_set_locktodata
			rx_set_locktoref_1   => CONNECTED_TO_rx_set_locktoref_1,   --                   rx_set_locktoref_1.rx_set_locktoref
			rx_is_lockedtoref_1  => CONNECTED_TO_rx_is_lockedtoref_1,  --                  rx_is_lockedtoref_1.rx_is_lockedtoref
			rx_is_lockedtodata_1 => CONNECTED_TO_rx_is_lockedtodata_1, --                 rx_is_lockedtodata_1.rx_is_lockedtodata
			rxp_1                => CONNECTED_TO_rxp_1,                --                  serial_connection_1.rxp
			txp_1                => CONNECTED_TO_txp_1,                --                                     .txp
			rx_recovclkout_1     => CONNECTED_TO_rx_recovclkout_1,     --          serdes_control_connection_1.export
			led_crs_2            => CONNECTED_TO_led_crs_2,            --              status_led_connection_2.crs
			led_link_2           => CONNECTED_TO_led_link_2,           --                                     .link
			led_panel_link_2     => CONNECTED_TO_led_panel_link_2,     --                                     .panel_link
			led_col_2            => CONNECTED_TO_led_col_2,            --                                     .col
			led_an_2             => CONNECTED_TO_led_an_2,             --                                     .an
			led_char_err_2       => CONNECTED_TO_led_char_err_2,       --                                     .char_err
			led_disp_err_2       => CONNECTED_TO_led_disp_err_2,       --                                     .disp_err
			tx_analogreset_2     => CONNECTED_TO_tx_analogreset_2,     --                     tx_analogreset_2.tx_analogreset
			tx_digitalreset_2    => CONNECTED_TO_tx_digitalreset_2,    --                    tx_digitalreset_2.tx_digitalreset
			rx_analogreset_2     => CONNECTED_TO_rx_analogreset_2,     --                     rx_analogreset_2.rx_analogreset
			rx_digitalreset_2    => CONNECTED_TO_rx_digitalreset_2,    --                    rx_digitalreset_2.rx_digitalreset
			tx_cal_busy_2        => CONNECTED_TO_tx_cal_busy_2,        --                        tx_cal_busy_2.tx_cal_busy
			rx_cal_busy_2        => CONNECTED_TO_rx_cal_busy_2,        --                        rx_cal_busy_2.rx_cal_busy
			tx_serial_clk_2      => CONNECTED_TO_tx_serial_clk_2,      --                      tx_serial_clk_2.clk
			rx_cdr_refclk_2      => CONNECTED_TO_rx_cdr_refclk_2,      --                      rx_cdr_refclk_2.clk
			rx_set_locktodata_2  => CONNECTED_TO_rx_set_locktodata_2,  --                  rx_set_locktodata_2.rx_set_locktodata
			rx_set_locktoref_2   => CONNECTED_TO_rx_set_locktoref_2,   --                   rx_set_locktoref_2.rx_set_locktoref
			rx_is_lockedtoref_2  => CONNECTED_TO_rx_is_lockedtoref_2,  --                  rx_is_lockedtoref_2.rx_is_lockedtoref
			rx_is_lockedtodata_2 => CONNECTED_TO_rx_is_lockedtodata_2, --                 rx_is_lockedtodata_2.rx_is_lockedtodata
			rxp_2                => CONNECTED_TO_rxp_2,                --                  serial_connection_2.rxp
			txp_2                => CONNECTED_TO_txp_2,                --                                     .txp
			rx_recovclkout_2     => CONNECTED_TO_rx_recovclkout_2,     --          serdes_control_connection_2.export
			led_crs_3            => CONNECTED_TO_led_crs_3,            --              status_led_connection_3.crs
			led_link_3           => CONNECTED_TO_led_link_3,           --                                     .link
			led_panel_link_3     => CONNECTED_TO_led_panel_link_3,     --                                     .panel_link
			led_col_3            => CONNECTED_TO_led_col_3,            --                                     .col
			led_an_3             => CONNECTED_TO_led_an_3,             --                                     .an
			led_char_err_3       => CONNECTED_TO_led_char_err_3,       --                                     .char_err
			led_disp_err_3       => CONNECTED_TO_led_disp_err_3,       --                                     .disp_err
			tx_analogreset_3     => CONNECTED_TO_tx_analogreset_3,     --                     tx_analogreset_3.tx_analogreset
			tx_digitalreset_3    => CONNECTED_TO_tx_digitalreset_3,    --                    tx_digitalreset_3.tx_digitalreset
			rx_analogreset_3     => CONNECTED_TO_rx_analogreset_3,     --                     rx_analogreset_3.rx_analogreset
			rx_digitalreset_3    => CONNECTED_TO_rx_digitalreset_3,    --                    rx_digitalreset_3.rx_digitalreset
			tx_cal_busy_3        => CONNECTED_TO_tx_cal_busy_3,        --                        tx_cal_busy_3.tx_cal_busy
			rx_cal_busy_3        => CONNECTED_TO_rx_cal_busy_3,        --                        rx_cal_busy_3.rx_cal_busy
			tx_serial_clk_3      => CONNECTED_TO_tx_serial_clk_3,      --                      tx_serial_clk_3.clk
			rx_cdr_refclk_3      => CONNECTED_TO_rx_cdr_refclk_3,      --                      rx_cdr_refclk_3.clk
			rx_set_locktodata_3  => CONNECTED_TO_rx_set_locktodata_3,  --                  rx_set_locktodata_3.rx_set_locktodata
			rx_set_locktoref_3   => CONNECTED_TO_rx_set_locktoref_3,   --                   rx_set_locktoref_3.rx_set_locktoref
			rx_is_lockedtoref_3  => CONNECTED_TO_rx_is_lockedtoref_3,  --                  rx_is_lockedtoref_3.rx_is_lockedtoref
			rx_is_lockedtodata_3 => CONNECTED_TO_rx_is_lockedtodata_3, --                 rx_is_lockedtodata_3.rx_is_lockedtodata
			rxp_3                => CONNECTED_TO_rxp_3,                --                  serial_connection_3.rxp
			txp_3                => CONNECTED_TO_txp_3,                --                                     .txp
			rx_recovclkout_3     => CONNECTED_TO_rx_recovclkout_3      --          serdes_control_connection_3.export
		);

