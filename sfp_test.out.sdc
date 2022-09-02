## Generated SDC file "sfp_test.out.sdc"

## Copyright (C) 2021  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Intel Corporation"
## PROGRAM "Quartus Prime"
## VERSION "Version 21.3.0 Build 170 09/23/2021 SC Pro Edition"

## DATE    "Thu Aug 25 12:02:11 2022"

##
## DEVICE  "10CX220YF780E5G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {~ALTERA_CLKUSR~} -period 8.000 -waveform { 0.000 4.000 } [get_pins -compatibility_mode {~ALTERA_CLKUSR~~ibuf|o}]
create_clock -name {clk_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk_50}]
create_clock -name {clk_125} -period 8.000 -waveform { 0.000 4.000 } [get_ports {clk_125_lvds_tse}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk_125}] -rise_to [get_clocks {clk_125}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {clk_125}] -fall_to [get_clocks {clk_125}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {clk_125}] -rise_to [get_clocks {clk_50}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {clk_125}] -fall_to [get_clocks {clk_50}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {clk_125}] -rise_to [get_clocks {~ALTERA_CLKUSR~}]  0.080  
set_clock_uncertainty -rise_from [get_clocks {clk_125}] -fall_to [get_clocks {~ALTERA_CLKUSR~}]  0.080  
set_clock_uncertainty -fall_from [get_clocks {clk_125}] -rise_to [get_clocks {clk_125}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {clk_125}] -fall_to [get_clocks {clk_125}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {clk_125}] -rise_to [get_clocks {clk_50}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {clk_125}] -fall_to [get_clocks {clk_50}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {clk_125}] -rise_to [get_clocks {~ALTERA_CLKUSR~}]  0.080  
set_clock_uncertainty -fall_from [get_clocks {clk_125}] -fall_to [get_clocks {~ALTERA_CLKUSR~}]  0.080  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -rise_to [get_clocks {clk_125}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -fall_to [get_clocks {clk_125}]  0.260  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -rise_to [get_clocks {clk_50}]  0.210  
set_clock_uncertainty -rise_from [get_clocks {clk_50}] -fall_to [get_clocks {clk_50}]  0.210  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -rise_to [get_clocks {clk_125}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -fall_to [get_clocks {clk_125}]  0.260  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -rise_to [get_clocks {clk_50}]  0.210  
set_clock_uncertainty -fall_from [get_clocks {clk_50}] -fall_to [get_clocks {clk_50}]  0.210  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {clk_125}]  0.080  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {clk_125}]  0.080  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {~ALTERA_CLKUSR~}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {~ALTERA_CLKUSR~}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {clk_125}]  0.080  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {clk_125}]  0.080  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -rise_to [get_clocks {~ALTERA_CLKUSR~}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {~ALTERA_CLKUSR~}] -fall_to [get_clocks {~ALTERA_CLKUSR~}]  0.030  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -to [get_registers {*alt_xcvr_resync*sync_r[0]}]
set_false_path -to [get_keepers {*sld_synchronizer_no_reset:*|din_s1}]
set_false_path -from [get_registers {*|altera_tse_shared_register_map:U_REG|command_config[9]}] -to [get_registers {*altera_tse_fifoless_mac_tx:U_TX|*}]
set_false_path -from [get_registers {*|altera_tse_shared_register_map:U_REG|mac_0[*]}] -to [get_registers {*|altera_tse_fifoless_mac_tx:U_TX|*}]
set_false_path -from [get_registers {*|altera_tse_shared_register_map:U_REG|mac_1[*]}] -to [get_registers {*|altera_tse_fifoless_mac_tx:U_TX|*}]
set_false_path -from [get_registers {*|altera_tse_shared_register_map:U_REG|mac_0[*]}] -to [get_registers {*|altera_tse_fifoless_mac_rx:U_RX|*}]
set_false_path -from [get_registers {*|altera_tse_shared_register_map:U_REG|mac_1[*]}] -to [get_registers {*|altera_tse_fifoless_mac_rx:U_RX|*}]
set_false_path -from [get_registers {*|altera_tse_shared_register_map:U_REG|frm_length[*]}] -to [get_registers {*|altera_tse_fifoless_mac_rx:U_RX|*}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|altera_tse_reset_synchronizer:*|altera_tse_reset_synchronizer_chain*|clrn}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_10g_krfec_rx_pld_rst_n*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_8g_g3_rx_pld_rst_n*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pmaif_rx_pld_rst_n*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_bitslip*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_rx_prbs_err_clr*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_polinv_tx*}]
set_false_path -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_polinv_rx*}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_registers *] -to [get_registers {*altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_3|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_2|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_3|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_2|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_buffer[*]}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_toggle}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_toggle_flopped}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_buffer[*]}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_toggle}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_toggle_flopped}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers *] -to [get_registers {*altera_tse_false_path_marker:*|data_out_reg*}] 100.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pmaif_tx_pld_rst_n}] 50.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_8g_g3_tx_pld_rst_n}] 50.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_10g_krfec_tx_pld_rst_n}] 50.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pma_txpma_rstb}] 20.000
set_max_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pma_rxpma_rstb}] 20.000
set_max_delay -from [get_registers {auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|auto_signaltap_auto_signaltap_0|sld_signaltap_inst|sld_signaltap_body|sld_signaltap_body|jtag_acq_clk_xing|intel_stp_status_bits_cdc_u1|stp_status_bits_in_reg_acq[*]}] -to [get_registers {auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|auto_signaltap_auto_signaltap_0|sld_signaltap_inst|sld_signaltap_body|sld_signaltap_body|jtag_acq_clk_xing|intel_stp_status_bits_cdc_u1|stp_status_bits_out_reg_tck[*]}] 30.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_registers *] -to [get_registers {*altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_3|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_2|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_3|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_2|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_buffer[*]}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_toggle}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_toggle_flopped}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_buffer[*]}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_toggle}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_toggle_flopped}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers *] -to [get_registers {*altera_tse_false_path_marker:*|data_out_reg*}] -100.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pmaif_tx_pld_rst_n}] -50.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_8g_g3_tx_pld_rst_n}] -50.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_10g_krfec_tx_pld_rst_n}] -50.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pma_txpma_rstb}] -10.000
set_min_delay -to [get_pins -compatibility_mode {*twentynm_xcvr_native_inst|*inst_twentynm_pcs|*twentynm_hssi_*_pld_pcs_interface*|pld_pma_rxpma_rstb}] -10.000


