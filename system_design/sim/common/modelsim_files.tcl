source [file join [file dirname [info script]] ./../../../ip/system_design/receive_packet_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/receive_packet_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/setup_ddr/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/tse/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/mem_rcv_0/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/send_cmd_pcie/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/ddr_avalon_reset/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/ddr3/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/pll/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/init_mac/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/reset_main/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/clock_ddr_avalon/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/mem_5/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/mem_3/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/mem_4/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/clock_50_out/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/send_packet_1/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/pcie/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/xcvr_pll/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/system_design/reset_mod/sim/common/modelsim_files.tcl]

namespace eval system_design {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [receive_packet_1::get_design_libraries]]
    set libraries [dict merge $libraries [receive_packet_0::get_design_libraries]]
    set libraries [dict merge $libraries [setup_ddr::get_design_libraries]]
    set libraries [dict merge $libraries [tse::get_design_libraries]]
    set libraries [dict merge $libraries [mem_rcv_0::get_design_libraries]]
    set libraries [dict merge $libraries [send_cmd_pcie::get_design_libraries]]
    set libraries [dict merge $libraries [ddr_avalon_reset::get_design_libraries]]
    set libraries [dict merge $libraries [ddr3::get_design_libraries]]
    set libraries [dict merge $libraries [pll::get_design_libraries]]
    set libraries [dict merge $libraries [init_mac::get_design_libraries]]
    set libraries [dict merge $libraries [reset_main::get_design_libraries]]
    set libraries [dict merge $libraries [clock_ddr_avalon::get_design_libraries]]
    set libraries [dict merge $libraries [mem_5::get_design_libraries]]
    set libraries [dict merge $libraries [mem_3::get_design_libraries]]
    set libraries [dict merge $libraries [mem_4::get_design_libraries]]
    set libraries [dict merge $libraries [clock_50_out::get_design_libraries]]
    set libraries [dict merge $libraries [send_packet_1::get_design_libraries]]
    set libraries [dict merge $libraries [pcie::get_design_libraries]]
    set libraries [dict merge $libraries [xcvr_pll::get_design_libraries]]
    set libraries [dict merge $libraries [reset_mod::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_191  1
    dict set libraries altera_merlin_slave_translator_191   1
    dict set libraries altera_merlin_master_agent_191       1
    dict set libraries altera_merlin_slave_agent_191        1
    dict set libraries altera_avalon_sc_fifo_1930           1
    dict set libraries altera_merlin_router_1920            1
    dict set libraries altera_merlin_demultiplexer_1921     1
    dict set libraries altera_merlin_multiplexer_1921       1
    dict set libraries altera_merlin_width_adapter_1920     1
    dict set libraries hs_clk_xer_1931                      1
    dict set libraries altera_mm_interconnect_1920          1
    dict set libraries altera_avalon_st_pipeline_stage_1920 1
    dict set libraries altera_merlin_burst_adapter_1921     1
    dict set libraries altera_irq_mapper_1920               1
    dict set libraries altera_reset_controller_1921         1
    dict set libraries system_design                        1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [receive_packet_1::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/receive_packet_1/sim/"]]
    set memory_files [concat $memory_files [receive_packet_0::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/receive_packet_0/sim/"]]
    set memory_files [concat $memory_files [setup_ddr::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/setup_ddr/sim/"]]
    set memory_files [concat $memory_files [tse::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/tse/sim/"]]
    set memory_files [concat $memory_files [mem_rcv_0::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/mem_rcv_0/sim/"]]
    set memory_files [concat $memory_files [send_cmd_pcie::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/send_cmd_pcie/sim/"]]
    set memory_files [concat $memory_files [ddr_avalon_reset::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/ddr_avalon_reset/sim/"]]
    set memory_files [concat $memory_files [ddr3::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/ddr3/sim/"]]
    set memory_files [concat $memory_files [pll::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/pll/sim/"]]
    set memory_files [concat $memory_files [init_mac::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/init_mac/sim/"]]
    set memory_files [concat $memory_files [reset_main::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/reset_main/sim/"]]
    set memory_files [concat $memory_files [clock_ddr_avalon::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/clock_ddr_avalon/sim/"]]
    set memory_files [concat $memory_files [mem_5::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/mem_5/sim/"]]
    set memory_files [concat $memory_files [mem_3::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/mem_3/sim/"]]
    set memory_files [concat $memory_files [mem_4::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/mem_4/sim/"]]
    set memory_files [concat $memory_files [clock_50_out::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/clock_50_out/sim/"]]
    set memory_files [concat $memory_files [send_packet_1::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/send_packet_1/sim/"]]
    set memory_files [concat $memory_files [pcie::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/pcie/sim/"]]
    set memory_files [concat $memory_files [xcvr_pll::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/xcvr_pll/sim/"]]
    set memory_files [concat $memory_files [reset_mod::get_memory_files "$QSYS_SIMDIR/../../ip/system_design/reset_mod/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [receive_packet_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/receive_packet_1/sim/"]]
    set design_files [dict merge $design_files [receive_packet_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/receive_packet_0/sim/"]]
    set design_files [dict merge $design_files [setup_ddr::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/setup_ddr/sim/"]]
    set design_files [dict merge $design_files [tse::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/tse/sim/"]]
    set design_files [dict merge $design_files [mem_rcv_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/mem_rcv_0/sim/"]]
    set design_files [dict merge $design_files [send_cmd_pcie::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/send_cmd_pcie/sim/"]]
    set design_files [dict merge $design_files [ddr_avalon_reset::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/ddr_avalon_reset/sim/"]]
    set design_files [dict merge $design_files [ddr3::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/ddr3/sim/"]]
    set design_files [dict merge $design_files [pll::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/pll/sim/"]]
    set design_files [dict merge $design_files [init_mac::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/init_mac/sim/"]]
    set design_files [dict merge $design_files [reset_main::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/reset_main/sim/"]]
    set design_files [dict merge $design_files [clock_ddr_avalon::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/clock_ddr_avalon/sim/"]]
    set design_files [dict merge $design_files [mem_5::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/mem_5/sim/"]]
    set design_files [dict merge $design_files [mem_3::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/mem_3/sim/"]]
    set design_files [dict merge $design_files [mem_4::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/mem_4/sim/"]]
    set design_files [dict merge $design_files [clock_50_out::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/clock_50_out/sim/"]]
    set design_files [dict merge $design_files [send_packet_1::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/send_packet_1/sim/"]]
    set design_files [dict merge $design_files [pcie::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/pcie/sim/"]]
    set design_files [dict merge $design_files [xcvr_pll::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/xcvr_pll/sim/"]]
    set design_files [dict merge $design_files [reset_mod::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/reset_mod/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [receive_packet_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/receive_packet_1/sim/"]]
    set design_files [concat $design_files [receive_packet_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/receive_packet_0/sim/"]]
    set design_files [concat $design_files [setup_ddr::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/setup_ddr/sim/"]]
    set design_files [concat $design_files [tse::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/tse/sim/"]]
    set design_files [concat $design_files [mem_rcv_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/mem_rcv_0/sim/"]]
    set design_files [concat $design_files [send_cmd_pcie::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/send_cmd_pcie/sim/"]]
    set design_files [concat $design_files [ddr_avalon_reset::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/ddr_avalon_reset/sim/"]]
    set design_files [concat $design_files [ddr3::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/ddr3/sim/"]]
    set design_files [concat $design_files [pll::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/pll/sim/"]]
    set design_files [concat $design_files [init_mac::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/init_mac/sim/"]]
    set design_files [concat $design_files [reset_main::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/reset_main/sim/"]]
    set design_files [concat $design_files [clock_ddr_avalon::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/clock_ddr_avalon/sim/"]]
    set design_files [concat $design_files [mem_5::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/mem_5/sim/"]]
    set design_files [concat $design_files [mem_3::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/mem_3/sim/"]]
    set design_files [concat $design_files [mem_4::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/mem_4/sim/"]]
    set design_files [concat $design_files [clock_50_out::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/clock_50_out/sim/"]]
    set design_files [concat $design_files [send_packet_1::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/send_packet_1/sim/"]]
    set design_files [concat $design_files [pcie::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/pcie/sim/"]]
    set design_files [concat $design_files [xcvr_pll::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/xcvr_pll/sim/"]]
    set design_files [concat $design_files [reset_mod::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/system_design/reset_mod/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_191/sim/system_design_altera_merlin_master_translator_191_g7h47bq.sv"]\"  -work altera_merlin_master_translator_191"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_191/sim/system_design_altera_merlin_slave_translator_191_x56fcki.sv"]\"  -work altera_merlin_slave_translator_191"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_191/sim/system_design_altera_merlin_master_agent_191_mpbm6tq.sv"]\"  -work altera_merlin_master_agent_191"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_191/sim/system_design_altera_merlin_slave_agent_191_ncfkfri.sv"]\"  -work altera_merlin_slave_agent_191"                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_191/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_191"                                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1930/sim/system_design_altera_avalon_sc_fifo_1930_pqv24kq.v"]\"  -work altera_avalon_sc_fifo_1930"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1920/sim/system_design_altera_merlin_router_1920_h3ufi5i.sv"]\"  -work altera_merlin_router_1920"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1920/sim/system_design_altera_merlin_router_1920_engkfgq.sv"]\"  -work altera_merlin_router_1920"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1920/sim/system_design_altera_merlin_router_1920_hvfjwaq.sv"]\"  -work altera_merlin_router_1920"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/system_design_altera_merlin_demultiplexer_1921_g5kdmwq.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/system_design_altera_merlin_multiplexer_1921_e3xy3ha.sv"]\"  -work altera_merlin_multiplexer_1921"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1921"                                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/system_design_altera_merlin_demultiplexer_1921_ch7epuq.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/system_design_altera_merlin_multiplexer_1921_pf5e3wa.sv"]\"  -work altera_merlin_multiplexer_1921"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1921"                                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/system_design_altera_merlin_width_adapter_1920_tvac3wq.sv"]\"  -work altera_merlin_width_adapter_1920"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1920"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1920"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/system_design_altera_merlin_width_adapter_1920_cgbsazy.sv"]\"  -work altera_merlin_width_adapter_1920"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1920"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1920"                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1931/sim/system_design_hs_clk_xer_1931_qzbstyq.v"]\"  -work hs_clk_xer_1931"                                                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1931/sim/altera_avalon_st_clock_crosser.v"]\"  -work hs_clk_xer_1931"                                                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1931/sim/altera_avalon_st_pipeline_base.v"]\"  -work hs_clk_xer_1931"                                                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../hs_clk_xer_1931/sim/altera_std_synchronizer_nocut.v"]\"  -work hs_clk_xer_1931"                                                                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/system_design_altera_mm_interconnect_1920_cessh5i.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/system_design_altera_mm_interconnect_1920_qky3gdi.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/system_design_altera_mm_interconnect_1920_tqdmh6a.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/system_design_altera_mm_interconnect_1920_nnzxfdi.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/system_design_altera_mm_interconnect_1920_rvh6iyy.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1920/sim/system_design_altera_merlin_router_1920_etguxaa.sv"]\"  -work altera_merlin_router_1920"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1920/sim/system_design_altera_merlin_router_1920_njnyfdy.sv"]\"  -work altera_merlin_router_1920"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1920/sim/system_design_altera_avalon_st_pipeline_stage_1920_zterisq.sv"]\"  -work altera_avalon_st_pipeline_stage_1920"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1920/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_avalon_st_pipeline_stage_1920"                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/system_design_altera_merlin_burst_adapter_altera_avalon_st_pipeline_stage_1921_txawraa.v"]\"  -work altera_merlin_burst_adapter_1921"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/system_design_altera_merlin_burst_adapter_1921_guf3z7y.sv"]\"  -work altera_merlin_burst_adapter_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/altera_merlin_burst_adapter_uncmpr.sv"]\"  -work altera_merlin_burst_adapter_1921"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/altera_merlin_burst_adapter_13_1.sv"]\"  -work altera_merlin_burst_adapter_1921"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/altera_merlin_burst_adapter_new.sv"]\"  -work altera_merlin_burst_adapter_1921"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/altera_incr_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1921"                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/altera_wrap_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1921"                                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/altera_default_burst_converter.sv"]\"  -work altera_merlin_burst_adapter_1921"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_burst_adapter_1921/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_burst_adapter_1921"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/system_design_altera_merlin_demultiplexer_1921_t6ir34q.sv"]\"  -work altera_merlin_demultiplexer_1921"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/system_design_altera_merlin_multiplexer_1921_mtk5gaa.sv"]\"  -work altera_merlin_multiplexer_1921"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1921"                                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/system_design_altera_merlin_multiplexer_1921_jdujepi.sv"]\"  -work altera_merlin_multiplexer_1921"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1921"                                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/system_design_altera_merlin_width_adapter_1920_sbsfocy.sv"]\"  -work altera_merlin_width_adapter_1920"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1920"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1920"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/system_design_altera_merlin_width_adapter_1920_mqc4ddi.sv"]\"  -work altera_merlin_width_adapter_1920"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_width_adapter_1920"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_width_adapter_1920/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_width_adapter_1920"                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/system_design_altera_mm_interconnect_1920_nmewghq.v"]\"  -work altera_mm_interconnect_1920"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_irq_mapper_1920/sim/system_design_altera_irq_mapper_1920_66fzifq.sv"]\"  -work altera_irq_mapper_1920"                                                         
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1921/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1921"                                                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1921/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1921"                                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/system_design.v"]\"  -work system_design"                                                                                                                                    
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [receive_packet_1::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [receive_packet_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [setup_ddr::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [tse::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [mem_rcv_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [send_cmd_pcie::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [ddr_avalon_reset::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [ddr3::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [pll::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [init_mac::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [reset_main::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [clock_ddr_avalon::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [mem_5::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [mem_3::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [mem_4::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [clock_50_out::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [send_packet_1::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [pcie::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [xcvr_pll::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [reset_mod::get_elab_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [receive_packet_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [receive_packet_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [setup_ddr::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [tse::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [mem_rcv_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [send_cmd_pcie::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ddr_avalon_reset::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [ddr3::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [pll::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [init_mac::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [reset_main::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clock_ddr_avalon::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [mem_5::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [mem_3::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [mem_4::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [clock_50_out::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [send_packet_1::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [pcie::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [xcvr_pll::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [reset_mod::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [receive_packet_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [receive_packet_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [setup_ddr::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [tse::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [mem_rcv_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [send_cmd_pcie::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ddr_avalon_reset::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [ddr3::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pll::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [init_mac::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [reset_main::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clock_ddr_avalon::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [mem_5::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [mem_3::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [mem_4::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [clock_50_out::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [send_packet_1::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [pcie::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [xcvr_pll::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [reset_mod::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
}
