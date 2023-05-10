# TCL File Generated by Component Editor 21.3
# Wed May 10 18:54:50 MSK 2023
# DO NOT MODIFY


# 
# setup_ddr "setup_ddr" v1.0
#  2023.05.10.18:54:50
# 
# 

# 
# request TCL package from ACDS 21.3
# 
package require -exact qsys 21.3


# 
# module setup_ddr
# 
set_module_property DESCRIPTION ""
set_module_property NAME setup_ddr
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME setup_ddr
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false
set_module_property LOAD_ELABORATION_LIMIT 0


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL setup_ddr_data_256
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file setup_ddr_data_256.sv SYSTEM_VERILOG PATH modules/ddr/setup_ddr_data_256.sv TOP_LEVEL_FILE
add_fileset_file avalon_mm_ddr.sv SYSTEM_VERILOG PATH modules/ddr/avalon_mm_ddr.sv
add_fileset_file external_ram_256.sv SYSTEM_VERILOG PATH modules/ddr/external_ram_256.sv

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL setup_ddr_data_256
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file setup_ddr_data_256.sv SYSTEM_VERILOG PATH modules/ddr/setup_ddr_data_256.sv
add_fileset_file avalon_mm_ddr.sv SYSTEM_VERILOG PATH modules/ddr/avalon_mm_ddr.sv
add_fileset_file external_ram_256.sv SYSTEM_VERILOG PATH modules/ddr/external_ram_256.sv


# 
# parameters
# 


# 
# display items
# 


# 
# connection point avalon_master
# 
add_interface avalon_master avalon start
set_interface_property avalon_master addressGroup 0
set_interface_property avalon_master addressUnits WORDS
set_interface_property avalon_master associatedClock clock_avalon
set_interface_property avalon_master associatedReset reset_avalon
set_interface_property avalon_master bitsPerSymbol 8
set_interface_property avalon_master burstOnBurstBoundariesOnly false
set_interface_property avalon_master burstcountUnits WORDS
set_interface_property avalon_master doStreamReads false
set_interface_property avalon_master doStreamWrites false
set_interface_property avalon_master holdTime 0
set_interface_property avalon_master linewrapBursts false
set_interface_property avalon_master maximumPendingReadTransactions 0
set_interface_property avalon_master maximumPendingWriteTransactions 0
set_interface_property avalon_master minimumResponseLatency 1
set_interface_property avalon_master readLatency 0
set_interface_property avalon_master readWaitTime 1
set_interface_property avalon_master setupTime 0
set_interface_property avalon_master timingUnits Cycles
set_interface_property avalon_master waitrequestAllowance 0
set_interface_property avalon_master writeWaitTime 0
set_interface_property avalon_master ENABLED true
set_interface_property avalon_master EXPORT_OF ""
set_interface_property avalon_master PORT_NAME_MAP ""
set_interface_property avalon_master CMSIS_SVD_VARIABLES ""
set_interface_property avalon_master SVD_ADDRESS_GROUP ""
set_interface_property avalon_master IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port avalon_master amm_addr address Output 25
add_interface_port avalon_master amm_readdata readdata Input 256
add_interface_port avalon_master amm_writedata writedata Output 256
add_interface_port avalon_master amm_read read Output 1
add_interface_port avalon_master amm_write write Output 1
add_interface_port avalon_master amm_byteenable byteenable Output 32
add_interface_port avalon_master amm_burstcount burstcount Output 7
add_interface_port avalon_master amm_readdatavalid readdatavalid Input 1
add_interface_port avalon_master amm_ready waitrequest Input 1


# 
# connection point setup
# 
add_interface setup conduit end
set_interface_property setup associatedClock ""
set_interface_property setup associatedReset ""
set_interface_property setup ENABLED true
set_interface_property setup EXPORT_OF ""
set_interface_property setup PORT_NAME_MAP ""
set_interface_property setup CMSIS_SVD_VARIABLES ""
set_interface_property setup SVD_ADDRESS_GROUP ""
set_interface_property setup IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port setup setup_done setup_done Output 1


# 
# connection point ddr_status
# 
add_interface ddr_status conduit end
set_interface_property ddr_status associatedClock ""
set_interface_property ddr_status associatedReset ""
set_interface_property ddr_status ENABLED true
set_interface_property ddr_status EXPORT_OF ""
set_interface_property ddr_status PORT_NAME_MAP ""
set_interface_property ddr_status CMSIS_SVD_VARIABLES ""
set_interface_property ddr_status SVD_ADDRESS_GROUP ""
set_interface_property ddr_status IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port ddr_status local_cal_success_avalon local_cal_success Input 1
add_interface_port ddr_status local_cal_fail_avalon local_cal_fail Input 1


# 
# connection point ddr_ready
# 
add_interface ddr_ready conduit end
set_interface_property ddr_ready associatedClock ""
set_interface_property ddr_ready associatedReset ""
set_interface_property ddr_ready ENABLED true
set_interface_property ddr_ready EXPORT_OF ""
set_interface_property ddr_ready PORT_NAME_MAP ""
set_interface_property ddr_ready CMSIS_SVD_VARIABLES ""
set_interface_property ddr_ready SVD_ADDRESS_GROUP ""
set_interface_property ddr_ready IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port ddr_ready ram_ready ram_ready Input 1


# 
# connection point clock_125_tx_rx
# 
add_interface clock_125_tx_rx clock end
set_interface_property clock_125_tx_rx ENABLED true
set_interface_property clock_125_tx_rx EXPORT_OF ""
set_interface_property clock_125_tx_rx PORT_NAME_MAP ""
set_interface_property clock_125_tx_rx CMSIS_SVD_VARIABLES ""
set_interface_property clock_125_tx_rx SVD_ADDRESS_GROUP ""
set_interface_property clock_125_tx_rx IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port clock_125_tx_rx clk clk Input 1


