# TCL File Generated by Component Editor 21.4
# Sat Apr 22 18:38:05 MSK 2023
# DO NOT MODIFY


# 
# avalon_mm_ddr "avalon_mm_ddr" v1.0
#  2023.04.22.18:38:05
# 
# 

# 
# request TCL package from ACDS 21.4
# 
package require -exact qsys 21.3


# 
# module avalon_mm_ddr
# 
set_module_property DESCRIPTION ""
set_module_property NAME avalon_mm_ddr
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME avalon_mm_ddr
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
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_mm_my_ddr
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file avalon_mm_my_ddr.sv SYSTEM_VERILOG PATH modules/avalon_mm_my_ddr.sv TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL avalon_mm_my_ddr
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file avalon_mm_my_ddr.sv SYSTEM_VERILOG PATH modules/avalon_mm_my_ddr.sv


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

add_interface_port clock CLK_I clk Input 1


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

add_interface_port reset RST_I reset Input 1


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
set_interface_property avalon_master writeWaitTime 0
set_interface_property avalon_master ENABLED true
set_interface_property avalon_master EXPORT_OF ""
set_interface_property avalon_master PORT_NAME_MAP ""
set_interface_property avalon_master CMSIS_SVD_VARIABLES ""
set_interface_property avalon_master SVD_ADDRESS_GROUP ""
set_interface_property avalon_master IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port avalon_master amm_address_0 address Output 25
add_interface_port avalon_master amm_readdata_0 readdata Input 256
add_interface_port avalon_master amm_writedata_0 writedata Output 256
add_interface_port avalon_master amm_read_0 read Output 1
add_interface_port avalon_master amm_write_0 write Output 1
add_interface_port avalon_master amm_byteenable_0 byteenable Output 32
add_interface_port avalon_master amm_burstcount_0 burstcount Output 7
add_interface_port avalon_master amm_readdatavalid_0 readdatavalid Input 1
add_interface_port avalon_master amm_ready_0 waitrequest Input 1


# 
# connection point control
# 
add_interface control conduit end
set_interface_property control associatedClock clock
set_interface_property control associatedReset reset
set_interface_property control ENABLED true
set_interface_property control EXPORT_OF ""
set_interface_property control PORT_NAME_MAP ""
set_interface_property control CMSIS_SVD_VARIABLES ""
set_interface_property control SVD_ADDRESS_GROUP ""
set_interface_property control IPXACT_REGISTER_MAP_VARIABLES ""

add_interface_port control wr_rq wr_rq Input 1
add_interface_port control rd_rq rd_rq Input 1
add_interface_port control rd_valid rd_valid Output 1
add_interface_port control wr_adr wr_adr Input 25
add_interface_port control rd_adr rd_adr Input 25
add_interface_port control wr_data wr_data Input 256
add_interface_port control rd_data rd_data Output 256
add_interface_port control byte_enable byte_enable Input 32
add_interface_port control action_done action_done Output 1

