	component tx_2 is
		generic (
			COUNT_PREPARE_WAIT_VAL : integer := 80
		);
		port (
			amm_addr          : out std_logic_vector(24 downto 0);                     -- address
			amm_readdata      : in  std_logic_vector(255 downto 0) := (others => 'X'); -- readdata
			amm_writedata     : out std_logic_vector(255 downto 0);                    -- writedata
			amm_read          : out std_logic;                                         -- read
			amm_write         : out std_logic;                                         -- write
			amm_byteenable    : out std_logic_vector(31 downto 0);                     -- byteenable
			amm_burstcount    : out std_logic_vector(6 downto 0);                      -- burstcount
			amm_readdatavalid : in  std_logic                      := 'X';             -- readdatavalid
			amm_ready         : in  std_logic                      := 'X';             -- waitrequest
			clk_50            : in  std_logic                      := 'X';             -- clk
			rst_n             : in  std_logic                      := 'X';             -- reset
			avalon_clk        : in  std_logic                      := 'X';             -- clk
			clk_original      : in  std_logic                      := 'X';             -- clk
			rst               : in  std_logic                      := 'X';             -- reset
			ff_tx_data        : out std_logic_vector(7 downto 0);                      -- data
			ff_tx_eop         : out std_logic;                                         -- endofpacket
			ff_tx_err         : out std_logic;                                         -- error
			ff_tx_rdy         : in  std_logic                      := 'X';             -- ready
			ff_tx_sop         : out std_logic;                                         -- startofpacket
			ff_tx_wren        : out std_logic;                                         -- valid
			avalon_reset      : in  std_logic                      := 'X';             -- reset
			start_ram_addr    : in  std_logic_vector(24 downto 0)  := (others => 'X'); -- start_ram_addr
			cmd_send          : in  std_logic                      := 'X'              -- cmd_send
		);
	end component tx_2;

	u0 : component tx_2
		generic map (
			COUNT_PREPARE_WAIT_VAL => INTEGER_VALUE_FOR_COUNT_PREPARE_WAIT_VAL
		)
		port map (
			amm_addr          => CONNECTED_TO_amm_addr,          --           avalon_master.address
			amm_readdata      => CONNECTED_TO_amm_readdata,      --                        .readdata
			amm_writedata     => CONNECTED_TO_amm_writedata,     --                        .writedata
			amm_read          => CONNECTED_TO_amm_read,          --                        .read
			amm_write         => CONNECTED_TO_amm_write,         --                        .write
			amm_byteenable    => CONNECTED_TO_amm_byteenable,    --                        .byteenable
			amm_burstcount    => CONNECTED_TO_amm_burstcount,    --                        .burstcount
			amm_readdatavalid => CONNECTED_TO_amm_readdatavalid, --                        .readdatavalid
			amm_ready         => CONNECTED_TO_amm_ready,         --                        .waitrequest
			clk_50            => CONNECTED_TO_clk_50,            --                clock_50.clk
			rst_n             => CONNECTED_TO_rst_n,             --             reset_board.reset
			avalon_clk        => CONNECTED_TO_avalon_clk,        --               clock_ddr.clk
			clk_original      => CONNECTED_TO_clk_original,      --               clock_tse.clk
			rst               => CONNECTED_TO_rst,               --                   reset.reset
			ff_tx_data        => CONNECTED_TO_ff_tx_data,        -- avalon_streaming_source.data
			ff_tx_eop         => CONNECTED_TO_ff_tx_eop,         --                        .endofpacket
			ff_tx_err         => CONNECTED_TO_ff_tx_err,         --                        .error
			ff_tx_rdy         => CONNECTED_TO_ff_tx_rdy,         --                        .ready
			ff_tx_sop         => CONNECTED_TO_ff_tx_sop,         --                        .startofpacket
			ff_tx_wren        => CONNECTED_TO_ff_tx_wren,        --                        .valid
			avalon_reset      => CONNECTED_TO_avalon_reset,      --               reset_ddr.reset
			start_ram_addr    => CONNECTED_TO_start_ram_addr,    --                 control.start_ram_addr
			cmd_send          => CONNECTED_TO_cmd_send           --                        .cmd_send
		);

