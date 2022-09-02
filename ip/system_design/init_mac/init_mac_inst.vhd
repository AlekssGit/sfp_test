	component init_mac is
		port (
			clk        : in  std_logic                     := 'X';             -- clk
			reset      : in  std_logic                     := 'X';             -- reset
			ADR_O      : out std_logic_vector(9 downto 0);                     -- address
			DAT_I      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			DAT_O      : out std_logic_vector(31 downto 0);                    -- writedata
			RD         : out std_logic;                                        -- read
			WR         : out std_logic;                                        -- write
			BUSY       : in  std_logic                     := 'X';             -- waitrequest
			mac_inited : out std_logic                                         -- mac_inited
		);
	end component init_mac;

	u0 : component init_mac
		port map (
			clk        => CONNECTED_TO_clk,        --         clock.clk
			reset      => CONNECTED_TO_reset,      --         reset.reset
			ADR_O      => CONNECTED_TO_ADR_O,      -- avalon_master.address
			DAT_I      => CONNECTED_TO_DAT_I,      --              .readdata
			DAT_O      => CONNECTED_TO_DAT_O,      --              .writedata
			RD         => CONNECTED_TO_RD,         --              .read
			WR         => CONNECTED_TO_WR,         --              .write
			BUSY       => CONNECTED_TO_BUSY,       --              .waitrequest
			mac_inited => CONNECTED_TO_mac_inited  --    mac_inited.mac_inited
		);

