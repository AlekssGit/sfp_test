# TCL File Generated by Component Editor 21.3
# Fri May 19 14:49:11 MSK 2023
# DO NOT MODIFY


# 
# send_packet_ddr "send_packet_ddr" v1.0
#  2023.05.19.14:49:11
# 
# 

# 
# request TCL package from ACDS 21.3
# 
package require -exact qsys 21.3


# 
# module send_packet_ddr
# 
set_module_property DESCRIPTION ""
set_module_property NAME send_packet_ddr
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME send_packet_ddr
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
set_fileset_property QUARTUS_SYNTH TOP_LEVEL send_packet_ddr
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file send_packet_ddr.sv SYSTEM_VERILOG PATH modules/sfp/send_packet_ddr.sv TOP_LEVEL_FILE
add_fileset_file avalon_mm_ddr.sv SYSTEM_VERILOG PATH modules/ddr/avalon_mm_ddr.sv
add_fileset_file external_ram_256.sv SYSTEM_VERILOG PATH modules/ddr/external_ram_256.sv

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL send_packet_ddr
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file send_packet_ddr.sv SYSTEM_VERILOG PATH modules/sfp/send_packet_ddr.sv
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
set_interface_property avalon_master associatedClock clock_ddr
set_interface_property avalon_master associatedReset reset_ddr
set_interface_property avalon_master bitsPerSymbol 8
set_interface_property avalon_master burstOnBurstBoundariesOnly false
set_interface_property avalon_master burstcountUnits WORDS
set_interface_property avalon_master doStreamReads false
set_interface_property avalon_master doStreamWrites false
set_interface_property avalon_master holdTime 0
set_interface_property avalon_master linewrapBursts false
set_interface_property avalon_master maximumPendingReadTransactions 64
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
# connection point clock_ddr
# 
add_interface clock_ddr clock end
set_interface_property clock_ddr ENABLED true
set_interface_property clock_ddr EXPORT_OF ""
set_interface_property clock_ddr PORT_NAME_MAP ""
set_interface_property clock_ddr CMSIS_SVD_VARIABLES ""
set_interface_property clock_ddr SVD_ADDRESS_GROUP ""
set_interface_property clock_ddr IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port clock_ddr avalon_clk clk Input 1


# 
# connection point clock_tse
# 
add_interface clock_tse clock end
set_interface_property clock_tse ENABLED true
set_interface_property clock_tse EXPORT_OF ""
set_interface_property clock_tse PORT_NAME_MAP ""
set_interface_property clock_tse CMSIS_SVD_VARIABLES ""
set_interface_property clock_tse SVD_ADDRESS_GROUP ""
set_interface_property clock_tse IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port clock_tse clk_original clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock ""
set_interface_property reset synchronousEdges NONE
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""
set_interface_property reset IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port reset rst reset Input 1


# 
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clock_tse
set_interface_property avalon_streaming_source associatedReset reset
set_interface_property avalon_streaming_source dataBitsPerSymbol 8
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 0
set_interface_property avalon_streaming_source readyAllowance 0
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true
set_interface_property avalon_streaming_source EXPORT_OF ""
set_interface_property avalon_streaming_source PORT_NAME_MAP ""
set_interface_property avalon_streaming_source CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_source SVD_ADDRESS_GROUP ""
set_interface_property avalon_streaming_source IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port avalon_streaming_source ff_tx_data data Output 8
add_interface_port avalon_streaming_source ff_tx_eop endofpacket Output 1
add_interface_port avalon_streaming_source ff_tx_err error Output 1
add_interface_port avalon_streaming_source ff_tx_rdy ready Input 1
add_interface_port avalon_streaming_source ff_tx_sop startofpacket Output 1
add_interface_port avalon_streaming_source ff_tx_wren valid Output 1


# 
# connection point reset_ddr
# 
add_interface reset_ddr reset end
set_interface_property reset_ddr associatedClock ""
set_interface_property reset_ddr synchronousEdges NONE
set_interface_property reset_ddr ENABLED true
set_interface_property reset_ddr EXPORT_OF ""
set_interface_property reset_ddr PORT_NAME_MAP ""
set_interface_property reset_ddr CMSIS_SVD_VARIABLES ""
set_interface_property reset_ddr SVD_ADDRESS_GROUP ""
set_interface_property reset_ddr IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port reset_ddr avalon_reset reset Input 1


# 
# connection point control
# 
add_interface control conduit end
set_interface_property control associatedClock ""
set_interface_property control associatedReset ""
set_interface_property control ENABLED true
set_interface_property control EXPORT_OF ""
set_interface_property control PORT_NAME_MAP ""
set_interface_property control CMSIS_SVD_VARIABLES ""
set_interface_property control SVD_ADDRESS_GROUP ""
set_interface_property control IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port control start_ram_addr start_ram_addr Input 25
add_interface_port control cmd_send cmd_send Input 1

