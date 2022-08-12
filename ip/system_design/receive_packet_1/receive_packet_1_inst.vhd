	component receive_packet_1 is
		port (
			ff_rx_data       : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			ff_rx_eop        : in  std_logic                     := 'X';             -- endofpacket
			ff_rx_rdy        : out std_logic;                                        -- ready
			ff_rx_sop        : in  std_logic                     := 'X';             -- startofpacket
			ff_rx_dval       : in  std_logic                     := 'X';             -- valid
			rx_err           : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- error
			ram_addr         : out std_logic_vector(9 downto 0);                     -- address
			ram_chipselect   : out std_logic;                                        -- chipselect
			ram_write        : out std_logic;                                        -- write
			ram_readdata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			ram_writedata    : out std_logic_vector(31 downto 0);                    -- writedata
			ram_byteenable   : out std_logic_vector(3 downto 0);                     -- byteenable
			clk_original     : in  std_logic                     := 'X';             -- clk
			rst              : in  std_logic                     := 'X';             -- reset
			rx_afull_data    : out std_logic_vector(1 downto 0);                     -- data
			rx_afull_valid   : out std_logic;                                        -- valid
			rx_afull_channel : out std_logic_vector(1 downto 0);                     -- channel
			fifo_status_clk  : in  std_logic                     := 'X'              -- clk
		);
	end component receive_packet_1;

	u0 : component receive_packet_1
		port map (
			ff_rx_data       => CONNECTED_TO_ff_rx_data,       -- avalon_streaming_sink.data
			ff_rx_eop        => CONNECTED_TO_ff_rx_eop,        --                      .endofpacket
			ff_rx_rdy        => CONNECTED_TO_ff_rx_rdy,        --                      .ready
			ff_rx_sop        => CONNECTED_TO_ff_rx_sop,        --                      .startofpacket
			ff_rx_dval       => CONNECTED_TO_ff_rx_dval,       --                      .valid
			rx_err           => CONNECTED_TO_rx_err,           --                      .error
			ram_addr         => CONNECTED_TO_ram_addr,         --         avalon_master.address
			ram_chipselect   => CONNECTED_TO_ram_chipselect,   --                      .chipselect
			ram_write        => CONNECTED_TO_ram_write,        --                      .write
			ram_readdata     => CONNECTED_TO_ram_readdata,     --                      .readdata
			ram_writedata    => CONNECTED_TO_ram_writedata,    --                      .writedata
			ram_byteenable   => CONNECTED_TO_ram_byteenable,   --                      .byteenable
			clk_original     => CONNECTED_TO_clk_original,     --                 clock.clk
			rst              => CONNECTED_TO_rst,              --                 reset.reset
			rx_afull_data    => CONNECTED_TO_rx_afull_data,    --           fifo_status.data
			rx_afull_valid   => CONNECTED_TO_rx_afull_valid,   --                      .valid
			rx_afull_channel => CONNECTED_TO_rx_afull_channel, --                      .channel
			fifo_status_clk  => CONNECTED_TO_fifo_status_clk   --       fifo_status_clk.clk
		);

