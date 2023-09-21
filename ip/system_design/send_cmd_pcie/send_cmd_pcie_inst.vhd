	component send_cmd_pcie is
		port (
			clk                   : in  std_logic                     := 'X';             -- clk
			rst_n                 : in  std_logic                     := 'X';             -- reset_n
			avalon_mm_read        : in  std_logic                     := 'X';             -- read
			avalon_mm_write       : in  std_logic                     := 'X';             -- write
			avalon_mm_addr        : in  std_logic_vector(15 downto 0) := (others => 'X'); -- address
			avalon_mm_write_data  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avalon_mm_read_data   : out std_logic_vector(31 downto 0);                    -- readdata
			avalon_mm_rd_valid    : out std_logic;                                        -- readdatavalid
			start_ram_addr        : out std_logic_vector(5 downto 0);                     -- start_ram_addr
			send_cmd              : out std_logic;                                        -- signal
			send_ch_2_timer       : out std_logic_vector(31 downto 0);                    -- ch_2_timer
			ddr_local_cal_success : in  std_logic                     := 'X';             -- local_cal_success
			ddr_local_cal_fail    : in  std_logic                     := 'X';             -- local_cal_fail
			ddr_setup_done        : in  std_logic                     := 'X';             -- setup_done
			system_main_reset     : in  std_logic                     := 'X';             -- main_reset
			ddr_avalon_rst        : in  std_logic                     := 'X';             -- ddr_avalon_reset
			board_reset           : in  std_logic                     := 'X';             -- board_reset
			ddr_setup_cmd         : out std_logic                                         -- ddr_setup_cmd
		);
	end component send_cmd_pcie;

	u0 : component send_cmd_pcie
		port map (
			clk                   => CONNECTED_TO_clk,                   --              clock.clk
			rst_n                 => CONNECTED_TO_rst_n,                 --              reset.reset_n
			avalon_mm_read        => CONNECTED_TO_avalon_mm_read,        --       avalon_slave.read
			avalon_mm_write       => CONNECTED_TO_avalon_mm_write,       --                   .write
			avalon_mm_addr        => CONNECTED_TO_avalon_mm_addr,        --                   .address
			avalon_mm_write_data  => CONNECTED_TO_avalon_mm_write_data,  --                   .writedata
			avalon_mm_read_data   => CONNECTED_TO_avalon_mm_read_data,   --                   .readdata
			avalon_mm_rd_valid    => CONNECTED_TO_avalon_mm_rd_valid,    --                   .readdatavalid
			start_ram_addr        => CONNECTED_TO_start_ram_addr,        --       send_control.start_ram_addr
			send_cmd              => CONNECTED_TO_send_cmd,              --                   .signal
			send_ch_2_timer       => CONNECTED_TO_send_ch_2_timer,       --                   .ch_2_timer
			ddr_local_cal_success => CONNECTED_TO_ddr_local_cal_success, --         ddr_status.local_cal_success
			ddr_local_cal_fail    => CONNECTED_TO_ddr_local_cal_fail,    --                   .local_cal_fail
			ddr_setup_done        => CONNECTED_TO_ddr_setup_done,        --     ddr_setup_done.setup_done
			system_main_reset     => CONNECTED_TO_system_main_reset,     -- resets_information.main_reset
			ddr_avalon_rst        => CONNECTED_TO_ddr_avalon_rst,        --                   .ddr_avalon_reset
			board_reset           => CONNECTED_TO_board_reset,           --                   .board_reset
			ddr_setup_cmd         => CONNECTED_TO_ddr_setup_cmd          --      ddr_setup_cmd.ddr_setup_cmd
		);

