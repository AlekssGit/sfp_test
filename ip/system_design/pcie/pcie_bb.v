module pcie (
		output wire         coreclkout_hip,           //    coreclkout_hip.clk
		input  wire         refclk,                   //            refclk.clk
		input  wire         npor,                     //              npor.npor
		input  wire         pin_perst,                //                  .pin_perst
		output wire         app_nreset_status,        // app_nreset_status.reset_n
		input  wire [31:0]  test_in,                  //          hip_ctrl.test_in
		input  wire         simu_mode_pipe,           //                  .simu_mode_pipe
		input  wire         sim_pipe_pclk_in,         //          hip_pipe.sim_pipe_pclk_in
		output wire [1:0]   sim_pipe_rate,            //                  .sim_pipe_rate
		output wire [4:0]   sim_ltssmstate,           //                  .sim_ltssmstate
		output wire [2:0]   eidleinfersel0,           //                  .eidleinfersel0
		output wire [2:0]   eidleinfersel1,           //                  .eidleinfersel1
		output wire [2:0]   eidleinfersel2,           //                  .eidleinfersel2
		output wire [2:0]   eidleinfersel3,           //                  .eidleinfersel3
		output wire [1:0]   powerdown0,               //                  .powerdown0
		output wire [1:0]   powerdown1,               //                  .powerdown1
		output wire [1:0]   powerdown2,               //                  .powerdown2
		output wire [1:0]   powerdown3,               //                  .powerdown3
		output wire         rxpolarity0,              //                  .rxpolarity0
		output wire         rxpolarity1,              //                  .rxpolarity1
		output wire         rxpolarity2,              //                  .rxpolarity2
		output wire         rxpolarity3,              //                  .rxpolarity3
		output wire         txcompl0,                 //                  .txcompl0
		output wire         txcompl1,                 //                  .txcompl1
		output wire         txcompl2,                 //                  .txcompl2
		output wire         txcompl3,                 //                  .txcompl3
		output wire [31:0]  txdata0,                  //                  .txdata0
		output wire [31:0]  txdata1,                  //                  .txdata1
		output wire [31:0]  txdata2,                  //                  .txdata2
		output wire [31:0]  txdata3,                  //                  .txdata3
		output wire [3:0]   txdatak0,                 //                  .txdatak0
		output wire [3:0]   txdatak1,                 //                  .txdatak1
		output wire [3:0]   txdatak2,                 //                  .txdatak2
		output wire [3:0]   txdatak3,                 //                  .txdatak3
		output wire         txdetectrx0,              //                  .txdetectrx0
		output wire         txdetectrx1,              //                  .txdetectrx1
		output wire         txdetectrx2,              //                  .txdetectrx2
		output wire         txdetectrx3,              //                  .txdetectrx3
		output wire         txelecidle0,              //                  .txelecidle0
		output wire         txelecidle1,              //                  .txelecidle1
		output wire         txelecidle2,              //                  .txelecidle2
		output wire         txelecidle3,              //                  .txelecidle3
		output wire         txdeemph0,                //                  .txdeemph0
		output wire         txdeemph1,                //                  .txdeemph1
		output wire         txdeemph2,                //                  .txdeemph2
		output wire         txdeemph3,                //                  .txdeemph3
		output wire [2:0]   txmargin0,                //                  .txmargin0
		output wire [2:0]   txmargin1,                //                  .txmargin1
		output wire [2:0]   txmargin2,                //                  .txmargin2
		output wire [2:0]   txmargin3,                //                  .txmargin3
		output wire         txswing0,                 //                  .txswing0
		output wire         txswing1,                 //                  .txswing1
		output wire         txswing2,                 //                  .txswing2
		output wire         txswing3,                 //                  .txswing3
		input  wire         phystatus0,               //                  .phystatus0
		input  wire         phystatus1,               //                  .phystatus1
		input  wire         phystatus2,               //                  .phystatus2
		input  wire         phystatus3,               //                  .phystatus3
		input  wire [31:0]  rxdata0,                  //                  .rxdata0
		input  wire [31:0]  rxdata1,                  //                  .rxdata1
		input  wire [31:0]  rxdata2,                  //                  .rxdata2
		input  wire [31:0]  rxdata3,                  //                  .rxdata3
		input  wire [3:0]   rxdatak0,                 //                  .rxdatak0
		input  wire [3:0]   rxdatak1,                 //                  .rxdatak1
		input  wire [3:0]   rxdatak2,                 //                  .rxdatak2
		input  wire [3:0]   rxdatak3,                 //                  .rxdatak3
		input  wire         rxelecidle0,              //                  .rxelecidle0
		input  wire         rxelecidle1,              //                  .rxelecidle1
		input  wire         rxelecidle2,              //                  .rxelecidle2
		input  wire         rxelecidle3,              //                  .rxelecidle3
		input  wire [2:0]   rxstatus0,                //                  .rxstatus0
		input  wire [2:0]   rxstatus1,                //                  .rxstatus1
		input  wire [2:0]   rxstatus2,                //                  .rxstatus2
		input  wire [2:0]   rxstatus3,                //                  .rxstatus3
		input  wire         rxvalid0,                 //                  .rxvalid0
		input  wire         rxvalid1,                 //                  .rxvalid1
		input  wire         rxvalid2,                 //                  .rxvalid2
		input  wire         rxvalid3,                 //                  .rxvalid3
		input  wire         rxdataskip0,              //                  .rxdataskip0
		input  wire         rxdataskip1,              //                  .rxdataskip1
		input  wire         rxdataskip2,              //                  .rxdataskip2
		input  wire         rxdataskip3,              //                  .rxdataskip3
		input  wire         rxblkst0,                 //                  .rxblkst0
		input  wire         rxblkst1,                 //                  .rxblkst1
		input  wire         rxblkst2,                 //                  .rxblkst2
		input  wire         rxblkst3,                 //                  .rxblkst3
		input  wire [1:0]   rxsynchd0,                //                  .rxsynchd0
		input  wire [1:0]   rxsynchd1,                //                  .rxsynchd1
		input  wire [1:0]   rxsynchd2,                //                  .rxsynchd2
		input  wire [1:0]   rxsynchd3,                //                  .rxsynchd3
		output wire [17:0]  currentcoeff0,            //                  .currentcoeff0
		output wire [17:0]  currentcoeff1,            //                  .currentcoeff1
		output wire [17:0]  currentcoeff2,            //                  .currentcoeff2
		output wire [17:0]  currentcoeff3,            //                  .currentcoeff3
		output wire [2:0]   currentrxpreset0,         //                  .currentrxpreset0
		output wire [2:0]   currentrxpreset1,         //                  .currentrxpreset1
		output wire [2:0]   currentrxpreset2,         //                  .currentrxpreset2
		output wire [2:0]   currentrxpreset3,         //                  .currentrxpreset3
		output wire [1:0]   txsynchd0,                //                  .txsynchd0
		output wire [1:0]   txsynchd1,                //                  .txsynchd1
		output wire [1:0]   txsynchd2,                //                  .txsynchd2
		output wire [1:0]   txsynchd3,                //                  .txsynchd3
		output wire         txblkst0,                 //                  .txblkst0
		output wire         txblkst1,                 //                  .txblkst1
		output wire         txblkst2,                 //                  .txblkst2
		output wire         txblkst3,                 //                  .txblkst3
		output wire         txdataskip0,              //                  .txdataskip0
		output wire         txdataskip1,              //                  .txdataskip1
		output wire         txdataskip2,              //                  .txdataskip2
		output wire         txdataskip3,              //                  .txdataskip3
		output wire [1:0]   rate0,                    //                  .rate0
		output wire [1:0]   rate1,                    //                  .rate1
		output wire [1:0]   rate2,                    //                  .rate2
		output wire [1:0]   rate3,                    //                  .rate3
		input  wire         rx_in0,                   //        hip_serial.rx_in0
		input  wire         rx_in1,                   //                  .rx_in1
		input  wire         rx_in2,                   //                  .rx_in2
		input  wire         rx_in3,                   //                  .rx_in3
		output wire         tx_out0,                  //                  .tx_out0
		output wire         tx_out1,                  //                  .tx_out1
		output wire         tx_out2,                  //                  .tx_out2
		output wire         tx_out3,                  //                  .tx_out3
		output wire [81:0]  msi_intfc_o,              //         msi_intfc.msi_intfc
		output wire [15:0]  msi_control_o,            //       msi_control.msi_control
		output wire [15:0]  msix_intfc_o,             //        msix_intfc.msix_intfc
		input  wire         intx_req_i,               //        intx_intfc.intx_req
		output wire         intx_ack_o,               //                  .intx_ack
		input  wire [63:0]  txs_address_i,            //               txs.address
		input  wire         txs_chipselect_i,         //                  .chipselect
		input  wire [15:0]  txs_byteenable_i,         //                  .byteenable
		output wire [127:0] txs_readdata_o,           //                  .readdata
		input  wire [127:0] txs_writedata_i,          //                  .writedata
		input  wire         txs_read_i,               //                  .read
		input  wire         txs_write_i,              //                  .write
		input  wire [5:0]   txs_burstcount_i,         //                  .burstcount
		output wire         txs_readdatavalid_o,      //                  .readdatavalid
		output wire         txs_waitrequest_o,        //                  .waitrequest
		input  wire         cra_chipselect_i,         //               cra.chipselect
		input  wire [13:0]  cra_address_i,            //                  .address
		input  wire [3:0]   cra_byteenable_i,         //                  .byteenable
		input  wire         cra_read_i,               //                  .read
		output wire [31:0]  cra_readdata_o,           //                  .readdata
		input  wire         cra_write_i,              //                  .write
		input  wire [31:0]  cra_writedata_i,          //                  .writedata
		output wire         cra_waitrequest_o,        //                  .waitrequest
		output wire         cra_irq_o,                //           cra_irq.irq
		output wire [63:0]  rxm_bar0_address_o,       //          rxm_bar0.address
		output wire [15:0]  rxm_bar0_byteenable_o,    //                  .byteenable
		input  wire [127:0] rxm_bar0_readdata_i,      //                  .readdata
		output wire [127:0] rxm_bar0_writedata_o,     //                  .writedata
		output wire         rxm_bar0_read_o,          //                  .read
		output wire         rxm_bar0_write_o,         //                  .write
		output wire [5:0]   rxm_bar0_burstcount_o,    //                  .burstcount
		input  wire         rxm_bar0_readdatavalid_i, //                  .readdatavalid
		input  wire         rxm_bar0_waitrequest_i,   //                  .waitrequest
		output wire [63:0]  rxm_bar2_address_o,       //          rxm_bar2.address
		output wire [15:0]  rxm_bar2_byteenable_o,    //                  .byteenable
		input  wire [127:0] rxm_bar2_readdata_i,      //                  .readdata
		output wire [127:0] rxm_bar2_writedata_o,     //                  .writedata
		output wire         rxm_bar2_read_o,          //                  .read
		output wire         rxm_bar2_write_o,         //                  .write
		output wire [5:0]   rxm_bar2_burstcount_o,    //                  .burstcount
		input  wire         rxm_bar2_readdatavalid_i, //                  .readdatavalid
		input  wire         rxm_bar2_waitrequest_i,   //                  .waitrequest
		input  wire [15:0]  rxm_irq_i                 //           rxm_irq.irq
	);
endmodule

