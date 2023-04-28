	component ed_sim_global_reset_n_splitter is
		port (
			sig_input    : in  std_logic := 'X'; -- reset_n
			sig_output_0 : out std_logic         -- reset_n
		);
	end component ed_sim_global_reset_n_splitter;

	u0 : component ed_sim_global_reset_n_splitter
		port map (
			sig_input    => CONNECTED_TO_sig_input,    --    sig_input_if.reset_n
			sig_output_0 => CONNECTED_TO_sig_output_0  -- sig_output_if_0.reset_n
		);