#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Net Delay
#**************************************************************

set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*|q}] -to [get_registers {*altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_clock_crosser:*|in_data_toggle|q}] -to [get_registers {*altera_tse_clock_crosser:*|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_clock_crosser:*|out_data_toggle_flopped|q}] -to [get_registers {*altera_tse_clock_crosser:*|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}]
set_net_delay -max 4.000 -from [get_pins -compatibility_mode {*altera_tse_clock_crosser:*|in_data_buffer[*]|q}] -to [get_registers {*altera_tse_clock_crosser:*|out_data_buffer[*]}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_24:*|altera_tse_gray_cnt:U_RD|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_24:*|altera_tse_gray_cnt:U_WRT|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*|q}] -to [get_registers {*altera_tse_false_path_marker:*|data_out_reg*}]


#**************************************************************
# Set Max Skew
#**************************************************************

set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_toggle system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_buffer[*]}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_toggle system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|in_data_buffer[*]}] -to [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_pcs_control:U_REG|altera_tse_mdio_reg:U_REG|altera_tse_clock_crosser:i_partner_ability_clock_crosser|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_3|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_2|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_3|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_2|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_tx_converter:U_TXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_0|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {system_design:platform_design|tse:tse|tse_altera_eth_tse_1950_vweooxa:tse|altera_eth_tse_pcs_pma_nf_phyip:i_tse_pcs_1|altera_tse_top_1000_base_x_strx_gx:altera_tse_top_1000_base_x_strx_gx_inst|altera_tse_top_sgmii_strx_gx:U_SGMII|altera_tse_top_rx_converter:U_RXCV|altera_tse_a_fifo_24:U_DSW|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:*altera_std_synchronizer_nocut:*|din_s1*}] 7.500 


#**************************************************************
# Set Disable Timing
#**************************************************************

set_disable_timing -from * -to * [get_cells -hierarchical {VVYU6267_0}]
set_disable_timing -from * -to * [get_cells -hierarchical {XWCN9723_0}]
set_disable_timing -from * -to * [get_cells -hierarchical {XWCN9723_1}]
set_disable_timing -from * -to * [get_cells -hierarchical {XWCN9723_2}]
set_disable_timing -from * -to * [get_cells -hierarchical {XWCN9723_3}]
set_disable_timing -from * -to * [get_cells -hierarchical {XWCN9723_4}]
set_disable_timing -from * -to * [get_cells -hierarchical {XWCN9723_5}]
set_disable_timing -from * -to * [get_cells -hierarchical {XWCN9723_6}]
set_disable_timing -from * -to * [get_cells -hierarchical {XWCN9723_7}]
set_disable_timing -from * -to * [get_cells -hierarchical {BVXN3148_0}]
