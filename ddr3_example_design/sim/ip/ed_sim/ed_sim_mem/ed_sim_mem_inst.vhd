	component ed_sim_mem is
		port (
			mem_ck      : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_ck
			mem_ck_n    : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_ck_n
			mem_a       : in    std_logic_vector(14 downto 0) := (others => 'X'); -- mem_a
			mem_ba      : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- mem_ba
			mem_cke     : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_cke
			mem_cs_n    : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_cs_n
			mem_odt     : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_odt
			mem_reset_n : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_reset_n
			mem_we_n    : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_we_n
			mem_ras_n   : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_ras_n
			mem_cas_n   : in    std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_cas_n
			mem_dqs     : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs
			mem_dqs_n   : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs_n
			mem_dq      : inout std_logic_vector(39 downto 0) := (others => 'X'); -- mem_dq
			mem_dm      : in    std_logic_vector(4 downto 0)  := (others => 'X')  -- mem_dm
		);
	end component ed_sim_mem;

	u0 : component ed_sim_mem
		port map (
			mem_ck      => CONNECTED_TO_mem_ck,      -- mem.mem_ck
			mem_ck_n    => CONNECTED_TO_mem_ck_n,    --    .mem_ck_n
			mem_a       => CONNECTED_TO_mem_a,       --    .mem_a
			mem_ba      => CONNECTED_TO_mem_ba,      --    .mem_ba
			mem_cke     => CONNECTED_TO_mem_cke,     --    .mem_cke
			mem_cs_n    => CONNECTED_TO_mem_cs_n,    --    .mem_cs_n
			mem_odt     => CONNECTED_TO_mem_odt,     --    .mem_odt
			mem_reset_n => CONNECTED_TO_mem_reset_n, --    .mem_reset_n
			mem_we_n    => CONNECTED_TO_mem_we_n,    --    .mem_we_n
			mem_ras_n   => CONNECTED_TO_mem_ras_n,   --    .mem_ras_n
			mem_cas_n   => CONNECTED_TO_mem_cas_n,   --    .mem_cas_n
			mem_dqs     => CONNECTED_TO_mem_dqs,     --    .mem_dqs
			mem_dqs_n   => CONNECTED_TO_mem_dqs_n,   --    .mem_dqs_n
			mem_dq      => CONNECTED_TO_mem_dq,      --    .mem_dq
			mem_dm      => CONNECTED_TO_mem_dm       --    .mem_dm
		);

