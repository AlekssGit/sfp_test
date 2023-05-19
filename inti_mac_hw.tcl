# TCL File Generated by Component Editor 21.3
# Thu May 18 19:33:02 MSK 2023
# DO NOT MODIFY


# 
# init_mac "init_mac" v1.0
#  2023.05.18.19:33:02
# 
# 

# 
# request TCL package from ACDS 21.3
# 
package require -exact qsys 21.3


# 
# module init_mac
# 
set_module_property DESCRIPTION ""
set_module_property NAME init_mac
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME init_mac
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
set_fileset_property QUARTUS_SYNTH TOP_LEVEL mac_init_top
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file mac_init_top.sv SYSTEM_VERILOG PATH modules/mac_init_top.sv TOP_LEVEL_FILE
add_fileset_file avalon_mm_tse_init.sv SYSTEM_VERILOG PATH modules/avalon_mm_tse_init.sv
add_fileset_file initiate_mac.sv SYSTEM_VERILOG PATH modules/initiate_mac.sv
add_fileset_file mac_defines.sv SYSTEM_VERILOG PATH modules/mac_defines.sv

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL mac_init_top
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file mac_init_top.sv SYSTEM_VERILOG PATH modules/mac_init_top.sv
add_fileset_file avalon_mm_tse_init.sv SYSTEM_VERILOG PATH modules/avalon_mm_tse_init.sv
add_fileset_file initiate_mac.sv SYSTEM_VERILOG PATH modules/initiate_mac.sv
add_fileset_file mac_defines.sv SYSTEM_VERILOG PATH modules/mac_defines.sv


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""
set_interface_property clock IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""
set_interface_property reset IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port reset reset reset Input 1


# 
# connection point avalon_master
# 
add_interface avalon_master avalon start
set_interface_property avalon_master addressGroup 0
set_interface_property avalon_master addressUnits WORDS
set_interface_property avalon_master associatedClock clock
set_interface_property avalon_master associatedReset reset
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
set_interface_property avalon_master writeWaitTime 1
set_interface_property avalon_master ENABLED true
set_interface_property avalon_master EXPORT_OF ""
set_interface_property avalon_master PORT_NAME_MAP ""
set_interface_property avalon_master CMSIS_SVD_VARIABLES ""
set_interface_property avalon_master SVD_ADDRESS_GROUP ""
set_interface_property avalon_master IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port avalon_master ADR_O address Output 10
add_interface_port avalon_master DAT_I readdata Input 32
add_interface_port avalon_master DAT_O writedata Output 32
add_interface_port avalon_master RD read Output 1
add_interface_port avalon_master WR write Output 1
add_interface_port avalon_master BUSY waitrequest Input 1


# 
# connection point mac_inited
# 
add_interface mac_inited conduit end
set_interface_property mac_inited associatedClock clock
set_interface_property mac_inited associatedReset reset
set_interface_property mac_inited ENABLED true
set_interface_property mac_inited EXPORT_OF ""
set_interface_property mac_inited PORT_NAME_MAP ""
set_interface_property mac_inited CMSIS_SVD_VARIABLES ""
set_interface_property mac_inited SVD_ADDRESS_GROUP ""
set_interface_property mac_inited IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port mac_inited mac_inited mac_inited Output 1

