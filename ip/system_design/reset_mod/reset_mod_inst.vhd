	component reset_mod is
		generic (
			TIME_RESET_PHY : integer := 500;
			TIME_WORK_PHY  : integer := 300
		);
		port (
			clk       : in  std_logic := 'X'; -- clk
			rst_n     : in  std_logic := 'X'; -- reset_n
			reset     : out std_logic;        -- reset
			reset_phy : out std_logic         -- reset
		);
	end component reset_mod;

	u0 : component reset_mod
		generic map (
			TIME_RESET_PHY => INTEGER_VALUE_FOR_TIME_RESET_PHY,
			TIME_WORK_PHY  => INTEGER_VALUE_FOR_TIME_WORK_PHY
		)
		port map (
			clk       => CONNECTED_TO_clk,       --      clock.clk
			rst_n     => CONNECTED_TO_rst_n,     --      reset.reset_n
			reset     => CONNECTED_TO_reset,     -- reset_main.reset
			reset_phy => CONNECTED_TO_reset_phy  --  reset_phy.reset
		);

