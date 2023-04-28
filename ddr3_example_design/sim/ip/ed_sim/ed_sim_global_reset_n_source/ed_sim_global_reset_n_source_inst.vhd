	component ed_sim_global_reset_n_source is
		generic (
			ASSERT_HIGH_RESET    : integer := 0;
			INITIAL_RESET_CYCLES : integer := 5
		);
		port (
			reset : out std_logic;        -- reset_n
			clk   : in  std_logic := 'X'  -- clk
		);
	end component ed_sim_global_reset_n_source;

	u0 : component ed_sim_global_reset_n_source
		generic map (
			ASSERT_HIGH_RESET    => INTEGER_VALUE_FOR_ASSERT_HIGH_RESET,
			INITIAL_RESET_CYCLES => INTEGER_VALUE_FOR_INITIAL_RESET_CYCLES
		)
		port map (
			reset => CONNECTED_TO_reset, -- reset.reset_n
			clk   => CONNECTED_TO_clk    --   clk.clk
		);

