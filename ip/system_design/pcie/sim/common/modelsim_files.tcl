
namespace eval pcie {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_common_sv_packages  1
    dict set libraries altera_xcvr_native_a10_191 1
    dict set libraries altera_pcie_a10_hip_2011   1
    dict set libraries altera_xcvr_fpll_a10_191   1
    dict set libraries pcie                       1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    dict set design_files "altera_common_sv_packages::altera_xcvr_native_a10_functions_h" "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/altera_xcvr_native_a10_functions_h.sv"]\"  -work altera_common_sv_packages"
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/alt_xcvr_resync.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/alt_xcvr_arbiter.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/mentor/alt_xcvr_resync.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/mentor/alt_xcvr_arbiter.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/twentynm_pcs.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/twentynm_pma.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/twentynm_xcvr_avmm.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/twentynm_xcvr_native.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/mentor/twentynm_pcs.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/mentor/twentynm_pma.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/mentor/twentynm_xcvr_avmm.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/mentor/twentynm_xcvr_native.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/a10_avmm_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/alt_xcvr_native_pipe_retry.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/alt_xcvr_native_avmm_csr.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/alt_xcvr_native_prbs_accum.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/alt_xcvr_native_odi_accel.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/alt_xcvr_native_rcfg_arb.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/altera_xcvr_native_pcie_dfe_params_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/pcie_mgmt_commands_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/pcie_mgmt_functions_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/pcie_mgmt_program.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/pcie_mgmt_cpu.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/pcie_mgmt_master.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/altera_xcvr_native_pcie_dfe_ip.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/pcie_altera_xcvr_native_a10_191_vtbxjmi.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_native_a10_191/sim/alt_xcvr_native_rcfg_opt_logic_vtbxjmi.sv"]\" -L altera_common_sv_packages -work altera_xcvr_native_a10_191" 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/pcie_altera_pcie_a10_hip_altera_xcvr_native_a10_2011_nqkigkq.v"]\"  -work altera_pcie_a10_hip_2011"                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/twentynm_xcvr_avmm.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/mentor/twentynm_xcvr_avmm.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/alt_xcvr_resync.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/mentor/alt_xcvr_resync.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/altera_xcvr_fpll_a10.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/mentor/altera_xcvr_fpll_a10.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/a10_avmm_h.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/alt_xcvr_native_avmm_nf.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/alt_xcvr_pll_embedded_debug.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/alt_xcvr_pll_avmm_csr.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/mentor/alt_xcvr_pll_embedded_debug.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_xcvr_fpll_a10_191/sim/mentor/alt_xcvr_pll_avmm_csr.sv"]\" -L altera_common_sv_packages -work altera_xcvr_fpll_a10_191"               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/pcie_altera_pcie_a10_hip_altera_xcvr_fpll_a10_2011_dxkofyy.v"]\"  -work altera_pcie_a10_hip_2011"                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_a10_hip_pllnphy_2011_ub5pqua.v"]\"  -work altera_pcie_a10_hip_2011"                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_a10_hip_pipen1b_2011_ub5pqua.v"]\"  -work altera_pcie_a10_hip_2011"                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/pcie_altera_pcie_a10_hip_2011_ub5pqua.v"]\"  -work altera_pcie_a10_hip_2011"                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_sc_bitsync.v"]\"  -work altera_pcie_a10_hip_2011"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_reset_delay_sync.v"]\"  -work altera_pcie_a10_hip_2011"                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_rs_a10_hip.v"]\"  -work altera_pcie_a10_hip_2011"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/skp_det_g3.v"]\"  -work altera_pcie_a10_hip_2011"                                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altera_xcvr_functions.sv"]\" -L altera_common_sv_packages -work altera_pcie_a10_hip_2011"                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_monitor_a10_dlhip_sim.sv"]\" -L altera_common_sv_packages -work altera_pcie_a10_hip_2011"              
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_tlp_inspector_a10.v"]\"  -work altera_pcie_a10_hip_2011"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_tlp_inspector_cseb_a10.sv"]\" -L altera_common_sv_packages -work altera_pcie_a10_hip_2011"             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_tlp_inspector_monitor_a10.sv"]\" -L altera_common_sv_packages -work altera_pcie_a10_hip_2011"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_tlp_inspector_trigger_a10.v"]\"  -work altera_pcie_a10_hip_2011"                                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_tlp_inspector_pcsig_drive_a10.v"]\"  -work altera_pcie_a10_hip_2011"                                       
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_a10_gbfifo.v"]\"  -work altera_pcie_a10_hip_2011"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_scfifo_a10.v"]\"  -work altera_pcie_a10_hip_2011"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcie_a10_scfifo_ext.v"]\"  -work altera_pcie_a10_hip_2011"                                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpcierd_hip_rs.v"]\"  -work altera_pcie_a10_hip_2011"                                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_a2p_addrtrans.v"]\"  -work altera_pcie_a10_hip_2011"                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_a2p_fixtrans.v"]\"  -work altera_pcie_a10_hip_2011"                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_a2p_vartrans.v"]\"  -work altera_pcie_a10_hip_2011"                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_app.v"]\"  -work altera_pcie_a10_hip_2011"                                                          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_clksync.v"]\"  -work altera_pcie_a10_hip_2011"                                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_control_register.v"]\"  -work altera_pcie_a10_hip_2011"                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_cr_avalon.v"]\"  -work altera_pcie_a10_hip_2011"                                                    
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_cr_interrupt.v"]\"  -work altera_pcie_a10_hip_2011"                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_cr_rp.v"]\"  -work altera_pcie_a10_hip_2011"                                                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_cfg_status.v"]\"  -work altera_pcie_a10_hip_2011"                                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_cr_mailbox.v"]\"  -work altera_pcie_a10_hip_2011"                                                   
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_p2a_addrtrans.v"]\"  -work altera_pcie_a10_hip_2011"                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_rx.v"]\"  -work altera_pcie_a10_hip_2011"                                                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_rx_cntrl.v"]\"  -work altera_pcie_a10_hip_2011"                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_fifo.v"]\"  -work altera_pcie_a10_hip_2011"                                                         
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_rxm_adapter.v"]\"  -work altera_pcie_a10_hip_2011"                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_rx_resp.v"]\"  -work altera_pcie_a10_hip_2011"                                                      
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_tx.v"]\"  -work altera_pcie_a10_hip_2011"                                                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_tx_cntrl.v"]\"  -work altera_pcie_a10_hip_2011"                                                     
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_txavl_cntrl.v"]\"  -work altera_pcie_a10_hip_2011"                                                  
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_pcie_a10_hip_2011/sim/altpciexpav128_txresp_cntrl.v"]\"  -work altera_pcie_a10_hip_2011"                                                 
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/pcie.v"]\"  -work pcie"                                                                                                                            
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
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
