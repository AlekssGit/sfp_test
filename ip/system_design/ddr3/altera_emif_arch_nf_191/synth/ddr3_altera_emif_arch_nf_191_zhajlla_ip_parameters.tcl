# (C) 2001-2021 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


#####################################################################
#
# THIS IS AN AUTO-GENERATED FILE!
# -------------------------------
# If you modify this files, all your changes will be lost if you
# regenerate the core!
#
# FILE DESCRIPTION
# ----------------
# This file specifies the timing properties of the memory device and
# of the memory interface

package require ::quartus::emif_timing_model
package require ::quartus::clock_uncertainty


set ::GLOBAL_ddr3_altera_emif_arch_nf_191_zhajlla_corename ddr3_altera_emif_arch_nf_191_zhajlla

set var(PROTOCOL)                                                DDR3
set var(NUM_RANKS)                                               1
set var(SLEW_RATE_DRAM)                                          2.5
set var(SLEW_RATE_DRAM_CLOCK)                                    5.0
set var(VIN_Ms)                                                  0.135
set var(VIN_Mh)                                                  0.1
set var(SLEW_RATE_PHY)                                           2.0
set var(SLEW_RATE_PHY_CLOCK)                                     4.0
set var(SLEW_RATE_CA)                                            2.0
set var(SLEW_RATE_CLOCK)                                         4.0
set var(UI)                                                      1.073
set var(tCK)                                                     1.071
set var(tDQSQ)                                                   0.085
set var(tQH)                                                     0.38
set var(tDS)                                                     0.068
set var(tDH)                                                     0.07
set var(tIS)                                                     0.065
set var(tIH)                                                     0.1
set var(tDQSCK)                                                  0.195
set var(tDQSS)                                                   0.27
set var(tWLS)                                                    0.14
set var(tWLH)                                                    0.14
set var(tDSS)                                                    0.18
set var(tDSH)                                                    0.18
set var(BD_PKG_SKEW)                                             0.12000000000000001
set var(CA_BD_PKG_SKEW)                                          0.02
set var(CA_TO_CK_BD_PKG_SKEW)                                    0.0
set var(DQS_BOARD_SKEW)                                          0.02
set var(DQS_TO_CK_BOARD_SKEW)                                    0.02
set var(RD_ISI)                                                  0.1
set var(WR_ISI)                                                  0.11
set var(CA_ISI)                                                  0.15
set var(DQSG_ISI)                                                0.15
set var(WL_ISI)                                                  0.05
set var(X4)                                                      0
set var(IS_DLL_ON)                                               1
set var(OCT_RECAL)                                               0
set var(RDBI)                                                    0
set var(WDBI)                                                    0
set var(TERMINATION_LESS_THAN_120)                               0
set var(IS_COMPONENT)                                            1

set var(PHY_TARGET_SPEEDGRADE)                                   I5
set var(PHY_TARGET_IS_ES)                                        false
set var(PHY_TARGET_IS_ES2)                                       false
set var(PHY_TARGET_IS_ES3)                                       false
set var(PHY_TARGET_IS_PRODUCTION)                                true
set var(PHY_CORE_CLKS_SHARING_ENUM)                              CORE_CLKS_SHARING_DISABLED
set var(PHY_CONFIG_ENUM)                                         CONFIG_PHY_AND_HARD_CTRL
set var(PHY_PING_PONG_EN)                                        false
set var(PHY_DLL_CORE_UPDN_EN)                                    true
set var(IS_HPS)                                                  false
set var(IS_VID)                                                  false
set var(PHY_MEM_CLK_FREQ_MHZ)                                    932.203
set var(PHY_REF_CLK_FREQ_MHZ)                                    21.186
set var(PHY_REF_CLK_JITTER_PS)                                   10.0
set var(PLL_REF_CLK_FREQ_PS_STR)                                 "47168 ps"
set var(PLL_VCO_FREQ_PS_STR)                                     "1072 ps"
set var(PLL_VCO_TO_MEM_CLK_FREQ_RATIO)                           1
set var(PLL_PHY_CLK_VCO_PHASE)                                   2
set var(USER_CLK_RATIO)                                          4
set var(C2P_P2C_CLK_RATIO)                                       4
set var(PHY_HMC_CLK_RATIO)                                       2
set var(MEM_FORMAT_ENUM)                                         MEM_FORMAT_DISCRETE
set var(MEM_DATA_MASK_EN)                                        true
set var(DIAG_TIMING_REGTEST_MODE)                                false
set var(DIAG_CPA_OUT_1_EN)                                       false
set var(DIAG_USE_CPA_LOCK)                                       false
set var(PHY_USERMODE_OCT)                                        false
set var(PHY_PERIODIC_OCT_RECAL)                                  false
set var(PLL_NUM_OF_EXTRA_CLKS)                                   0
set var(PLL_C_CNT_LOW_3)                                         3
set var(PLL_C_CNT_HIGH_3)                                        3
set var(PLL_C_CNT_BYPASS_EN_3)                                   false
set var(PLL_C_CNT_PHASE_PS_STR_3)                                "0 ps"
set var(PLL_C_CNT_DUTY_CYCLE_3)                                  50
set var(PLL_C_CNT_LOW_4)                                         3
set var(PLL_C_CNT_HIGH_4)                                        3
set var(PLL_C_CNT_BYPASS_EN_4)                                   false
set var(PLL_C_CNT_PHASE_PS_STR_4)                                "0 ps"
set var(PLL_C_CNT_DUTY_CYCLE_4)                                  50
set var(PLL_C_CNT_LOW_5)                                         256
set var(PLL_C_CNT_HIGH_5)                                        256
set var(PLL_C_CNT_BYPASS_EN_5)                                   true
set var(PLL_C_CNT_PHASE_PS_STR_5)                                "0 ps"
set var(PLL_C_CNT_DUTY_CYCLE_5)                                  50
set var(PLL_C_CNT_LOW_6)                                         256
set var(PLL_C_CNT_HIGH_6)                                        256
set var(PLL_C_CNT_BYPASS_EN_6)                                   true
set var(PLL_C_CNT_PHASE_PS_STR_6)                                "0 ps"
set var(PLL_C_CNT_DUTY_CYCLE_6)                                  50
set var(PLL_C_CNT_LOW_7)                                         256
set var(PLL_C_CNT_HIGH_7)                                        256
set var(PLL_C_CNT_BYPASS_EN_7)                                   true
set var(PLL_C_CNT_PHASE_PS_STR_7)                                "0 ps"
set var(PLL_C_CNT_DUTY_CYCLE_7)                                  50
set var(PLL_C_CNT_LOW_8)                                         256
set var(PLL_C_CNT_HIGH_8)                                        256
set var(PLL_C_CNT_BYPASS_EN_8)                                   true
set var(PLL_C_CNT_PHASE_PS_STR_8)                                "0 ps"
set var(PLL_C_CNT_DUTY_CYCLE_8)                                  50

