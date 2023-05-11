	component system_design is
		generic (
			setup_ddr_test : boolean := false
		);
		port (
			clock_50_clk                            : out   std_logic;                                        -- clk
			ddr_avalon_clk                          : out   std_logic;                                        -- clk
			ddr3_global_reset_n_reset_n             : in    std_logic                     := 'X';             -- reset_n
			ddr3_clock_clk                          : in    std_logic                     := 'X';             -- clk
			ddr3_oct_oct_rzqin                      : in    std_logic                     := 'X';             -- oct_rzqin
			ddr3_mem_mem_ck                         : out   std_logic_vector(0 downto 0);                     -- mem_ck
			ddr3_mem_mem_ck_n                       : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			ddr3_mem_mem_a                          : out   std_logic_vector(14 downto 0);                    -- mem_a
			ddr3_mem_mem_ba                         : out   std_logic_vector(2 downto 0);                     -- mem_ba
			ddr3_mem_mem_cke                        : out   std_logic_vector(0 downto 0);                     -- mem_cke
			ddr3_mem_mem_cs_n                       : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			ddr3_mem_mem_odt                        : out   std_logic_vector(0 downto 0);                     -- mem_odt
			ddr3_mem_mem_reset_n                    : out   std_logic_vector(0 downto 0);                     -- mem_reset_n
			ddr3_mem_mem_we_n                       : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			ddr3_mem_mem_ras_n                      : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			ddr3_mem_mem_cas_n                      : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			ddr3_mem_mem_dqs                        : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs
			ddr3_mem_mem_dqs_n                      : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs_n
			ddr3_mem_mem_dq                         : inout std_logic_vector(39 downto 0) := (others => 'X'); -- mem_dq
			ddr3_mem_mem_dm                         : out   std_logic_vector(4 downto 0);                     -- mem_dm
			ddr_avalon_reset_reset                  : out   std_logic;                                        -- reset
			mac_inited_mac_inited                   : out   std_logic;                                        -- mac_inited
			pcie_refclk_clk                         : in    std_logic                     := 'X';             -- clk
			pcie_npor_npor                          : in    std_logic                     := 'X';             -- npor
			pcie_npor_pin_perst                     : in    std_logic                     := 'X';             -- pin_perst
			pcie_hip_serial_rx_in0                  : in    std_logic                     := 'X';             -- rx_in0
			pcie_hip_serial_rx_in1                  : in    std_logic                     := 'X';             -- rx_in1
			pcie_hip_serial_rx_in2                  : in    std_logic                     := 'X';             -- rx_in2
			pcie_hip_serial_rx_in3                  : in    std_logic                     := 'X';             -- rx_in3
			pcie_hip_serial_tx_out0                 : out   std_logic;                                        -- tx_out0
			pcie_hip_serial_tx_out1                 : out   std_logic;                                        -- tx_out1
			pcie_hip_serial_tx_out2                 : out   std_logic;                                        -- tx_out2
			pcie_hip_serial_tx_out3                 : out   std_logic;                                        -- tx_out3
			pll_refclk_clk                          : in    std_logic                     := 'X';             -- clk
			receive_packet_1_data_saved_data_saved  : out   std_logic;                                        -- data_saved
			receive_packet_2_data_saved_data_saved  : out   std_logic;                                        -- data_saved
			reset_main_out_reset                    : out   std_logic;                                        -- reset
			reset_mod_clock_clk                     : in    std_logic                     := 'X';             -- clk
			reset_mod_reset_reset_n                 : in    std_logic                     := 'X';             -- reset_n
			reset_mod_reset_phy_reset               : out   std_logic;                                        -- reset
			pcie_send_control_start_ram_addr        : out   std_logic_vector(5 downto 0);                     -- start_ram_addr
			pcie_send_control_signal                : out   std_logic;                                        -- signal
			send_packet_1_control_start_ram_addr    : in    std_logic_vector(24 downto 0) := (others => 'X'); -- start_ram_addr
			send_packet_1_control_cmd_send          : in    std_logic                     := 'X';             -- cmd_send
			send_packet_2_control_start_ram_addr    : in    std_logic_vector(24 downto 0) := (others => 'X'); -- start_ram_addr
			send_packet_2_control_cmd_send          : in    std_logic                     := 'X';             -- cmd_send
			ddr_ready_ram_ready                     : in    std_logic                     := 'X';             -- ram_ready
			reset_board_reset                       : in    std_logic                     := 'X';             -- reset
			mem_cal_success_cal_success             : out   std_logic;                                        -- cal_success
			mac_misc_1_magic_wakeup                 : out   std_logic;                                        -- magic_wakeup
			mac_misc_1_magic_sleep_n                : in    std_logic                     := 'X';             -- magic_sleep_n
			mac_misc_1_tx_crc_fwd                   : in    std_logic                     := 'X';             -- tx_crc_fwd
			mac_mdio_mdc                            : out   std_logic;                                        -- mdc
			mac_mdio_mdio_in                        : in    std_logic                     := 'X';             -- mdio_in
			mac_mdio_mdio_out                       : out   std_logic;                                        -- mdio_out
			mac_mdio_mdio_oen                       : out   std_logic;                                        -- mdio_oen
			mac_misc_2_magic_wakeup                 : out   std_logic;                                        -- magic_wakeup
			mac_misc_2_magic_sleep_n                : in    std_logic                     := 'X';             -- magic_sleep_n
			mac_misc_2_tx_crc_fwd                   : in    std_logic                     := 'X';             -- tx_crc_fwd
			tse_ref_clk                             : in    std_logic                     := 'X';             -- clk
			status_led_connection_0_crs             : out   std_logic;                                        -- crs
			status_led_connection_0_link            : out   std_logic;                                        -- link
			status_led_connection_0_panel_link      : out   std_logic;                                        -- panel_link
			status_led_connection_0_col             : out   std_logic;                                        -- col
			status_led_connection_0_an              : out   std_logic;                                        -- an
			status_led_connection_0_char_err        : out   std_logic;                                        -- char_err
			status_led_connection_0_disp_err        : out   std_logic;                                        -- disp_err
			tx_analogreset_0_tx_analogreset         : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset_0_tx_digitalreset       : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset_0_rx_analogreset         : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset_0_rx_digitalreset       : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy_0_tx_cal_busy               : out   std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy_0_rx_cal_busy               : out   std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tse_rx_cdr_refclk_0_clk                 : in    std_logic                     := 'X';             -- clk
			rx_set_locktodata_0_rx_set_locktodata   : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref_0_rx_set_locktoref     : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref_0_rx_is_lockedtoref   : out   std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata_0_rx_is_lockedtodata : out   std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			sgmii_1_rxp                             : in    std_logic                     := 'X';             -- rxp
			sgmii_1_txp                             : out   std_logic;                                        -- txp
			serdes_control_connection_0_export      : out   std_logic;                                        -- export
			status_led_connection_1_crs             : out   std_logic;                                        -- crs
			status_led_connection_1_link            : out   std_logic;                                        -- link
			status_led_connection_1_panel_link      : out   std_logic;                                        -- panel_link
			status_led_connection_1_col             : out   std_logic;                                        -- col
			status_led_connection_1_an              : out   std_logic;                                        -- an
			status_led_connection_1_char_err        : out   std_logic;                                        -- char_err
			status_led_connection_1_disp_err        : out   std_logic;                                        -- disp_err
			tx_analogreset_1_tx_analogreset         : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_digitalreset_1_tx_digitalreset       : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- tx_digitalreset
			rx_analogreset_1_rx_analogreset         : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset_1_rx_digitalreset       : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_digitalreset
			tx_cal_busy_1_tx_cal_busy               : out   std_logic_vector(0 downto 0);                     -- tx_cal_busy
			rx_cal_busy_1_rx_cal_busy               : out   std_logic_vector(0 downto 0);                     -- rx_cal_busy
			tse_rx_cdr_refclk_1_clk                 : in    std_logic                     := 'X';             -- clk
			rx_set_locktodata_1_rx_set_locktodata   : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktodata
			rx_set_locktoref_1_rx_set_locktoref     : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- rx_set_locktoref
			rx_is_lockedtoref_1_rx_is_lockedtoref   : out   std_logic_vector(0 downto 0);                     -- rx_is_lockedtoref
			rx_is_lockedtodata_1_rx_is_lockedtodata : out   std_logic_vector(0 downto 0);                     -- rx_is_lockedtodata
			sgmii_2_rxp                             : in    std_logic                     := 'X';             -- rxp
			sgmii_2_txp                             : out   std_logic;                                        -- txp
			serdes_control_connection_1_export      : out   std_logic;                                        -- export
			tse_tx_serial_clk_2_clk                 : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			tse_rx_cdr_refclk_2_clk                 : in    std_logic                     := 'X';             -- clk
			sgmii_3_rxp                             : in    std_logic                     := 'X';             -- rxp
			sgmii_3_txp                             : out   std_logic;                                        -- txp
			tse_tx_serial_clk_3_clk                 : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- clk
			tse_rx_cdr_refclk_3_clk                 : in    std_logic                     := 'X';             -- clk
			sgmii_4_rxp                             : in    std_logic                     := 'X';             -- rxp
			sgmii_4_txp                             : out   std_logic;                                        -- txp
			xcvr_pll_powerdown_pll_powerdown        : in    std_logic                     := 'X';             -- pll_powerdown
			xcvr_pll_refclk_clk                     : in    std_logic                     := 'X'              -- clk
		);
	end component system_design;

	u0 : component system_design
		generic map (
			setup_ddr_test => BOOLEAN_VALUE_FOR_setup_ddr_test
		)
		port map (
			clock_50_clk                            => CONNECTED_TO_clock_50_clk,                            --                    clock_50.clk
			ddr_avalon_clk                          => CONNECTED_TO_ddr_avalon_clk,                          --                  ddr_avalon.clk
			ddr3_global_reset_n_reset_n             => CONNECTED_TO_ddr3_global_reset_n_reset_n,             --         ddr3_global_reset_n.reset_n
			ddr3_clock_clk                          => CONNECTED_TO_ddr3_clock_clk,                          --                  ddr3_clock.clk
			ddr3_oct_oct_rzqin                      => CONNECTED_TO_ddr3_oct_oct_rzqin,                      --                    ddr3_oct.oct_rzqin
			ddr3_mem_mem_ck                         => CONNECTED_TO_ddr3_mem_mem_ck,                         --                    ddr3_mem.mem_ck
			ddr3_mem_mem_ck_n                       => CONNECTED_TO_ddr3_mem_mem_ck_n,                       --                            .mem_ck_n
			ddr3_mem_mem_a                          => CONNECTED_TO_ddr3_mem_mem_a,                          --                            .mem_a
			ddr3_mem_mem_ba                         => CONNECTED_TO_ddr3_mem_mem_ba,                         --                            .mem_ba
			ddr3_mem_mem_cke                        => CONNECTED_TO_ddr3_mem_mem_cke,                        --                            .mem_cke
			ddr3_mem_mem_cs_n                       => CONNECTED_TO_ddr3_mem_mem_cs_n,                       --                            .mem_cs_n
			ddr3_mem_mem_odt                        => CONNECTED_TO_ddr3_mem_mem_odt,                        --                            .mem_odt
			ddr3_mem_mem_reset_n                    => CONNECTED_TO_ddr3_mem_mem_reset_n,                    --                            .mem_reset_n
			ddr3_mem_mem_we_n                       => CONNECTED_TO_ddr3_mem_mem_we_n,                       --                            .mem_we_n
			ddr3_mem_mem_ras_n                      => CONNECTED_TO_ddr3_mem_mem_ras_n,                      --                            .mem_ras_n
			ddr3_mem_mem_cas_n                      => CONNECTED_TO_ddr3_mem_mem_cas_n,                      --                            .mem_cas_n
			ddr3_mem_mem_dqs                        => CONNECTED_TO_ddr3_mem_mem_dqs,                        --                            .mem_dqs
			ddr3_mem_mem_dqs_n                      => CONNECTED_TO_ddr3_mem_mem_dqs_n,                      --                            .mem_dqs_n
			ddr3_mem_mem_dq                         => CONNECTED_TO_ddr3_mem_mem_dq,                         --                            .mem_dq
			ddr3_mem_mem_dm                         => CONNECTED_TO_ddr3_mem_mem_dm,                         --                            .mem_dm
			ddr_avalon_reset_reset                  => CONNECTED_TO_ddr_avalon_reset_reset,                  --            ddr_avalon_reset.reset
			mac_inited_mac_inited                   => CONNECTED_TO_mac_inited_mac_inited,                   --                  mac_inited.mac_inited
			pcie_refclk_clk                         => CONNECTED_TO_pcie_refclk_clk,                         --                 pcie_refclk.clk
			pcie_npor_npor                          => CONNECTED_TO_pcie_npor_npor,                          --                   pcie_npor.npor
			pcie_npor_pin_perst                     => CONNECTED_TO_pcie_npor_pin_perst,                     --                            .pin_perst
			pcie_hip_serial_rx_in0                  => CONNECTED_TO_pcie_hip_serial_rx_in0,                  --             pcie_hip_serial.rx_in0
			pcie_hip_serial_rx_in1                  => CONNECTED_TO_pcie_hip_serial_rx_in1,                  --                            .rx_in1
			pcie_hip_serial_rx_in2                  => CONNECTED_TO_pcie_hip_serial_rx_in2,                  --                            .rx_in2
			pcie_hip_serial_rx_in3                  => CONNECTED_TO_pcie_hip_serial_rx_in3,                  --                            .rx_in3
			pcie_hip_serial_tx_out0                 => CONNECTED_TO_pcie_hip_serial_tx_out0,                 --                            .tx_out0
			pcie_hip_serial_tx_out1                 => CONNECTED_TO_pcie_hip_serial_tx_out1,                 --                            .tx_out1
			pcie_hip_serial_tx_out2                 => CONNECTED_TO_pcie_hip_serial_tx_out2,                 --                            .tx_out2
			pcie_hip_serial_tx_out3                 => CONNECTED_TO_pcie_hip_serial_tx_out3,                 --                            .tx_out3
			pll_refclk_clk                          => CONNECTED_TO_pll_refclk_clk,                          --                  pll_refclk.clk
			receive_packet_1_data_saved_data_saved  => CONNECTED_TO_receive_packet_1_data_saved_data_saved,  -- receive_packet_1_data_saved.data_saved
			receive_packet_2_data_saved_data_saved  => CONNECTED_TO_receive_packet_2_data_saved_data_saved,  -- receive_packet_2_data_saved.data_saved
			reset_main_out_reset                    => CONNECTED_TO_reset_main_out_reset,                    --              reset_main_out.reset
			reset_mod_clock_clk                     => CONNECTED_TO_reset_mod_clock_clk,                     --             reset_mod_clock.clk
			reset_mod_reset_reset_n                 => CONNECTED_TO_reset_mod_reset_reset_n,                 --             reset_mod_reset.reset_n
			reset_mod_reset_phy_reset               => CONNECTED_TO_reset_mod_reset_phy_reset,               --         reset_mod_reset_phy.reset
			pcie_send_control_start_ram_addr        => CONNECTED_TO_pcie_send_control_start_ram_addr,        --           pcie_send_control.start_ram_addr
			pcie_send_control_signal                => CONNECTED_TO_pcie_send_control_signal,                --                            .signal
			send_packet_1_control_start_ram_addr    => CONNECTED_TO_send_packet_1_control_start_ram_addr,    --       send_packet_1_control.start_ram_addr
			send_packet_1_control_cmd_send          => CONNECTED_TO_send_packet_1_control_cmd_send,          --                            .cmd_send
			send_packet_2_control_start_ram_addr    => CONNECTED_TO_send_packet_2_control_start_ram_addr,    --       send_packet_2_control.start_ram_addr
			send_packet_2_control_cmd_send          => CONNECTED_TO_send_packet_2_control_cmd_send,          --                            .cmd_send
			ddr_ready_ram_ready                     => CONNECTED_TO_ddr_ready_ram_ready,                     --                   ddr_ready.ram_ready
			reset_board_reset                       => CONNECTED_TO_reset_board_reset,                       --                 reset_board.reset
			mem_cal_success_cal_success             => CONNECTED_TO_mem_cal_success_cal_success,             --             mem_cal_success.cal_success
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

