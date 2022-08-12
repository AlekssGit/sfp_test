	component send_packet_1 is
		port (
			clk_original   : in  std_logic                     := 'X';             -- clk
			rst            : in  std_logic                     := 'X';             -- reset
			ram_addr       : out std_logic_vector(9 downto 0);                     -- address
			ram_chipselect : out std_logic;                                        -- chipselect
			ram_write      : out std_logic;                                        -- write
			ram_readdata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			ram_writedata  : out std_logic_vector(31 downto 0);                    -- writedata
			ram_byteenable : out std_logic_vector(3 downto 0);                     -- byteenable
			ff_tx_data     : out std_logic_vector(7 downto 0);                     -- data
			ff_tx_eop      : out std_logic;                                        -- endofpacket
			ff_tx_err      : out std_logic;                                        -- error
			ff_tx_rdy      : in  std_logic                     := 'X';             -- ready
			ff_tx_sop      : out std_logic;                                        -- startofpacket
			ff_tx_wren     : out std_logic;                                        -- valid
			start_ram_addr : in  std_logic_vector(24 downto 0) := (others => 'X'); -- start_ram_addr
			cmd_send       : in  std_logic                     := 'X'              -- cmd_send
		);
	end component send_packet_1;

	u0 : component send_packet_1
		port map (
			clk_original   => CONNECTED_TO_clk_original,   --                   clock.clk
			rst            => CONNECTED_TO_rst,            --                   reset.reset
			ram_addr       => CONNECTED_TO_ram_addr,       --           avalon_master.address
			ram_chipselect => CONNECTED_TO_ram_chipselect, --                        .chipselect
			ram_write      => CONNECTED_TO_ram_write,      --                        .write
			ram_readdata   => CONNECTED_TO_ram_readdata,   --                        .readdata
			ram_writedata  => CONNECTED_TO_ram_writedata,  --                        .writedata
			ram_byteenable => CONNECTED_TO_ram_byteenable, --                        .byteenable
			ff_tx_data     => CONNECTED_TO_ff_tx_data,     -- avalon_streaming_source.data
			ff_tx_eop      => CONNECTED_TO_ff_tx_eop,      --                        .endofpacket
			ff_tx_err      => CONNECTED_TO_ff_tx_err,      --                        .error
			ff_tx_rdy      => CONNECTED_TO_ff_tx_rdy,      --                        .ready
			ff_tx_sop      => CONNECTED_TO_ff_tx_sop,      --                        .startofpacket
			ff_tx_wren     => CONNECTED_TO_ff_tx_wren,     --                        .valid
			start_ram_addr => CONNECTED_TO_start_ram_addr, --                 control.start_ram_addr
			cmd_send       => CONNECTED_TO_cmd_send        --                        .cmd_send
		);