# 
# connection point clock_avalon
# 
add_interface clock_avalon clock end
set_interface_property clock_avalon ENABLED true
set_interface_property clock_avalon EXPORT_OF ""
set_interface_property clock_avalon PORT_NAME_MAP ""
set_interface_property clock_avalon CMSIS_SVD_VARIABLES ""
set_interface_property clock_avalon SVD_ADDRESS_GROUP ""
set_interface_property clock_avalon IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port clock_avalon avalon_clk clk Input 1


# 
# connection point clock_50
# 
add_interface clock_50 clock end
set_interface_property clock_50 ENABLED true
set_interface_property clock_50 EXPORT_OF ""
set_interface_property clock_50 PORT_NAME_MAP ""
set_interface_property clock_50 CMSIS_SVD_VARIABLES ""
set_interface_property clock_50 SVD_ADDRESS_GROUP ""
set_interface_property clock_50 IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port clock_50 clk_50 clk Input 1


# 
# connection point reset_board
# 
add_interface reset_board reset end
set_interface_property reset_board associatedClock ""
set_interface_property reset_board synchronousEdges NONE
set_interface_property reset_board ENABLED true
set_interface_property reset_board EXPORT_OF ""
set_interface_property reset_board PORT_NAME_MAP ""
set_interface_property reset_board CMSIS_SVD_VARIABLES ""
set_interface_property reset_board SVD_ADDRESS_GROUP ""
set_interface_property reset_board IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port reset_board rst_n reset Input 1


# 
# connection point reset_avalon
# 
add_interface reset_avalon reset end
set_interface_property reset_avalon associatedClock clock_avalon
set_interface_property reset_avalon synchronousEdges DEASSERT
set_interface_property reset_avalon ENABLED true
set_interface_property reset_avalon EXPORT_OF ""
set_interface_property reset_avalon PORT_NAME_MAP ""
set_interface_property reset_avalon CMSIS_SVD_VARIABLES ""
set_interface_property reset_avalon SVD_ADDRESS_GROUP ""
set_interface_property reset_avalon IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port reset_avalon avalon_reset reset Input 1


# 
# connection point reset_module
# 
add_interface reset_module reset end
set_interface_property reset_module associatedClock ""
set_interface_property reset_module synchronousEdges NONE
set_interface_property reset_module ENABLED true
set_interface_property reset_module EXPORT_OF ""
set_interface_property reset_module PORT_NAME_MAP ""
set_interface_property reset_module CMSIS_SVD_VARIABLES ""
set_interface_property reset_module SVD_ADDRESS_GROUP ""
set_interface_property reset_module IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port reset_module reset reset Input 1


# 
# connection point cal_success
# 
add_interface cal_success conduit end
set_interface_property cal_success associatedClock ""
set_interface_property cal_success associatedReset ""
set_interface_property cal_success ENABLED true
set_interface_property cal_success EXPORT_OF ""
set_interface_property cal_success PORT_NAME_MAP ""
set_interface_property cal_success CMSIS_SVD_VARIABLES ""
set_interface_property cal_success SVD_ADDRESS_GROUP ""
set_interface_property cal_success IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port cal_success reset_local_cal_success cal_success Output 1


# 
# connection point ddr_status_out
# 
add_interface ddr_status_out conduit end
set_interface_property ddr_status_out associatedClock ""
set_interface_property ddr_status_out associatedReset ""
set_interface_property ddr_status_out ENABLED true
set_interface_property ddr_status_out EXPORT_OF ""
set_interface_property ddr_status_out PORT_NAME_MAP ""
set_interface_property ddr_status_out CMSIS_SVD_VARIABLES ""
set_interface_property ddr_status_out SVD_ADDRESS_GROUP ""
set_interface_property ddr_status_out IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port ddr_status_out ddr_local_cal_success local_cal_success Output 1
add_interface_port ddr_status_out ddr_local_cal_fail local_cal_fail Output 1


# 
# connection point resets_information
# 
add_interface resets_information conduit end
set_interface_property resets_information associatedClock ""
set_interface_property resets_information associatedReset ""
set_interface_property resets_information ENABLED true
set_interface_property resets_information EXPORT_OF ""
set_interface_property resets_information PORT_NAME_MAP ""
set_interface_property resets_information CMSIS_SVD_VARIABLES ""
set_interface_property resets_information SVD_ADDRESS_GROUP ""
set_interface_property resets_information IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port resets_information system_main_reset main_reset Output 1
add_interface_port resets_information ddr_avalon_rst ddr_avalon_reset Output 1
add_interface_port resets_information board_reset board_reset Output 1


# 
# connection point ddr_setup_cmd
# 
add_interface ddr_setup_cmd conduit end
set_interface_property ddr_setup_cmd associatedClock ""
set_interface_property ddr_setup_cmd associatedReset ""
set_interface_property ddr_setup_cmd ENABLED true
set_interface_property ddr_setup_cmd EXPORT_OF ""
set_interface_property ddr_setup_cmd PORT_NAME_MAP ""
set_interface_property ddr_setup_cmd CMSIS_SVD_VARIABLES ""
set_interface_property ddr_setup_cmd SVD_ADDRESS_GROUP ""
set_interface_property ddr_setup_cmd IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port ddr_setup_cmd ddr_setup_cmd_pci ddr_setup_cmd Input 1

