	component rx_2 is
		port (
			ff_rx_data        : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- data
			ff_rx_eop         : in  std_logic                      := 'X';             -- endofpacket
			ff_rx_rdy         : out std_logic;                                         -- ready
			ff_rx_sop         : in  std_logic                      := 'X';             -- startofpacket
			ff_rx_dval        : in  std_logic                      := 'X';             -- valid
			rx_err            : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- error
			amm_addr          : out std_logic_vector(24 downto 0);                     -- address
			amm_readdata      : in  std_logic_vector(255 downto 0) := (others => 'X'); -- readdata
			amm_writedata     : out std_logic_vector(255 downto 0);                    -- writedata
			amm_read          : out std_logic;                                         -- read
			amm_write         : out std_logic;                                         -- write
			amm_byteenable    : out std_logic_vector(31 downto 0);                     -- byteenable
			amm_burstcount    : out std_logic_vector(6 downto 0);                      -- burstcount
			amm_readdatavalid : in  std_logic                      := 'X';             -- readdatavalid
			amm_ready         : in  std_logic                      := 'X';             -- waitrequest
			rx_afull_data     : out std_logic_vector(1 downto 0);                      -- data
			rx_afull_valid    : out std_logic;                                         -- valid
			rx_afull_channel  : out std_logic;                                         -- channel
			size_received     : out std_logic_vector(11 downto 0);                     -- size_received
			data_saved        : out std_logic;                                         -- data_saved
			rst               : in  std_logic                      := 'X';             -- reset
			clk_original      : in  std_logic                      := 'X';             -- clk
			rst_n             : in  std_logic                      := 'X';             -- reset
			avalon_clk        : in  std_logic                      := 'X';             -- clk
			avalon_reset      : in  std_logic                      := 'X';             -- reset
			fifo_status_clk   : in  std_logic                      := 'X'              -- clk
		);
	end component rx_2;

	u0 : component rx_2
		port map (
			ff_rx_data        => CONNECTED_TO_ff_rx_data,        -- avalon_streaming_sink.data
			ff_rx_eop         => CONNECTED_TO_ff_rx_eop,         --                      .endofpacket
			ff_rx_rdy         => CONNECTED_TO_ff_rx_rdy,         --                      .ready
			ff_rx_sop         => CONNECTED_TO_ff_rx_sop,         --                      .startofpacket
			ff_rx_dval        => CONNECTED_TO_ff_rx_dval,        --                      .valid
			rx_err            => CONNECTED_TO_rx_err,            --                      .error
			amm_addr          => CONNECTED_TO_amm_addr,          --         avalon_master.address
			amm_readdata      => CONNECTED_TO_amm_readdata,      --                      .readdata
			amm_writedata     => CONNECTED_TO_amm_writedata,     --                      .writedata
			amm_read          => CONNECTED_TO_amm_read,          --                      .read
			amm_write         => CONNECTED_TO_amm_write,         --                      .write
			amm_byteenable    => CONNECTED_TO_amm_byteenable,    --                      .byteenable
			amm_burstcount    => CONNECTED_TO_amm_burstcount,    --                      .burstcount
			amm_readdatavalid => CONNECTED_TO_amm_readdatavalid, --                      .readdatavalid
			amm_ready         => CONNECTED_TO_amm_ready,         --                      .waitrequest
			rx_afull_data     => CONNECTED_TO_rx_afull_data,     --           fifo_status.data
			rx_afull_valid    => CONNECTED_TO_rx_afull_valid,    --                      .valid
			rx_afull_channel  => CONNECTED_TO_rx_afull_channel,  --                      .channel
			size_received     => CONNECTED_TO_size_received,     --            rx_signals.size_received
			data_saved        => CONNECTED_TO_data_saved,        --                      .data_saved
			rst               => CONNECTED_TO_rst,               --                 reset.reset
			clk_original      => CONNECTED_TO_clk_original,      --             clock_tse.clk
			rst_n             => CONNECTED_TO_rst_n,             --           reset_board.reset
			avalon_clk        => CONNECTED_TO_avalon_clk,        --             clock_ddr.clk
			avalon_reset      => CONNECTED_TO_avalon_reset,      --             reset_ddr.reset
			fifo_status_clk   => CONNECTED_TO_fifo_status_clk    --       fifo_status_clk.clk
		);

