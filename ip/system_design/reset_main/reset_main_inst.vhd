	component reset_main is
		port (
			in_reset  : in  std_logic := 'X'; -- reset
			out_reset : out std_logic         -- reset
		);
	end component reset_main;

	u0 : component reset_main
		port map (
			in_reset  => CONNECTED_TO_in_reset,  --  in_reset.reset
			out_reset => CONNECTED_TO_out_reset  -- out_reset.reset
		);

