# TCL File Generated by Component Editor 21.3
# Mon Sep 18 23:34:07 MSK 2023
# DO NOT MODIFY


# 
# receive_packet_ddr "receive_packet_ddr" v1.0
#  2023.09.18.23:34:07
# 
# 

# 
# request TCL package from ACDS 21.3
# 
package require -exact qsys 21.3


# 
# module receive_packet_ddr
# 
set_module_property DESCRIPTION ""
set_module_property NAME receive_packet_ddr
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME receive_packet_ddr
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
set_fileset_property QUARTUS_SYNTH TOP_LEVEL receive_packet_ddr
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file receive_packet_ddr.sv SYSTEM_VERILOG PATH modules/sfp/receive_packet_ddr.sv TOP_LEVEL_FILE
add_fileset_file avalon_mm_ddr.sv SYSTEM_VERILOG PATH modules/ddr/avalon_mm_ddr.sv
add_fileset_file external_ram_256.sv SYSTEM_VERILOG PATH modules/ddr/external_ram_256.sv

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL receive_packet_ddr
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file receive_packet_ddr.sv SYSTEM_VERILOG PATH modules/sfp/receive_packet_ddr.sv
add_fileset_file avalon_mm_ddr.sv SYSTEM_VERILOG PATH modules/ddr/avalon_mm_ddr.sv
add_fileset_file external_ram_256.sv SYSTEM_VERILOG PATH modules/ddr/external_ram_256.sv


# 
# parameters
# 


# 
# display items
# 


# 
# connection point avalon_streaming_sink
# 
add_interface avalon_streaming_sink avalon_streaming end
set_interface_property avalon_streaming_sink associatedClock clock_tse
set_interface_property avalon_streaming_sink associatedReset reset
set_interface_property avalon_streaming_sink dataBitsPerSymbol 8
set_interface_property avalon_streaming_sink errorDescriptor ""
set_interface_property avalon_streaming_sink firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_sink maxChannel 0
set_interface_property avalon_streaming_sink readyAllowance 0
set_interface_property avalon_streaming_sink readyLatency 0
set_interface_property avalon_streaming_sink ENABLED true
set_interface_property avalon_streaming_sink EXPORT_OF ""
set_interface_property avalon_streaming_sink PORT_NAME_MAP ""
set_interface_property avalon_streaming_sink CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_sink SVD_ADDRESS_GROUP ""
set_interface_property avalon_streaming_sink IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port avalon_streaming_sink ff_rx_data data Input 8
add_interface_port avalon_streaming_sink ff_rx_eop endofpacket Input 1
add_interface_port avalon_streaming_sink ff_rx_rdy ready Output 1
add_interface_port avalon_streaming_sink ff_rx_sop startofpacket Input 1
add_interface_port avalon_streaming_sink ff_rx_dval valid Input 1
add_interface_port avalon_streaming_sink rx_err error Input 5


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
# connection point fifo_status
# 
add_interface fifo_status avalon_streaming start
set_interface_property fifo_status associatedClock fifo_status_clk
set_interface_property fifo_status associatedReset reset
set_interface_property fifo_status dataBitsPerSymbol 2
set_interface_property fifo_status errorDescriptor ""
set_interface_property fifo_status firstSymbolInHighOrderBits true
set_interface_property fifo_status maxChannel 0
set_interface_property fifo_status readyAllowance 0
set_interface_property fifo_status readyLatency 0
set_interface_property fifo_status ENABLED true
set_interface_property fifo_status EXPORT_OF ""
set_interface_property fifo_status PORT_NAME_MAP ""
set_interface_property fifo_status CMSIS_SVD_VARIABLES ""
set_interface_property fifo_status SVD_ADDRESS_GROUP ""
set_interface_property fifo_status IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port fifo_status rx_afull_data data Output 2
add_interface_port fifo_status rx_afull_valid valid Output 1
add_interface_port fifo_status rx_afull_channel channel Output 1


# 
# connection point rx_signals
# 
add_interface rx_signals conduit end
set_interface_property rx_signals associatedClock clock_tse
set_interface_property rx_signals associatedReset ""
set_interface_property rx_signals ENABLED true
set_interface_property rx_signals EXPORT_OF ""
set_interface_property rx_signals PORT_NAME_MAP ""
set_interface_property rx_signals CMSIS_SVD_VARIABLES ""
set_interface_property rx_signals SVD_ADDRESS_GROUP ""
set_interface_property rx_signals IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port rx_signals size_received size_received Output 12
add_interface_port rx_signals data_saved data_saved Output 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock_tse
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""
set_interface_property reset IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port reset rst reset Input 1


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
# connection point reset_board
# 
add_interface reset_board reset end
set_interface_property reset_board associatedClock clock_tse
set_interface_property reset_board synchronousEdges DEASSERT
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
# connection point reset_ddr
# 
add_interface reset_ddr reset end
set_interface_property reset_ddr associatedClock clock_tse
set_interface_property reset_ddr synchronousEdges DEASSERT
set_interface_property reset_ddr ENABLED true
set_interface_property reset_ddr EXPORT_OF ""
set_interface_property reset_ddr PORT_NAME_MAP ""
set_interface_property reset_ddr CMSIS_SVD_VARIABLES ""
set_interface_property reset_ddr SVD_ADDRESS_GROUP ""
set_interface_property reset_ddr IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port reset_ddr avalon_reset reset Input 1


# 
# connection point fifo_status_clk
# 
add_interface fifo_status_clk clock end
set_interface_property fifo_status_clk ENABLED true
set_interface_property fifo_status_clk EXPORT_OF ""
set_interface_property fifo_status_clk PORT_NAME_MAP ""
set_interface_property fifo_status_clk CMSIS_SVD_VARIABLES ""
set_interface_property fifo_status_clk SVD_ADDRESS_GROUP ""
set_interface_property fifo_status_clk IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port fifo_status_clk fifo_status_clk clk Input 1

