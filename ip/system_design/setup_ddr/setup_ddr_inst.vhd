	component setup_ddr is
		port (
			amm_addr                 : out std_logic_vector(24 downto 0);                     -- address
			amm_readdata             : in  std_logic_vector(255 downto 0) := (others => 'X'); -- readdata
			amm_writedata            : out std_logic_vector(255 downto 0);                    -- writedata
			amm_read                 : out std_logic;                                         -- read
			amm_write                : out std_logic;                                         -- write
			amm_byteenable           : out std_logic_vector(31 downto 0);                     -- byteenable
			amm_burstcount           : out std_logic_vector(6 downto 0);                      -- burstcount
			amm_readdatavalid        : in  std_logic                      := 'X';             -- readdatavalid
			amm_ready                : in  std_logic                      := 'X';             -- waitrequest
			setup_done               : out std_logic;                                         -- setup_done
			local_cal_success_avalon : in  std_logic                      := 'X';             -- local_cal_success
			local_cal_fail_avalon    : in  std_logic                      := 'X';             -- local_cal_fail
			ram_ready                : in  std_logic                      := 'X';             -- ram_ready
			clk                      : in  std_logic                      := 'X';             -- clk
			avalon_clk               : in  std_logic                      := 'X';             -- clk
			clk_50                   : in  std_logic                      := 'X';             -- clk
			rst_n                    : in  std_logic                      := 'X';             -- reset
			avalon_reset             : in  std_logic                      := 'X';             -- reset
			reset                    : in  std_logic                      := 'X';             -- reset
			reset_local_cal_success  : out std_logic;                                         -- cal_success
			ddr_local_cal_success    : out std_logic;                                         -- local_cal_success
			ddr_local_cal_fail       : out std_logic;                                         -- local_cal_fail
			system_main_reset        : out std_logic;                                         -- main_reset
			ddr_avalon_rst           : out std_logic;                                         -- ddr_avalon_reset
			board_reset              : out std_logic                                          -- board_reset
		);
	end component setup_ddr;

	u0 : component setup_ddr
		port map (
			amm_addr                 => CONNECTED_TO_amm_addr,                 --      avalon_master.address
			amm_readdata             => CONNECTED_TO_amm_readdata,             --                   .readdata
			amm_writedata            => CONNECTED_TO_amm_writedata,            --                   .writedata
			amm_read                 => CONNECTED_TO_amm_read,                 --                   .read
			amm_write                => CONNECTED_TO_amm_write,                --                   .write
			amm_byteenable           => CONNECTED_TO_amm_byteenable,           --                   .byteenable
			amm_burstcount           => CONNECTED_TO_amm_burstcount,           --                   .burstcount
			amm_readdatavalid        => CONNECTED_TO_amm_readdatavalid,        --                   .readdatavalid
			amm_ready                => CONNECTED_TO_amm_ready,                --                   .waitrequest
			setup_done               => CONNECTED_TO_setup_done,               --              setup.setup_done
			local_cal_success_avalon => CONNECTED_TO_local_cal_success_avalon, --         ddr_status.local_cal_success
			local_cal_fail_avalon    => CONNECTED_TO_local_cal_fail_avalon,    --                   .local_cal_fail
			ram_ready                => CONNECTED_TO_ram_ready,                --          ddr_ready.ram_ready
			clk                      => CONNECTED_TO_clk,                      --    clock_125_tx_rx.clk
			avalon_clk               => CONNECTED_TO_avalon_clk,               --       clock_avalon.clk
			clk_50                   => CONNECTED_TO_clk_50,                   --           clock_50.clk
			rst_n                    => CONNECTED_TO_rst_n,                    --        reset_board.reset
			avalon_reset             => CONNECTED_TO_avalon_reset,             --       reset_avalon.reset
			reset                    => CONNECTED_TO_reset,                    --       reset_module.reset
			reset_local_cal_success  => CONNECTED_TO_reset_local_cal_success,  --        cal_success.cal_success
			ddr_local_cal_success    => CONNECTED_TO_ddr_local_cal_success,    --     ddr_status_out.local_cal_success
			ddr_local_cal_fail       => CONNECTED_TO_ddr_local_cal_fail,       --                   .local_cal_fail
			system_main_reset        => CONNECTED_TO_system_main_reset,        -- resets_information.main_reset
			ddr_avalon_rst           => CONNECTED_TO_ddr_avalon_rst,           --                   .ddr_avalon_reset
			board_reset              => CONNECTED_TO_board_reset               --                   .board_reset
		);

