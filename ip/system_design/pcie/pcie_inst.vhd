	component pcie is
		port (
			coreclkout_hip           : out std_logic;                                         -- clk
			refclk                   : in  std_logic                      := 'X';             -- clk
			npor                     : in  std_logic                      := 'X';             -- npor
			pin_perst                : in  std_logic                      := 'X';             -- pin_perst
			app_nreset_status        : out std_logic;                                         -- reset_n
			test_in                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- test_in
			simu_mode_pipe           : in  std_logic                      := 'X';             -- simu_mode_pipe
			sim_pipe_pclk_in         : in  std_logic                      := 'X';             -- sim_pipe_pclk_in
			sim_pipe_rate            : out std_logic_vector(1 downto 0);                      -- sim_pipe_rate
			sim_ltssmstate           : out std_logic_vector(4 downto 0);                      -- sim_ltssmstate
			eidleinfersel0           : out std_logic_vector(2 downto 0);                      -- eidleinfersel0
			eidleinfersel1           : out std_logic_vector(2 downto 0);                      -- eidleinfersel1
			eidleinfersel2           : out std_logic_vector(2 downto 0);                      -- eidleinfersel2
			eidleinfersel3           : out std_logic_vector(2 downto 0);                      -- eidleinfersel3
			powerdown0               : out std_logic_vector(1 downto 0);                      -- powerdown0
			powerdown1               : out std_logic_vector(1 downto 0);                      -- powerdown1
			powerdown2               : out std_logic_vector(1 downto 0);                      -- powerdown2
			powerdown3               : out std_logic_vector(1 downto 0);                      -- powerdown3
			rxpolarity0              : out std_logic;                                         -- rxpolarity0
			rxpolarity1              : out std_logic;                                         -- rxpolarity1
			rxpolarity2              : out std_logic;                                         -- rxpolarity2
			rxpolarity3              : out std_logic;                                         -- rxpolarity3
			txcompl0                 : out std_logic;                                         -- txcompl0
			txcompl1                 : out std_logic;                                         -- txcompl1
			txcompl2                 : out std_logic;                                         -- txcompl2
			txcompl3                 : out std_logic;                                         -- txcompl3
			txdata0                  : out std_logic_vector(31 downto 0);                     -- txdata0
			txdata1                  : out std_logic_vector(31 downto 0);                     -- txdata1
			txdata2                  : out std_logic_vector(31 downto 0);                     -- txdata2
			txdata3                  : out std_logic_vector(31 downto 0);                     -- txdata3
			txdatak0                 : out std_logic_vector(3 downto 0);                      -- txdatak0
			txdatak1                 : out std_logic_vector(3 downto 0);                      -- txdatak1
			txdatak2                 : out std_logic_vector(3 downto 0);                      -- txdatak2
			txdatak3                 : out std_logic_vector(3 downto 0);                      -- txdatak3
			txdetectrx0              : out std_logic;                                         -- txdetectrx0
			txdetectrx1              : out std_logic;                                         -- txdetectrx1
			txdetectrx2              : out std_logic;                                         -- txdetectrx2
			txdetectrx3              : out std_logic;                                         -- txdetectrx3
			txelecidle0              : out std_logic;                                         -- txelecidle0
			txelecidle1              : out std_logic;                                         -- txelecidle1
			txelecidle2              : out std_logic;                                         -- txelecidle2
			txelecidle3              : out std_logic;                                         -- txelecidle3
			txdeemph0                : out std_logic;                                         -- txdeemph0
			txdeemph1                : out std_logic;                                         -- txdeemph1
			txdeemph2                : out std_logic;                                         -- txdeemph2
			txdeemph3                : out std_logic;                                         -- txdeemph3
			txmargin0                : out std_logic_vector(2 downto 0);                      -- txmargin0
			txmargin1                : out std_logic_vector(2 downto 0);                      -- txmargin1
			txmargin2                : out std_logic_vector(2 downto 0);                      -- txmargin2
			txmargin3                : out std_logic_vector(2 downto 0);                      -- txmargin3
			txswing0                 : out std_logic;                                         -- txswing0
			txswing1                 : out std_logic;                                         -- txswing1
			txswing2                 : out std_logic;                                         -- txswing2
			txswing3                 : out std_logic;                                         -- txswing3
			phystatus0               : in  std_logic                      := 'X';             -- phystatus0
			phystatus1               : in  std_logic                      := 'X';             -- phystatus1
			phystatus2               : in  std_logic                      := 'X';             -- phystatus2
			phystatus3               : in  std_logic                      := 'X';             -- phystatus3
			rxdata0                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- rxdata0
			rxdata1                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- rxdata1
			rxdata2                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- rxdata2
			rxdata3                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- rxdata3
			rxdatak0                 : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rxdatak0
			rxdatak1                 : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rxdatak1
			rxdatak2                 : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rxdatak2
			rxdatak3                 : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- rxdatak3
			rxelecidle0              : in  std_logic                      := 'X';             -- rxelecidle0
			rxelecidle1              : in  std_logic                      := 'X';             -- rxelecidle1
			rxelecidle2              : in  std_logic                      := 'X';             -- rxelecidle2
			rxelecidle3              : in  std_logic                      := 'X';             -- rxelecidle3
			rxstatus0                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus0
			rxstatus1                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus1
			rxstatus2                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus2
			rxstatus3                : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rxstatus3
			rxvalid0                 : in  std_logic                      := 'X';             -- rxvalid0
			rxvalid1                 : in  std_logic                      := 'X';             -- rxvalid1
			rxvalid2                 : in  std_logic                      := 'X';             -- rxvalid2
			rxvalid3                 : in  std_logic                      := 'X';             -- rxvalid3
			rxdataskip0              : in  std_logic                      := 'X';             -- rxdataskip0
			rxdataskip1              : in  std_logic                      := 'X';             -- rxdataskip1
			rxdataskip2              : in  std_logic                      := 'X';             -- rxdataskip2
			rxdataskip3              : in  std_logic                      := 'X';             -- rxdataskip3
			rxblkst0                 : in  std_logic                      := 'X';             -- rxblkst0
			rxblkst1                 : in  std_logic                      := 'X';             -- rxblkst1
			rxblkst2                 : in  std_logic                      := 'X';             -- rxblkst2
			rxblkst3                 : in  std_logic                      := 'X';             -- rxblkst3
			rxsynchd0                : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- rxsynchd0
			rxsynchd1                : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- rxsynchd1
			rxsynchd2                : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- rxsynchd2
			rxsynchd3                : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- rxsynchd3
			currentcoeff0            : out std_logic_vector(17 downto 0);                     -- currentcoeff0
			currentcoeff1            : out std_logic_vector(17 downto 0);                     -- currentcoeff1
			currentcoeff2            : out std_logic_vector(17 downto 0);                     -- currentcoeff2
			currentcoeff3            : out std_logic_vector(17 downto 0);                     -- currentcoeff3
			currentrxpreset0         : out std_logic_vector(2 downto 0);                      -- currentrxpreset0
			currentrxpreset1         : out std_logic_vector(2 downto 0);                      -- currentrxpreset1
			currentrxpreset2         : out std_logic_vector(2 downto 0);                      -- currentrxpreset2
			currentrxpreset3         : out std_logic_vector(2 downto 0);                      -- currentrxpreset3
			txsynchd0                : out std_logic_vector(1 downto 0);                      -- txsynchd0
			txsynchd1                : out std_logic_vector(1 downto 0);                      -- txsynchd1
			txsynchd2                : out std_logic_vector(1 downto 0);                      -- txsynchd2
			txsynchd3                : out std_logic_vector(1 downto 0);                      -- txsynchd3
			txblkst0                 : out std_logic;                                         -- txblkst0
			txblkst1                 : out std_logic;                                         -- txblkst1
			txblkst2                 : out std_logic;                                         -- txblkst2
			txblkst3                 : out std_logic;                                         -- txblkst3
			txdataskip0              : out std_logic;                                         -- txdataskip0
			txdataskip1              : out std_logic;                                         -- txdataskip1
			txdataskip2              : out std_logic;                                         -- txdataskip2
			txdataskip3              : out std_logic;                                         -- txdataskip3
			rate0                    : out std_logic_vector(1 downto 0);                      -- rate0
			rate1                    : out std_logic_vector(1 downto 0);                      -- rate1
			rate2                    : out std_logic_vector(1 downto 0);                      -- rate2
			rate3                    : out std_logic_vector(1 downto 0);                      -- rate3
			rx_in0                   : in  std_logic                      := 'X';             -- rx_in0
			rx_in1                   : in  std_logic                      := 'X';             -- rx_in1
			rx_in2                   : in  std_logic                      := 'X';             -- rx_in2
			rx_in3                   : in  std_logic                      := 'X';             -- rx_in3
			tx_out0                  : out std_logic;                                         -- tx_out0
			tx_out1                  : out std_logic;                                         -- tx_out1
			tx_out2                  : out std_logic;                                         -- tx_out2
			tx_out3                  : out std_logic;                                         -- tx_out3
			msi_intfc_o              : out std_logic_vector(81 downto 0);                     -- msi_intfc
			msi_control_o            : out std_logic_vector(15 downto 0);                     -- msi_control
			msix_intfc_o             : out std_logic_vector(15 downto 0);                     -- msix_intfc
			intx_req_i               : in  std_logic                      := 'X';             -- intx_req
			intx_ack_o               : out std_logic;                                         -- intx_ack
			txs_address_i            : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- address
			txs_chipselect_i         : in  std_logic                      := 'X';             -- chipselect
			txs_byteenable_i         : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- byteenable
			txs_readdata_o           : out std_logic_vector(127 downto 0);                    -- readdata
			txs_writedata_i          : in  std_logic_vector(127 downto 0) := (others => 'X'); -- writedata
			txs_read_i               : in  std_logic                      := 'X';             -- read
			txs_write_i              : in  std_logic                      := 'X';             -- write
			txs_burstcount_i         : in  std_logic_vector(5 downto 0)   := (others => 'X'); -- burstcount
			txs_readdatavalid_o      : out std_logic;                                         -- readdatavalid
			txs_waitrequest_o        : out std_logic;                                         -- waitrequest
			cra_chipselect_i         : in  std_logic                      := 'X';             -- chipselect
			cra_address_i            : in  std_logic_vector(13 downto 0)  := (others => 'X'); -- address
			cra_byteenable_i         : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			cra_read_i               : in  std_logic                      := 'X';             -- read
			cra_readdata_o           : out std_logic_vector(31 downto 0);                     -- readdata
			cra_write_i              : in  std_logic                      := 'X';             -- write
			cra_writedata_i          : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			cra_waitrequest_o        : out std_logic;                                         -- waitrequest
			cra_irq_o                : out std_logic;                                         -- irq
			rxm_bar0_address_o       : out std_logic_vector(63 downto 0);                     -- address
			rxm_bar0_byteenable_o    : out std_logic_vector(15 downto 0);                     -- byteenable
			rxm_bar0_readdata_i      : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			rxm_bar0_writedata_o     : out std_logic_vector(127 downto 0);                    -- writedata
			rxm_bar0_read_o          : out std_logic;                                         -- read
			rxm_bar0_write_o         : out std_logic;                                         -- write
			rxm_bar0_burstcount_o    : out std_logic_vector(5 downto 0);                      -- burstcount
			rxm_bar0_readdatavalid_i : in  std_logic                      := 'X';             -- readdatavalid
			rxm_bar0_waitrequest_i   : in  std_logic                      := 'X';             -- waitrequest
			rxm_bar2_address_o       : out std_logic_vector(63 downto 0);                     -- address
			rxm_bar2_byteenable_o    : out std_logic_vector(15 downto 0);                     -- byteenable
			rxm_bar2_readdata_i      : in  std_logic_vector(127 downto 0) := (others => 'X'); -- readdata
			rxm_bar2_writedata_o     : out std_logic_vector(127 downto 0);                    -- writedata
			rxm_bar2_read_o          : out std_logic;                                         -- read
			rxm_bar2_write_o         : out std_logic;                                         -- write
			rxm_bar2_burstcount_o    : out std_logic_vector(5 downto 0);                      -- burstcount
			rxm_bar2_readdatavalid_i : in  std_logic                      := 'X';             -- readdatavalid
			rxm_bar2_waitrequest_i   : in  std_logic                      := 'X';             -- waitrequest
			rxm_irq_i                : in  std_logic_vector(15 downto 0)  := (others => 'X')  -- irq
		);
	end component pcie;

	u0 : component pcie
		port map (
			coreclkout_hip           => CONNECTED_TO_coreclkout_hip,           --    coreclkout_hip.clk
			refclk                   => CONNECTED_TO_refclk,                   --            refclk.clk
			npor                     => CONNECTED_TO_npor,                     --              npor.npor
			pin_perst                => CONNECTED_TO_pin_perst,                --                  .pin_perst
			app_nreset_status        => CONNECTED_TO_app_nreset_status,        -- app_nreset_status.reset_n
			test_in                  => CONNECTED_TO_test_in,                  --          hip_ctrl.test_in
			simu_mode_pipe           => CONNECTED_TO_simu_mode_pipe,           --                  .simu_mode_pipe
			sim_pipe_pclk_in         => CONNECTED_TO_sim_pipe_pclk_in,         --          hip_pipe.sim_pipe_pclk_in
			sim_pipe_rate            => CONNECTED_TO_sim_pipe_rate,            --                  .sim_pipe_rate
			sim_ltssmstate           => CONNECTED_TO_sim_ltssmstate,           --                  .sim_ltssmstate
			eidleinfersel0           => CONNECTED_TO_eidleinfersel0,           --                  .eidleinfersel0
			eidleinfersel1           => CONNECTED_TO_eidleinfersel1,           --                  .eidleinfersel1
			eidleinfersel2           => CONNECTED_TO_eidleinfersel2,           --                  .eidleinfersel2
			eidleinfersel3           => CONNECTED_TO_eidleinfersel3,           --                  .eidleinfersel3
			powerdown0               => CONNECTED_TO_powerdown0,               --                  .powerdown0
			powerdown1               => CONNECTED_TO_powerdown1,               --                  .powerdown1
			powerdown2               => CONNECTED_TO_powerdown2,               --                  .powerdown2
			powerdown3               => CONNECTED_TO_powerdown3,               --                  .powerdown3
			rxpolarity0              => CONNECTED_TO_rxpolarity0,              --                  .rxpolarity0
			rxpolarity1              => CONNECTED_TO_rxpolarity1,              --                  .rxpolarity1
			rxpolarity2              => CONNECTED_TO_rxpolarity2,              --                  .rxpolarity2
			rxpolarity3              => CONNECTED_TO_rxpolarity3,              --                  .rxpolarity3
			txcompl0                 => CONNECTED_TO_txcompl0,                 --                  .txcompl0
			txcompl1                 => CONNECTED_TO_txcompl1,                 --                  .txcompl1
			txcompl2                 => CONNECTED_TO_txcompl2,                 --                  .txcompl2
			txcompl3                 => CONNECTED_TO_txcompl3,                 --                  .txcompl3
			txdata0                  => CONNECTED_TO_txdata0,                  --                  .txdata0
			txdata1                  => CONNECTED_TO_txdata1,                  --                  .txdata1
			txdata2                  => CONNECTED_TO_txdata2,                  --                  .txdata2
			txdata3                  => CONNECTED_TO_txdata3,                  --                  .txdata3
			txdatak0                 => CONNECTED_TO_txdatak0,                 --                  .txdatak0
			txdatak1                 => CONNECTED_TO_txdatak1,                 --                  .txdatak1
			txdatak2                 => CONNECTED_TO_txdatak2,                 --                  .txdatak2
			txdatak3                 => CONNECTED_TO_txdatak3,                 --                  .txdatak3
			txdetectrx0              => CONNECTED_TO_txdetectrx0,              --                  .txdetectrx0
			txdetectrx1              => CONNECTED_TO_txdetectrx1,              --                  .txdetectrx1
			txdetectrx2              => CONNECTED_TO_txdetectrx2,              --                  .txdetectrx2
			txdetectrx3              => CONNECTED_TO_txdetectrx3,              --                  .txdetectrx3
			txelecidle0              => CONNECTED_TO_txelecidle0,              --                  .txelecidle0
			txelecidle1              => CONNECTED_TO_txelecidle1,              --                  .txelecidle1
			txelecidle2              => CONNECTED_TO_txelecidle2,              --                  .txelecidle2
			txelecidle3              => CONNECTED_TO_txelecidle3,              --                  .txelecidle3
			txdeemph0                => CONNECTED_TO_txdeemph0,                --                  .txdeemph0
			txdeemph1                => CONNECTED_TO_txdeemph1,                --                  .txdeemph1
			txdeemph2                => CONNECTED_TO_txdeemph2,                --                  .txdeemph2
			txdeemph3                => CONNECTED_TO_txdeemph3,                --                  .txdeemph3
			txmargin0                => CONNECTED_TO_txmargin0,                --                  .txmargin0
			txmargin1                => CONNECTED_TO_txmargin1,                --                  .txmargin1
			txmargin2                => CONNECTED_TO_txmargin2,                --                  .txmargin2
			txmargin3                => CONNECTED_TO_txmargin3,                --                  .txmargin3
			txswing0                 => CONNECTED_TO_txswing0,                 --                  .txswing0
			txswing1                 => CONNECTED_TO_txswing1,                 --                  .txswing1
			txswing2                 => CONNECTED_TO_txswing2,                 --                  .txswing2
			txswing3                 => CONNECTED_TO_txswing3,                 --                  .txswing3
			phystatus0               => CONNECTED_TO_phystatus0,               --                  .phystatus0
			phystatus1               => CONNECTED_TO_phystatus1,               --                  .phystatus1
			phystatus2               => CONNECTED_TO_phystatus2,               --                  .phystatus2
			phystatus3               => CONNECTED_TO_phystatus3,               --                  .phystatus3
			rxdata0                  => CONNECTED_TO_rxdata0,                  --                  .rxdata0
			rxdata1                  => CONNECTED_TO_rxdata1,                  --                  .rxdata1
			rxdata2                  => CONNECTED_TO_rxdata2,                  --                  .rxdata2
			rxdata3                  => CONNECTED_TO_rxdata3,                  --                  .rxdata3
			rxdatak0                 => CONNECTED_TO_rxdatak0,                 --                  .rxdatak0
			rxdatak1                 => CONNECTED_TO_rxdatak1,                 --                  .rxdatak1
			rxdatak2                 => CONNECTED_TO_rxdatak2,                 --                  .rxdatak2
			rxdatak3                 => CONNECTED_TO_rxdatak3,                 --                  .rxdatak3
			rxelecidle0              => CONNECTED_TO_rxelecidle0,              --                  .rxelecidle0
			rxelecidle1              => CONNECTED_TO_rxelecidle1,              --                  .rxelecidle1
			rxelecidle2              => CONNECTED_TO_rxelecidle2,              --                  .rxelecidle2
			rxelecidle3              => CONNECTED_TO_rxelecidle3,              --                  .rxelecidle3
			rxstatus0                => CONNECTED_TO_rxstatus0,                --                  .rxstatus0
			rxstatus1                => CONNECTED_TO_rxstatus1,                --                  .rxstatus1
			rxstatus2                => CONNECTED_TO_rxstatus2,                --                  .rxstatus2
			rxstatus3                => CONNECTED_TO_rxstatus3,                --                  .rxstatus3
			rxvalid0                 => CONNECTED_TO_rxvalid0,                 --                  .rxvalid0
			rxvalid1                 => CONNECTED_TO_rxvalid1,                 --                  .rxvalid1
			rxvalid2                 => CONNECTED_TO_rxvalid2,                 --                  .rxvalid2
			rxvalid3                 => CONNECTED_TO_rxvalid3,                 --                  .rxvalid3
			rxdataskip0              => CONNECTED_TO_rxdataskip0,              --                  .rxdataskip0
			rxdataskip1              => CONNECTED_TO_rxdataskip1,              --                  .rxdataskip1
			rxdataskip2              => CONNECTED_TO_rxdataskip2,              --                  .rxdataskip2
			rxdataskip3              => CONNECTED_TO_rxdataskip3,              --                  .rxdataskip3
			rxblkst0                 => CONNECTED_TO_rxblkst0,                 --                  .rxblkst0
			rxblkst1                 => CONNECTED_TO_rxblkst1,                 --                  .rxblkst1
			rxblkst2                 => CONNECTED_TO_rxblkst2,                 --                  .rxblkst2
			rxblkst3                 => CONNECTED_TO_rxblkst3,                 --                  .rxblkst3
			rxsynchd0                => CONNECTED_TO_rxsynchd0,                --                  .rxsynchd0
			rxsynchd1                => CONNECTED_TO_rxsynchd1,                --                  .rxsynchd1
			rxsynchd2                => CONNECTED_TO_rxsynchd2,                --                  .rxsynchd2
			rxsynchd3                => CONNECTED_TO_rxsynchd3,                --                  .rxsynchd3
			currentcoeff0            => CONNECTED_TO_currentcoeff0,            --                  .currentcoeff0
			currentcoeff1            => CONNECTED_TO_currentcoeff1,            --                  .currentcoeff1
			currentcoeff2            => CONNECTED_TO_currentcoeff2,            --                  .currentcoeff2
			currentcoeff3            => CONNECTED_TO_currentcoeff3,            --                  .currentcoeff3
			currentrxpreset0         => CONNECTED_TO_currentrxpreset0,         --                  .currentrxpreset0
			currentrxpreset1         => CONNECTED_TO_currentrxpreset1,         --                  .currentrxpreset1
			currentrxpreset2         => CONNECTED_TO_currentrxpreset2,         --                  .currentrxpreset2
			currentrxpreset3         => CONNECTED_TO_currentrxpreset3,         --                  .currentrxpreset3
			txsynchd0                => CONNECTED_TO_txsynchd0,                --                  .txsynchd0
			txsynchd1                => CONNECTED_TO_txsynchd1,                --                  .txsynchd1
			txsynchd2                => CONNECTED_TO_txsynchd2,                --                  .txsynchd2
			txsynchd3                => CONNECTED_TO_txsynchd3,                --                  .txsynchd3
			txblkst0                 => CONNECTED_TO_txblkst0,                 --                  .txblkst0
			txblkst1                 => CONNECTED_TO_txblkst1,                 --                  .txblkst1
			txblkst2                 => CONNECTED_TO_txblkst2,                 --                  .txblkst2
			txblkst3                 => CONNECTED_TO_txblkst3,                 --                  .txblkst3
			txdataskip0              => CONNECTED_TO_txdataskip0,              --                  .txdataskip0
			txdataskip1              => CONNECTED_TO_txdataskip1,              --                  .txdataskip1
			txdataskip2              => CONNECTED_TO_txdataskip2,              --                  .txdataskip2
			txdataskip3              => CONNECTED_TO_txdataskip3,              --                  .txdataskip3
			rate0                    => CONNECTED_TO_rate0,                    --                  .rate0
			rate1                    => CONNECTED_TO_rate1,                    --                  .rate1
			rate2                    => CONNECTED_TO_rate2,                    --                  .rate2
			rate3                    => CONNECTED_TO_rate3,                    --                  .rate3
			rx_in0                   => CONNECTED_TO_rx_in0,                   --        hip_serial.rx_in0
			rx_in1                   => CONNECTED_TO_rx_in1,                   --                  .rx_in1
			rx_in2                   => CONNECTED_TO_rx_in2,                   --                  .rx_in2
			rx_in3                   => CONNECTED_TO_rx_in3,                   --                  .rx_in3
			tx_out0                  => CONNECTED_TO_tx_out0,                  --                  .tx_out0
			tx_out1                  => CONNECTED_TO_tx_out1,                  --                  .tx_out1
			tx_out2                  => CONNECTED_TO_tx_out2,                  --                  .tx_out2
			tx_out3                  => CONNECTED_TO_tx_out3,                  --                  .tx_out3
			msi_intfc_o              => CONNECTED_TO_msi_intfc_o,              --         msi_intfc.msi_intfc
			msi_control_o            => CONNECTED_TO_msi_control_o,            --       msi_control.msi_control
			msix_intfc_o             => CONNECTED_TO_msix_intfc_o,             --        msix_intfc.msix_intfc
			intx_req_i               => CONNECTED_TO_intx_req_i,               --        intx_intfc.intx_req
			intx_ack_o               => CONNECTED_TO_intx_ack_o,               --                  .intx_ack
			txs_address_i            => CONNECTED_TO_txs_address_i,            --               txs.address
			txs_chipselect_i         => CONNECTED_TO_txs_chipselect_i,         --                  .chipselect
			txs_byteenable_i         => CONNECTED_TO_txs_byteenable_i,         --                  .byteenable
			txs_readdata_o           => CONNECTED_TO_txs_readdata_o,           --                  .readdata
			txs_writedata_i          => CONNECTED_TO_txs_writedata_i,          --                  .writedata
			txs_read_i               => CONNECTED_TO_txs_read_i,               --                  .read
			txs_write_i              => CONNECTED_TO_txs_write_i,              --                  .write
			txs_burstcount_i         => CONNECTED_TO_txs_burstcount_i,         --                  .burstcount
			txs_readdatavalid_o      => CONNECTED_TO_txs_readdatavalid_o,      --                  .readdatavalid
			txs_waitrequest_o        => CONNECTED_TO_txs_waitrequest_o,        --                  .waitrequest
			cra_chipselect_i         => CONNECTED_TO_cra_chipselect_i,         --               cra.chipselect
			cra_address_i            => CONNECTED_TO_cra_address_i,            --                  .address
			cra_byteenable_i         => CONNECTED_TO_cra_byteenable_i,         --                  .byteenable
			cra_read_i               => CONNECTED_TO_cra_read_i,               --                  .read
			cra_readdata_o           => CONNECTED_TO_cra_readdata_o,           --                  .readdata
			cra_write_i              => CONNECTED_TO_cra_write_i,              --                  .write
			cra_writedata_i          => CONNECTED_TO_cra_writedata_i,          --                  .writedata
			cra_waitrequest_o        => CONNECTED_TO_cra_waitrequest_o,        --                  .waitrequest
			cra_irq_o                => CONNECTED_TO_cra_irq_o,                --           cra_irq.irq
			rxm_bar0_address_o       => CONNECTED_TO_rxm_bar0_address_o,       --          rxm_bar0.address
			rxm_bar0_byteenable_o    => CONNECTED_TO_rxm_bar0_byteenable_o,    --                  .byteenable
			rxm_bar0_readdata_i      => CONNECTED_TO_rxm_bar0_readdata_i,      --                  .readdata
			rxm_bar0_writedata_o     => CONNECTED_TO_rxm_bar0_writedata_o,     --                  .writedata
			rxm_bar0_read_o          => CONNECTED_TO_rxm_bar0_read_o,          --                  .read
			rxm_bar0_write_o         => CONNECTED_TO_rxm_bar0_write_o,         --                  .write
			rxm_bar0_burstcount_o    => CONNECTED_TO_rxm_bar0_burstcount_o,    --                  .burstcount
			rxm_bar0_readdatavalid_i => CONNECTED_TO_rxm_bar0_readdatavalid_i, --                  .readdatavalid
			rxm_bar0_waitrequest_i   => CONNECTED_TO_rxm_bar0_waitrequest_i,   --                  .waitrequest
			rxm_bar2_address_o       => CONNECTED_TO_rxm_bar2_address_o,       --          rxm_bar2.address
			rxm_bar2_byteenable_o    => CONNECTED_TO_rxm_bar2_byteenable_o,    --                  .byteenable
			rxm_bar2_readdata_i      => CONNECTED_TO_rxm_bar2_readdata_i,      --                  .readdata
			rxm_bar2_writedata_o     => CONNECTED_TO_rxm_bar2_writedata_o,     --                  .writedata
			rxm_bar2_read_o          => CONNECTED_TO_rxm_bar2_read_o,          --                  .read
			rxm_bar2_write_o         => CONNECTED_TO_rxm_bar2_write_o,         --                  .write
			rxm_bar2_burstcount_o    => CONNECTED_TO_rxm_bar2_burstcount_o,    --                  .burstcount
			rxm_bar2_readdatavalid_i => CONNECTED_TO_rxm_bar2_readdatavalid_i, --                  .readdatavalid
			rxm_bar2_waitrequest_i   => CONNECTED_TO_rxm_bar2_waitrequest_i,   --                  .waitrequest
			rxm_irq_i                => CONNECTED_TO_rxm_irq_i                 --           rxm_irq.irq
		);

