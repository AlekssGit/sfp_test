	component ed_synth is
		port (
			ddr3_pll_ref_clk_clk          : in    std_logic                     := 'X';             -- clk
			ddr3_oct_oct_rzqin            : in    std_logic                     := 'X';             -- oct_rzqin
			ddr3_mem_mem_ck               : out   std_logic_vector(0 downto 0);                     -- mem_ck
			ddr3_mem_mem_ck_n             : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			ddr3_mem_mem_a                : out   std_logic_vector(14 downto 0);                    -- mem_a
			ddr3_mem_mem_ba               : out   std_logic_vector(2 downto 0);                     -- mem_ba
			ddr3_mem_mem_cke              : out   std_logic_vector(0 downto 0);                     -- mem_cke
			ddr3_mem_mem_cs_n             : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			ddr3_mem_mem_odt              : out   std_logic_vector(0 downto 0);                     -- mem_odt
			ddr3_mem_mem_reset_n          : out   std_logic_vector(0 downto 0);                     -- mem_reset_n
			ddr3_mem_mem_we_n             : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			ddr3_mem_mem_ras_n            : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			ddr3_mem_mem_cas_n            : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			ddr3_mem_mem_dqs              : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs
			ddr3_mem_mem_dqs_n            : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs_n
			ddr3_mem_mem_dq               : inout std_logic_vector(39 downto 0) := (others => 'X'); -- mem_dq
			ddr3_mem_mem_dm               : out   std_logic_vector(4 downto 0);                     -- mem_dm
			ddr3_status_local_cal_success : out   std_logic;                                        -- local_cal_success
			ddr3_status_local_cal_fail    : out   std_logic;                                        -- local_cal_fail
			global_reset_reset_n          : in    std_logic                     := 'X';             -- reset_n
			ddr3_tg_0_traffic_gen_pass    : out   std_logic;                                        -- traffic_gen_pass
			ddr3_tg_0_traffic_gen_fail    : out   std_logic;                                        -- traffic_gen_fail
			ddr3_tg_0_traffic_gen_timeout : out   std_logic                                         -- traffic_gen_timeout
		);
	end component ed_synth;

	u0 : component ed_synth
		port map (
			ddr3_pll_ref_clk_clk          => CONNECTED_TO_ddr3_pll_ref_clk_clk,          -- ddr3_pll_ref_clk.clk
			ddr3_oct_oct_rzqin            => CONNECTED_TO_ddr3_oct_oct_rzqin,            --         ddr3_oct.oct_rzqin
			ddr3_mem_mem_ck               => CONNECTED_TO_ddr3_mem_mem_ck,               --         ddr3_mem.mem_ck
			ddr3_mem_mem_ck_n             => CONNECTED_TO_ddr3_mem_mem_ck_n,             --                 .mem_ck_n
			ddr3_mem_mem_a                => CONNECTED_TO_ddr3_mem_mem_a,                --                 .mem_a
			ddr3_mem_mem_ba               => CONNECTED_TO_ddr3_mem_mem_ba,               --                 .mem_ba
			ddr3_mem_mem_cke              => CONNECTED_TO_ddr3_mem_mem_cke,              --                 .mem_cke
			ddr3_mem_mem_cs_n             => CONNECTED_TO_ddr3_mem_mem_cs_n,             --                 .mem_cs_n
			ddr3_mem_mem_odt              => CONNECTED_TO_ddr3_mem_mem_odt,              --                 .mem_odt
			ddr3_mem_mem_reset_n          => CONNECTED_TO_ddr3_mem_mem_reset_n,          --                 .mem_reset_n
			ddr3_mem_mem_we_n             => CONNECTED_TO_ddr3_mem_mem_we_n,             --                 .mem_we_n
			ddr3_mem_mem_ras_n            => CONNECTED_TO_ddr3_mem_mem_ras_n,            --                 .mem_ras_n
			ddr3_mem_mem_cas_n            => CONNECTED_TO_ddr3_mem_mem_cas_n,            --                 .mem_cas_n
			ddr3_mem_mem_dqs              => CONNECTED_TO_ddr3_mem_mem_dqs,              --                 .mem_dqs
			ddr3_mem_mem_dqs_n            => CONNECTED_TO_ddr3_mem_mem_dqs_n,            --                 .mem_dqs_n
			ddr3_mem_mem_dq               => CONNECTED_TO_ddr3_mem_mem_dq,               --                 .mem_dq
			ddr3_mem_mem_dm               => CONNECTED_TO_ddr3_mem_mem_dm,               --                 .mem_dm
			ddr3_status_local_cal_success => CONNECTED_TO_ddr3_status_local_cal_success, --      ddr3_status.local_cal_success
			ddr3_status_local_cal_fail    => CONNECTED_TO_ddr3_status_local_cal_fail,    --                 .local_cal_fail
			global_reset_reset_n          => CONNECTED_TO_global_reset_reset_n,          --     global_reset.reset_n
			ddr3_tg_0_traffic_gen_pass    => CONNECTED_TO_ddr3_tg_0_traffic_gen_pass,    --        ddr3_tg_0.traffic_gen_pass
			ddr3_tg_0_traffic_gen_fail    => CONNECTED_TO_ddr3_tg_0_traffic_gen_fail,    --                 .traffic_gen_fail
			ddr3_tg_0_traffic_gen_timeout => CONNECTED_TO_ddr3_tg_0_traffic_gen_timeout  --                 .traffic_gen_timeout
		);

