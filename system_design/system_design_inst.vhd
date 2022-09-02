	component system_design is
		port (
			clock_50_clk                            : out std_logic;                                        -- clk
			mac_inited_mac_inited                   : out std_logic;                                        -- mac_inited
			pll_refclk_clk                          : in  std_logic                     := 'X';             -- clk
			reset_main_out_reset                    : out std_logic;                                        -- reset
			reset_mod_clock_clk                     : in  std_logic                     := 'X';             -- clk
			reset_mod_reset_reset_n                 : in  std_logic                     := 'X';             -- reset_n
			reset_mod_reset_phy_reset               : out std_logic;                                        -- reset
			send_packet_1_control_start_ram_addr    : in  std_logic_vector(24 downto 0) := (others => 'X'); -- start_ram_addr
			send_packet_1_control_cmd_send          : in  std_logic                     := 'X';             -- cmd_send
			send_packet_2_control_start_ram_addr    : in  std_logic_vector(24 downto 0) := (others => 'X'); -- start_ram_addr
			send_packet_2_control_cmd_send          : in  std_logic                     := 'X';             -- cmd_send
			mac_misc_1_magic_wakeup                 : out std_logic;                                        -- magic_wakeup
			mac_misc_1_magic_sleep_n                : in  std_logic                     := 'X';             -- magic_sleep_n
			mac_misc_1_tx_crc_fwd                   : in  std_logic                     := 'X';             -- tx_crc_fwd
			mac_mdio_mdc                            : out std_logic;                                        -- mdc
			mac_mdio_mdio_in                        : in  std_logic                     := 'X';             -- mdio_in
			mac_mdio_mdio_out                       : out std_logic;                                        -- mdio_out
			mac_mdio_mdio_oen                       : out std_logic;                                        -- mdio_oen
			mac_misc_2_magic_wakeup                 : out std_logic;                                        -- magic_wakeup
			mac_misc_2_magic_sleep_n                : in  std_logic                     := 'X';             -- magic_sleep_n
			mac_misc_2_tx_crc_fwd                   : in  std_logic                     := 'X';             -- tx_crc_fwd
			tse_ref_clk                             : in  std_logic                     := 'X';             -- clk
			status_led_connection_0_crs             : out std_logic;                                        -- crs
			status_led_connection_0_link            : out std_logic;                                        -- link
			status_led_connection_0_panel_link      : out std_logic;                                        -- panel_link
			status_led_connection_0_col             : out std_logic;                                        -- col
			status_led_connection_0_an              : out std_logic;                                        -- an
			status_led_connection_0_char_err        : out std_logic;                                        -- char_err
			status_led_connection_0_disp_err        : out std_logic;                                        -- disp_err
			tx_analogreset_0_tx_analogreset         : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset_0_tx_digitalreset       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset_0_rx_analogreset         : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset_0_rx_digitalreset       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy_0_tx_cal_busy               : out std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy_0_rx_cal_busy               : out std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tse_rx_cdr_refclk_0_clk                 : in  std_logic                     := 'X';             -- clk
			rx_set_locktodata_0_rx_set_locktodata   : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref_0_rx_set_locktoref     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref_0_rx_is_lockedtoref   : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata_0_rx_is_lockedtodata : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			sgmii_1_rxp                             : in  std_logic                     := 'X';             -- rxp
			sgmii_1_txp                             : out std_logic;                                        -- txp
			serdes_control_connection_0_export      : out std_logic;                                        -- export
			status_led_connection_1_crs             : out std_logic;                                        -- crs
			status_led_connection_1_link            : out std_logic;                                        -- link
			status_led_connection_1_panel_link      : out std_logic;                                        -- panel_link
			status_led_connection_1_col             : out std_logic;                                        -- col
			status_led_connection_1_an              : out std_logic;                                        -- an
			status_led_connection_1_char_err        : out std_logic;                                        -- char_err
			status_led_connection_1_disp_err        : out std_logic;                                        -- disp_err
			tx_analogreset_1_tx_analogreset         : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset_1_tx_digitalreset       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset_1_rx_analogreset         : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset_1_rx_digitalreset       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy_1_tx_cal_busy               : out std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy_1_rx_cal_busy               : out std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tse_rx_cdr_refclk_1_clk                 : in  std_logic                     := 'X';             -- clk
			rx_set_locktodata_1_rx_set_locktodata   : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref_1_rx_set_locktoref     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref_1_rx_is_lockedtoref   : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata_1_rx_is_lockedtodata : out std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			sgmii_2_rxp                             : in  std_logic                     := 'X';             -- rxp
			sgmii_2_txp                             : out std_logic;                                        -- txp
			serdes_control_connection_1_export      : out std_logic;                                        -- export
			tse_tx_serial_clk_2_clk                 : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			tse_rx_cdr_refclk_2_clk                 : in  std_logic                     := 'X';             -- clk
			sgmii_3_rxp                             : in  std_logic                     := 'X';             -- rxp
			sgmii_3_txp                             : out std_logic;                                        -- txp
			tse_tx_serial_clk_3_clk                 : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			tse_rx_cdr_refclk_3_clk                 : in  std_logic                     := 'X';             -- clk
			sgmii_4_rxp                             : in  std_logic                     := 'X';             -- rxp
			sgmii_4_txp                             : out std_logic;                                        -- txp
			xcvr_pll_powerdown_pll_powerdown        : in  std_logic                     := 'X';             -- pll_powerdown
			xcvr_pll_refclk_clk                     : in  std_logic                     := 'X'              -- clk
		);
	end component system_design;

	u0 : component system_design
		port map (
			clock_50_clk                            => CONNECTED_TO_clock_50_clk,                            --                    clock_50.clk
			mac_inited_mac_inited                   => CONNECTED_TO_mac_inited_mac_inited,                   --                  mac_inited.mac_inited
			pll_refclk_clk                          => CONNECTED_TO_pll_refclk_clk,                          --                  pll_refclk.clk
			reset_main_out_reset                    => CONNECTED_TO_reset_main_out_reset,                    --              reset_main_out.reset
			reset_mod_clock_clk                     => CONNECTED_TO_reset_mod_clock_clk,                     --             reset_mod_clock.clk
			reset_mod_reset_reset_n                 => CONNECTED_TO_reset_mod_reset_reset_n,                 --             reset_mod_reset.reset_n
			reset_mod_reset_phy_reset               => CONNECTED_TO_reset_mod_reset_phy_reset,               --         reset_mod_reset_phy.reset
			send_packet_1_control_start_ram_addr    => CONNECTED_TO_send_packet_1_control_start_ram_addr,    --       send_packet_1_control.start_ram_addr
			send_packet_1_control_cmd_send          => CONNECTED_TO_send_packet_1_control_cmd_send,          --                            .cmd_send
			send_packet_2_control_start_ram_addr    => CONNECTED_TO_send_packet_2_control_start_ram_addr,    --       send_packet_2_control.start_ram_addr
			send_packet_2_control_cmd_send          => CONNECTED_TO_send_packet_2_control_cmd_send,          --                            .cmd_send
			mac_misc_1_magic_wakeup                 => CONNECTED_TO_mac_misc_1_magic_wakeup,                 --                  mac_misc_1.magic_wakeup
			mac_misc_1_magic_sleep_n                => CONNECTED_TO_mac_misc_1_magic_sleep_n,                --                            .magic_sleep_n
			mac_misc_1_tx_crc_fwd                   => CONNECTED_TO_mac_misc_1_tx_crc_fwd,                   --                            .tx_crc_fwd
			mac_mdio_mdc                            => CONNECTED_TO_mac_mdio_mdc,                            --                    mac_mdio.mdc
			mac_mdio_mdio_in                        => CONNECTED_TO_mac_mdio_mdio_in,                        --                            .mdio_in
			mac_mdio_mdio_out                       => CONNECTED_TO_mac_mdio_mdio_out,                       --                            .mdio_out
			mac_mdio_mdio_oen                       => CONNECTED_TO_mac_mdio_mdio_oen,                       --                            .mdio_oen
			mac_misc_2_magic_wakeup                 => CONNECTED_TO_mac_misc_2_magic_wakeup,                 --                  mac_misc_2.magic_wakeup
			mac_misc_2_magic_sleep_n                => CONNECTED_TO_mac_misc_2_magic_sleep_n,                --                            .magic_sleep_n
			mac_misc_2_tx_crc_fwd                   => CONNECTED_TO_mac_misc_2_tx_crc_fwd,                   --                            .tx_crc_fwd
			tse_ref_clk                             => CONNECTED_TO_tse_ref_clk,                             --                     tse_ref.clk
			status_led_connection_0_crs             => CONNECTED_TO_status_led_connection_0_crs,             --     status_led_connection_0.crs
			status_led_connection_0_link            => CONNECTED_TO_status_led_connection_0_link,            --                            .link
			status_led_connection_0_panel_link      => CONNECTED_TO_status_led_connection_0_panel_link,      --                            .panel_link
			status_led_connection_0_col             => CONNECTED_TO_status_led_connection_0_col,             --                            .col
			status_led_connection_0_an              => CONNECTED_TO_status_led_connection_0_an,              --                            .an
			status_led_connection_0_char_err        => CONNECTED_TO_status_led_connection_0_char_err,        --                            .char_err
			status_led_connection_0_disp_err        => CONNECTED_TO_status_led_connection_0_disp_err,        --                            .disp_err
			tx_analogreset_0_tx_analogreset         => CONNECTED_TO_tx_analogreset_0_tx_analogreset,         --            tx_analogreset_0.tx_analogreset
			tx_digitalreset_0_tx_digitalreset       => CONNECTED_TO_tx_digitalreset_0_tx_digitalreset,       --           tx_digitalreset_0.tx_digitalreset
			rx_analogreset_0_rx_analogreset         => CONNECTED_TO_rx_analogreset_0_rx_analogreset,         --            rx_analogreset_0.rx_analogreset
			rx_digitalreset_0_rx_digitalreset       => CONNECTED_TO_rx_digitalreset_0_rx_digitalreset,       --           rx_digitalreset_0.rx_digitalreset
			tx_cal_busy_0_tx_cal_busy               => CONNECTED_TO_tx_cal_busy_0_tx_cal_busy,               --               tx_cal_busy_0.tx_cal_busy
			rx_cal_busy_0_rx_cal_busy               => CONNECTED_TO_rx_cal_busy_0_rx_cal_busy,               --               rx_cal_busy_0.rx_cal_busy
			tse_rx_cdr_refclk_0_clk                 => CONNECTED_TO_tse_rx_cdr_refclk_0_clk,                 --         tse_rx_cdr_refclk_0.clk
			rx_set_locktodata_0_rx_set_locktodata   => CONNECTED_TO_rx_set_locktodata_0_rx_set_locktodata,   --         rx_set_locktodata_0.rx_set_locktodata
			rx_set_locktoref_0_rx_set_locktoref     => CONNECTED_TO_rx_set_locktoref_0_rx_set_locktoref,     --          rx_set_locktoref_0.rx_set_locktoref
			rx_is_lockedtoref_0_rx_is_lockedtoref   => CONNECTED_TO_rx_is_lockedtoref_0_rx_is_lockedtoref,   --         rx_is_lockedtoref_0.rx_is_lockedtoref
			rx_is_lockedtodata_0_rx_is_lockedtodata => CONNECTED_TO_rx_is_lockedtodata_0_rx_is_lockedtodata, --        rx_is_lockedtodata_0.rx_is_lockedtodata
			sgmii_1_rxp                             => CONNECTED_TO_sgmii_1_rxp,                             --                     sgmii_1.rxp
			sgmii_1_txp                             => CONNECTED_TO_sgmii_1_txp,                             --                            .txp
			serdes_control_connection_0_export      => CONNECTED_TO_serdes_control_connection_0_export,      -- serdes_control_connection_0.export
			status_led_connection_1_crs             => CONNECTED_TO_status_led_connection_1_crs,             --     status_led_connection_1.crs
			status_led_connection_1_link            => CONNECTED_TO_status_led_connection_1_link,            --                            .link
			status_led_connection_1_panel_link      => CONNECTED_TO_status_led_connection_1_panel_link,      --                            .panel_link
			status_led_connection_1_col             => CONNECTED_TO_status_led_connection_1_col,             --                            .col
			status_led_connection_1_an              => CONNECTED_TO_status_led_connection_1_an,              --                            .an
			status_led_connection_1_char_err        => CONNECTED_TO_status_led_connection_1_char_err,        --                            .char_err
			status_led_connection_1_disp_err        => CONNECTED_TO_status_led_connection_1_disp_err,        --                            .disp_err
			tx_analogreset_1_tx_analogreset         => CONNECTED_TO_tx_analogreset_1_tx_analogreset,         --            tx_analogreset_1.tx_analogreset
			tx_digitalreset_1_tx_digitalreset       => CONNECTED_TO_tx_digitalreset_1_tx_digitalreset,       --           tx_digitalreset_1.tx_digitalreset
			rx_analogreset_1_rx_analogreset         => CONNECTED_TO_rx_analogreset_1_rx_analogreset,         --            rx_analogreset_1.rx_analogreset
			rx_digitalreset_1_rx_digitalreset       => CONNECTED_TO_rx_digitalreset_1_rx_digitalreset,       --           rx_digitalreset_1.rx_digitalreset
			tx_cal_busy_1_tx_cal_busy               => CONNECTED_TO_tx_cal_busy_1_tx_cal_busy,               --               tx_cal_busy_1.tx_cal_busy
			rx_cal_busy_1_rx_cal_busy               => CONNECTED_TO_rx_cal_busy_1_rx_cal_busy,               --               rx_cal_busy_1.rx_cal_busy
			tse_rx_cdr_refclk_1_clk                 => CONNECTED_TO_tse_rx_cdr_refclk_1_clk,                 --         tse_rx_cdr_refclk_1.clk
			rx_set_locktodata_1_rx_set_locktodata   => CONNECTED_TO_rx_set_locktodata_1_rx_set_locktodata,   --         rx_set_locktodata_1.rx_set_locktodata
			rx_set_locktoref_1_rx_set_locktoref     => CONNECTED_TO_rx_set_locktoref_1_rx_set_locktoref,     --          rx_set_locktoref_1.rx_set_locktoref
			rx_is_lockedtoref_1_rx_is_lockedtoref   => CONNECTED_TO_rx_is_lockedtoref_1_rx_is_lockedtoref,   --         rx_is_lockedtoref_1.rx_is_lockedtoref
			rx_is_lockedtodata_1_rx_is_lockedtodata => CONNECTED_TO_rx_is_lockedtodata_1_rx_is_lockedtodata, --        rx_is_lockedtodata_1.rx_is_lockedtodata
			sgmii_2_rxp                             => CONNECTED_TO_sgmii_2_rxp,                             --                     sgmii_2.rxp
			sgmii_2_txp                             => CONNECTED_TO_sgmii_2_txp,                             --                            .txp
			serdes_control_connection_1_export      => CONNECTED_TO_serdes_control_connection_1_export,      -- serdes_control_connection_1.export
			tse_tx_serial_clk_2_clk                 => CONNECTED_TO_tse_tx_serial_clk_2_clk,                 --         tse_tx_serial_clk_2.clk
			tse_rx_cdr_refclk_2_clk                 => CONNECTED_TO_tse_rx_cdr_refclk_2_clk,                 --         tse_rx_cdr_refclk_2.clk
			sgmii_3_rxp                             => CONNECTED_TO_sgmii_3_rxp,                             --                     sgmii_3.rxp
			sgmii_3_txp                             => CONNECTED_TO_sgmii_3_txp,                             --                            .txp
			tse_tx_serial_clk_3_clk                 => CONNECTED_TO_tse_tx_serial_clk_3_clk,                 --         tse_tx_serial_clk_3.clk
			tse_rx_cdr_refclk_3_clk                 => CONNECTED_TO_tse_rx_cdr_refclk_3_clk,                 --         tse_rx_cdr_refclk_3.clk
			sgmii_4_rxp                             => CONNECTED_TO_sgmii_4_rxp,                             --                     sgmii_4.rxp
			sgmii_4_txp                             => CONNECTED_TO_sgmii_4_txp,                             --                            .txp
			xcvr_pll_powerdown_pll_powerdown        => CONNECTED_TO_xcvr_pll_powerdown_pll_powerdown,        --          xcvr_pll_powerdown.pll_powerdown
			xcvr_pll_refclk_clk                     => CONNECTED_TO_xcvr_pll_refclk_clk                      --             xcvr_pll_refclk.clk
		);

