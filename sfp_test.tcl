# Copyright (C) 2021  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: sfp_test.tcl
# Generated on: Wed May 10 18:35:09 2023

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "sfp_test"]} {
		puts "Project sfp_test is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists sfp_test]} {
		project_open -revision sfp_test sfp_test
	} else {
		project_new -revision sfp_test sfp_test
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone 10 GX"
	set_global_assignment -name TOP_LEVEL_ENTITY sfp_test_top
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 21.4.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "14:30:14  MAY 15, 2022"
	set_global_assignment -name LAST_QUARTUS_VERSION "21.3.0 Pro Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 100
	set_global_assignment -name DEVICE 10CX220YF780I5G
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name EDA_SIMULATION_TOOL "QuestaSim (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name ENABLE_SIGNALTAP OFF
	set_global_assignment -name USE_SIGNALTAP_FILE output_files/stp.stp
	set_global_assignment -name POWER_USE_DEVICE_CHARACTERISTICS TYPICAL
	set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 0.9V
	set_global_assignment -name VCCBAT_USER_VOLTAGE 1.8V
	set_global_assignment -name NUM_PARALLEL_PROCESSORS ALL
	set_global_assignment -name VERILOG_INPUT_VERSION SYSTEMVERILOG_2012
	set_global_assignment -name SYSTEMVERILOG_FILE modules/expander_gpio/expander_top.sv
	set_global_assignment -name SDC_FILE sfp_test.sdc
	set_global_assignment -name SYSTEMVERILOG_FILE modules/expander_gpio/i2c_master.sv
	set_global_assignment -name SYSTEMVERILOG_FILE modules/expander_gpio/i2c_expander_mm.sv
	set_global_assignment -name SYSTEMVERILOG_FILE modules/expander_gpio/i2c_expander_ctrl.sv
	set_global_assignment -name SYSTEMVERILOG_FILE modules/expander_gpio/i2c_expander.sv
	set_global_assignment -name SYSTEMVERILOG_FILE modules/expander_gpio/generator.sv
	set_global_assignment -name SYSTEMVERILOG_FILE modules/expander_gpio/control_i2c_master.sv
	set_global_assignment -name SYSTEMVERILOG_FILE modules/phyip_reset.sv
	set_global_assignment -name SYSTEMVERILOG_FILE sfp_test_top.sv
	set_global_assignment -name QSYS_FILE system_design.qsys
	set_global_assignment -name IP_FILE ip/system_design/tse.ip
	set_global_assignment -name IP_FILE ip/system_design/send_packet_1.ip
	set_global_assignment -name IP_FILE ip/system_design/pll.ip
	set_global_assignment -name IP_FILE ip/system_design/reset_mod.ip
	set_global_assignment -name IP_FILE ip/system_design/init_mac.ip
	set_global_assignment -name IP_FILE ip/system_design/clock_50_out.ip
	set_global_assignment -name IP_FILE ip/system_design/reset_main.ip
	set_global_assignment -name IP_FILE ip/system_design/receive_packet_1.ip
	set_global_assignment -name IP_FILE ip/system_design/receive_packet_0.ip
	set_global_assignment -name IP_FILE ip/system_design/mem_3.ip
	set_global_assignment -name IP_FILE ip/system_design/mem_rcv_0.ip
	set_global_assignment -name IP_FILE ip/system_design/xcvr_pll.ip
	set_global_assignment -name SIGNALTAP_FILE output_files/stp.stp
	set_global_assignment -name IP_FILE ip/system_design/mem_4.ip
	set_global_assignment -name IP_FILE ip/system_design/mem_5.ip
	set_global_assignment -name CDF_FILE output_files/programmer.cdf
	set_global_assignment -name IP_FILE ip/system_design/ddr3.ip
	set_global_assignment -name IP_FILE ip/system_design/clock_ddr_avalon.ip
	set_global_assignment -name IP_FILE ip/system_design/ddr_avalon_reset.ip
	set_global_assignment -name IP_FILE ip/system_design/setup_ddr.ip
	set_global_assignment -name IP_FILE ip/system_design/pcie.ip
	set_global_assignment -name IP_FILE ip/system_design/send_cmd_pcie.ip
	set_instance_assignment -name IO_STANDARD LVDS -to clk_125_lvds_tse -entity sfp_test_top
	set_location_assignment PIN_N24 -to clk_125_lvds_tse
	set_location_assignment PIN_N23 -to "clk_125_lvds_tse(n)"
	set_location_assignment PIN_F26 -to sgmii_rx_1
	set_location_assignment PIN_G28 -to sgmii_tx_1
	set_location_assignment PIN_H26 -to sgmii_rx_2
	set_location_assignment PIN_J28 -to sgmii_tx_2
	set_location_assignment PIN_J23 -to clk_50
	set_location_assignment PIN_AC12 -to rst_n
	set_location_assignment PIN_AF6 -to sfp_rlos_led
	set_location_assignment PIN_AE6 -to sfp_prsn_led
	set_location_assignment PIN_AC6 -to sfp_txflt_led
	set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to sgmii_tx_1 -entity sfp_test_top
	set_location_assignment PIN_G27 -to "sgmii_tx_1(n)"
	set_instance_assignment -name IO_STANDARD "CURRENT MODE LOGIC (CML)" -to sgmii_rx_1 -entity sfp_test_top
	set_location_assignment PIN_AC7 -to blink_led
	set_instance_assignment -name IO_STANDARD "CURRENT MODE LOGIC (CML)" -to sgmii_rx_2 -entity sfp_test_top
	set_instance_assignment -name PARTITION_COLOUR 4290999807 -to sfp_test_top -entity sfp_test_top
	set_instance_assignment -name PARTITION_COLOUR 4294938189 -to auto_fab_0 -entity sfp_test_top
	set_location_assignment PIN_H21 -to i2c_scl_2
	set_location_assignment PIN_H20 -to i2c_sda_2
	set_location_assignment PIN_E21 -to i2c_scl_1
	set_location_assignment PIN_D22 -to i2c_sda_1
	set_location_assignment PIN_AA18 -to clk_ddr
	set_location_assignment PIN_AA19 -to "clk_ddr(n)"
	set_location_assignment PIN_AG19 -to mem_a[0]
	set_location_assignment PIN_AG20 -to mem_a[1]
	set_location_assignment PIN_AH22 -to mem_a[2]
	set_location_assignment PIN_AG21 -to mem_a[3]
	set_location_assignment PIN_AF21 -to mem_a[4]
	set_location_assignment PIN_AE21 -to mem_a[5]
	set_location_assignment PIN_AC21 -to mem_a[6]
	set_location_assignment PIN_AB21 -to mem_a[7]
	set_location_assignment PIN_AH21 -to mem_a[8]
	set_location_assignment PIN_AH20 -to mem_a[9]
	set_location_assignment PIN_AC20 -to mem_a[10]
	set_location_assignment PIN_AB20 -to mem_a[11]
	set_location_assignment PIN_Y19 -to mem_a[12]
	set_location_assignment PIN_AA17 -to mem_a[13]
	set_location_assignment PIN_Y17 -to mem_a[14]
	set_location_assignment PIN_W21 -to mem_ba[0]
	set_location_assignment PIN_AA21 -to mem_ba[1]
	set_location_assignment PIN_Y21 -to mem_ba[2]
	set_location_assignment PIN_W20 -to mem_cas_n
	set_location_assignment PIN_AE23 -to mem_ck
	set_location_assignment PIN_AD23 -to mem_ck_n
	set_location_assignment PIN_AA23 -to mem_cke[0]
	set_location_assignment PIN_AF22 -to mem_cs_n[0]
	set_location_assignment PIN_C12 -to mem_dm[0]
	set_location_assignment PIN_B14 -to mem_dm[1]
	set_location_assignment PIN_B24 -to mem_dm[2]
	set_location_assignment PIN_B16 -to mem_dm[3]
	set_location_assignment PIN_AH16 -to mem_dm[4]
	set_location_assignment PIN_C10 -to mem_dq[0]
	set_location_assignment PIN_B10 -to mem_dq[1]
	set_location_assignment PIN_D10 -to mem_dq[2]
	set_location_assignment PIN_B9 -to mem_dq[3]
	set_location_assignment PIN_D8 -to mem_dq[4]
	set_location_assignment PIN_D9 -to mem_dq[5]
	set_location_assignment PIN_C11 -to mem_dq[6]
	set_location_assignment PIN_C8 -to mem_dq[7]
	set_location_assignment PIN_A11 -to mem_dq[8]
	set_location_assignment PIN_B15 -to mem_dq[9]
	set_location_assignment PIN_B11 -to mem_dq[10]
	set_location_assignment PIN_D13 -to mem_dq[11]
	set_location_assignment PIN_A13 -to mem_dq[12]
	set_location_assignment PIN_D14 -to mem_dq[13]
	set_location_assignment PIN_A12 -to mem_dq[14]
	set_location_assignment PIN_C13 -to mem_dq[15]
	set_location_assignment PIN_B26 -to mem_dq[16]
	set_location_assignment PIN_B23 -to mem_dq[17]
	set_location_assignment PIN_B25 -to mem_dq[18]
	set_location_assignment PIN_A22 -to mem_dq[19]
	set_location_assignment PIN_B21 -to mem_dq[20]
	set_location_assignment PIN_C21 -to mem_dq[21]
	set_location_assignment PIN_A24 -to mem_dq[22]
	set_location_assignment PIN_A21 -to mem_dq[23]
	set_location_assignment PIN_D15 -to mem_dq[24]
	set_location_assignment PIN_A19 -to mem_dq[25]
	set_location_assignment PIN_C15 -to mem_dq[26]
	set_location_assignment PIN_B20 -to mem_dq[27]
	set_location_assignment PIN_A18 -to mem_dq[28]
	set_location_assignment PIN_C20 -to mem_dq[29]
	set_location_assignment PIN_A17 -to mem_dq[30]
	set_location_assignment PIN_E15 -to mem_dq[31]
	set_location_assignment PIN_AH15 -to mem_dq[32]
	set_location_assignment PIN_AH13 -to mem_dq[33]
	set_location_assignment PIN_AH17 -to mem_dq[34]
	set_location_assignment PIN_AG13 -to mem_dq[35]
	set_location_assignment PIN_AH12 -to mem_dq[36]
	set_location_assignment PIN_AG10 -to mem_dq[37]
	set_location_assignment PIN_AH18 -to mem_dq[38]
	set_location_assignment PIN_AG11 -to mem_dq[39]
	set_location_assignment PIN_A9 -to mem_dqs[0]
	set_location_assignment PIN_A8 -to mem_dqs_n[0]
	set_location_assignment PIN_A14 -to mem_dqs[1]
	set_location_assignment PIN_B13 -to mem_dqs_n[1]
	set_location_assignment PIN_A27 -to mem_dqs[2]
	set_location_assignment PIN_A26 -to mem_dqs_n[2]
	set_location_assignment PIN_B19 -to mem_dqs[3]
	set_location_assignment PIN_B18 -to mem_dqs_n[3]
	set_location_assignment PIN_AH11 -to mem_dqs[4]
	set_location_assignment PIN_AH10 -to mem_dqs_n[4]
	set_location_assignment PIN_AC23 -to mem_odt[0]
	set_location_assignment PIN_AB19 -to mem_ras_n
	set_location_assignment PIN_AC22 -to mem_reset_n
	set_location_assignment PIN_AD22 -to mem_we_n
	set_location_assignment PIN_Y20 -to oct_rzqin
	set_location_assignment PIN_R24 -to pcie_clk
	set_instance_assignment -name IO_STANDARD "CURRENT MODE LOGIC (CML)" -to pcie_clk -entity sfp_test_top
	set_location_assignment PIN_R23 -to "pcie_clk(n)"
	set_instance_assignment -name IO_STANDARD "1.2-V HSTL CLASS I" -to pcie_perst -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "CURRENT MODE LOGIC (CML)" -to pcie_rx_in0 -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "CURRENT MODE LOGIC (CML)" -to pcie_rx_in1 -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "CURRENT MODE LOGIC (CML)" -to pcie_rx_in2 -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "CURRENT MODE LOGIC (CML)" -to pcie_rx_in3 -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to pcie_tx_out0 -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to pcie_tx_out1 -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to pcie_tx_out2 -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "HIGH SPEED DIFFERENTIAL I/O" -to pcie_tx_out3 -entity sfp_test_top
	set_location_assignment PIN_AB11 -to pcie_perst
	set_location_assignment PIN_V26 -to pcie_rx_in0
	set_location_assignment PIN_V25 -to "pcie_rx_in0(n)"
	set_location_assignment PIN_T26 -to pcie_rx_in1
	set_location_assignment PIN_T25 -to "pcie_rx_in1(n)"
	set_location_assignment PIN_P26 -to pcie_rx_in2
	set_location_assignment PIN_P25 -to "pcie_rx_in2(n)"
	set_location_assignment PIN_M26 -to pcie_rx_in3
	set_location_assignment PIN_M25 -to "pcie_rx_in3(n)"
	set_location_assignment PIN_W28 -to pcie_tx_out0
	set_location_assignment PIN_W27 -to "pcie_tx_out0(n)"
	set_location_assignment PIN_U28 -to pcie_tx_out1
	set_location_assignment PIN_U27 -to "pcie_tx_out1(n)"
	set_location_assignment PIN_R28 -to pcie_tx_out2
	set_location_assignment PIN_R27 -to "pcie_tx_out2(n)"
	set_location_assignment PIN_N28 -to pcie_tx_out3
	set_location_assignment PIN_N27 -to "pcie_tx_out3(n)"
	set_instance_assignment -name IO_STANDARD LVDS -to clk_ddr -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_cas_n -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_ck -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_ras_n -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "1.5 V" -to mem_reset_n -entity sfp_test_top
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_we_n -entity sfp_test_top

	# Including default assignments
	set_global_assignment -name TIMING_ANALYZER_MULTICORNER_ANALYSIS ON -family "Cyclone 10 GX"
	set_global_assignment -name TDC_CCPP_TRADEOFF_TOLERANCE 0 -family "Cyclone 10 GX"
	set_global_assignment -name TIMING_ANALYZER_DO_CCPP_REMOVAL ON -family "Cyclone 10 GX"
	set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON -family "Cyclone 10 GX"
	set_global_assignment -name SYNCHRONIZATION_REGISTER_CHAIN_LENGTH 3 -family "Cyclone 10 GX"
	set_global_assignment -name SYNTH_RESOURCE_AWARE_INFERENCE_FOR_BLOCK_RAM ON -family "Cyclone 10 GX"
	set_global_assignment -name USE_ADVANCED_DETAILED_LAB_LEGALITY ON -family "Cyclone 10 GX"
	set_global_assignment -name ADVANCED_PHYSICAL_SYNTHESIS_REGISTER_PACKING OFF -family "Cyclone 10 GX"
	set_global_assignment -name PHYSICAL_SYNTHESIS OFF -family "Cyclone 10 GX"
	set_global_assignment -name STRATIXV_CONFIGURATION_SCHEME "PASSIVE SERIAL" -family "Cyclone 10 GX"
	set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS" -family "Cyclone 10 GX"
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON -family "Cyclone 10 GX"
	set_global_assignment -name PROGRAMMABLE_POWER_TECHNOLOGY_SETTING AUTOMATIC -family "Cyclone 10 GX"
	set_global_assignment -name ENABLE_PHYSICAL_DSP_MERGING OFF -family "Cyclone 10 GX"
	set_global_assignment -name AUTO_DELAY_CHAINS ON -family "Cyclone 10 GX"
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN ON -family "Cyclone 10 GX"
	set_global_assignment -name ACTIVE_SERIAL_CLOCK FREQ_100MHZ -family "Cyclone 10 GX"
	set_global_assignment -name GENERATE_PR_RBF_FILE OFF -family "Cyclone 10 GX"
	set_global_assignment -name POWER_AUTO_COMPUTE_TJ ON -family "Cyclone 10 GX"

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
