	component send_cmd_pcie is
		port (
			clk                  : in  std_logic                     := 'X';             -- clk
			rst_n                : in  std_logic                     := 'X';             -- reset_n
			avalon_mm_read       : in  std_logic                     := 'X';             -- read
			avalon_mm_write      : in  std_logic                     := 'X';             -- write
			avalon_mm_addr       : in  std_logic_vector(15 downto 0) := (others => 'X'); -- address
			avalon_mm_write_data : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avalon_mm_read_data  : out std_logic_vector(31 downto 0);                    -- readdata
			avalon_mm_rd_valid   : out std_logic;                                        -- readdatavalid
			start_ram_addr       : out std_logic_vector(5 downto 0);                     -- start_ram_addr
			send_cmd             : out std_logic                                         -- signal
		);
	end component send_cmd_pcie;

	u0 : component send_cmd_pcie
		port map (
			clk                  => CONNECTED_TO_clk,                  --        clock.clk
			rst_n                => CONNECTED_TO_rst_n,                --        reset.reset_n
			avalon_mm_read       => CONNECTED_TO_avalon_mm_read,       -- avalon_slave.read
			avalon_mm_write      => CONNECTED_TO_avalon_mm_write,      --             .write
			avalon_mm_addr       => CONNECTED_TO_avalon_mm_addr,       --             .address
			avalon_mm_write_data => CONNECTED_TO_avalon_mm_write_data, --             .writedata
			avalon_mm_read_data  => CONNECTED_TO_avalon_mm_read_data,  --             .readdata
			avalon_mm_rd_valid   => CONNECTED_TO_avalon_mm_rd_valid,   --             .readdatavalid
			start_ram_addr       => CONNECTED_TO_start_ram_addr,       -- send_control.start_ram_addr
			send_cmd             => CONNECTED_TO_send_cmd              --             .signal
		);