set var(C2P_SETUP_OC_NS)                                         0.000
set var(C2P_HOLD_OC_NS)                                          0.000
set var(P2C_SETUP_OC_NS)                                         0.000
set var(P2C_HOLD_OC_NS)                                          0.000
set var(C2C_SAME_CLK_SETUP_OC_NS)                                0.000
set var(C2C_SAME_CLK_HOLD_OC_NS)                                 0.000
set var(C2C_DIFF_CLK_SETUP_OC_NS)                                0.000
set var(C2C_DIFF_CLK_HOLD_OC_NS)                                 0.000
set var(C2P_P2C_PR)                                              false

set var(PATTERNS_AC_CLK)                                         [list arch|arch_inst|bufs_inst|gen_mem_ck.inst[0].b|no_oct.obuf|o]
set var(PATTERNS_AC_CLK_N)                                       [list arch|arch_inst|bufs_inst|gen_mem_ck.inst[0].b|no_oct.obuf_bar|o]
set var(PATTERNS_AC_SYNC)                                        [list arch|arch_inst|bufs_inst|gen_mem_a.inst[0].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[1].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[2].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[3].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[4].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[5].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[6].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[7].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[8].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[9].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[10].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[11].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[12].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[13].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_a.inst[14].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_ba.inst[0].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_ba.inst[1].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_ba.inst[2].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_cke.inst[0].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_cs_n.inst[0].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_odt.inst[0].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_we_n.inst[0].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_ras_n.inst[0].b|no_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_cas_n.inst[0].b|no_oct.obuf|o]
set var(PATTERNS_AC_ASYNC)                                       [list arch|arch_inst|bufs_inst|gen_mem_reset_n.inst[0].b|no_oct.obuf|o]
set var(PATTERNS_RCLK)                                           [list arch|arch_inst|bufs_inst|gen_mem_dqs.inst[0].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[1].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[2].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[3].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[4].b|cal_oct.obuf|o]
set var(PATTERNS_RCLK_N)                                         [list arch|arch_inst|bufs_inst|gen_mem_dqs.inst[0].b|cal_oct.obuf_bar|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[1].b|cal_oct.obuf_bar|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[2].b|cal_oct.obuf_bar|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[3].b|cal_oct.obuf_bar|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[4].b|cal_oct.obuf_bar|o]
set var(PATTERNS_WCLK)                                           [list arch|arch_inst|bufs_inst|gen_mem_dqs.inst[0].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[1].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[2].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[3].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[4].b|cal_oct.obuf|o]
set var(PATTERNS_WCLK_N)                                         [list arch|arch_inst|bufs_inst|gen_mem_dqs.inst[0].b|cal_oct.obuf_bar|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[1].b|cal_oct.obuf_bar|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[2].b|cal_oct.obuf_bar|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[3].b|cal_oct.obuf_bar|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dqs.inst[4].b|cal_oct.obuf_bar|o]
set var(PATTERNS_RDATA)                                          [list arch|arch_inst|bufs_inst|gen_mem_dq.inst[0].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[1].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[2].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[3].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[4].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[5].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[6].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[7].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[8].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[9].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[10].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[11].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[12].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[13].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[14].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[15].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[16].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[17].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[18].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[19].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[20].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[21].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[22].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[23].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[24].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[25].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[26].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[27].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[28].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[29].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[30].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[31].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[32].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[33].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[34].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[35].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[36].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[37].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[38].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[39].b|cal_oct.obuf|o]
set var(PATTERNS_WDATA)                                          [list arch|arch_inst|bufs_inst|gen_mem_dq.inst[0].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[1].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[2].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[3].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[4].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[5].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[6].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[7].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[8].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[9].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[10].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[11].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[12].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[13].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[14].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[15].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[16].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[17].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[18].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[19].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[20].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[21].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[22].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[23].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[24].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[25].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[26].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[27].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[28].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[29].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[30].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[31].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[32].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[33].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[34].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[35].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[36].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[37].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[38].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dq.inst[39].b|cal_oct.obuf|o]
set var(PATTERNS_DM)                                             [list arch|arch_inst|bufs_inst|gen_mem_dm.inst[0].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dm.inst[1].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dm.inst[2].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dm.inst[3].b|cal_oct.obuf|o \
                                                                       arch|arch_inst|bufs_inst|gen_mem_dm.inst[4].b|cal_oct.obuf|o]
set var(PATTERNS_DBI)                                            [list ]
set var(PATTERNS_ALERT_N)                                        [list ]

initialize_emiftcl -protocol $var(PROTOCOL)
initialize_clock_uncertainty_data