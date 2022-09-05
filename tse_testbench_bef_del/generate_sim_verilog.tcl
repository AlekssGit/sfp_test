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


set dut_parameters [list]
set is_qsys_edition [list]

# RUN_SCRIPT_PARAMETERS
set variant_name tse_testbench
set dut_device_family "Cyclone 10 GX"
set dut_device "10CX220YF780E5G"
set deviceDieList ""
lappend is_qsys_edition "QSYS_PRO"
lappend dut_parameters "--component-param=deviceDieList="
lappend dut_parameters "--component-param=core_variation=MAC_PCS"
lappend dut_parameters "--component-param=enable_hidden_features=false"
lappend dut_parameters "--component-param=ifGMII=MII_GMII"
lappend dut_parameters "--component-param=use_mac_clken=false"
lappend dut_parameters "--component-param=enable_use_internal_fifo=false"
lappend dut_parameters "--component-param=enable_ecc=false"
lappend dut_parameters "--component-param=max_channels=4"
lappend dut_parameters "--component-param=use_misc_ports=true"
lappend dut_parameters "--component-param=transceiver_type=GXB"
lappend dut_parameters "--component-param=enable_hd_logic=false"
lappend dut_parameters "--component-param=enable_gmii_loopback=false"
lappend dut_parameters "--component-param=enable_sup_addr=false"
lappend dut_parameters "--component-param=stat_cnt_ena=false"
lappend dut_parameters "--component-param=ext_stat_cnt_ena=false"
lappend dut_parameters "--component-param=ena_hash=false"
lappend dut_parameters "--component-param=enable_shift16=true"
lappend dut_parameters "--component-param=enable_mac_flow_ctrl=false"
lappend dut_parameters "--component-param=enable_mac_vlan=false"
lappend dut_parameters "--component-param=enable_magic_detect=true"
lappend dut_parameters "--component-param=useMDIO=true"
lappend dut_parameters "--component-param=mdio_clk_div=40"
lappend dut_parameters "--component-param=enable_ena=32"
lappend dut_parameters "--component-param=eg_addr=11"
lappend dut_parameters "--component-param=ing_addr=11"
lappend dut_parameters "--component-param=phy_identifier=0"
lappend dut_parameters "--component-param=enable_sgmii=true"
lappend dut_parameters "--component-param=export_pwrdn=false"
lappend dut_parameters "--component-param=enable_alt_reconfig=false"
lappend dut_parameters "--component-param=starting_channel_number=0"
lappend dut_parameters "--component-param=phyip_pll_type=CMU"
lappend dut_parameters "--component-param=phyip_pll_base_data_rate=1250 Mbps"
lappend dut_parameters "--component-param=phyip_en_synce_support=false"
lappend dut_parameters "--component-param=phyip_pma_bonding_mode=x1"
lappend dut_parameters "--component-param=nf_phyip_rcfg_enable=false"
lappend dut_parameters "--component-param=XCVR_RCFG_JTAG_ENABLE=0"
lappend dut_parameters "--component-param=XCVR_SET_CAPABILITY_REG_ENABLE=0"
lappend dut_parameters "--component-param=XCVR_SET_USER_IDENTIFIER=0"
lappend dut_parameters "--component-param=XCVR_SET_CSR_SOFT_LOGIC_ENABLE=0"
lappend dut_parameters "--component-param=XCVR_SET_PRBS_SOFT_LOGIC_ENABLE=0"
lappend dut_parameters "--component-param=part_trait_bd=NIGHTFURY1"
lappend dut_parameters "--component-param=nd_phyip_rcfg_enable=false"
lappend dut_parameters "--component-param=ND_XCVR_RCFG_JTAG_ENABLE=0"
lappend dut_parameters "--component-param=ND_XCVR_SET_CAPABILITY_REG_ENABLE=0"
lappend dut_parameters "--component-param=ND_XCVR_SET_USER_IDENTIFIER=0"
lappend dut_parameters "--component-param=ND_XCVR_SET_CSR_SOFT_LOGIC_ENABLE=0"
lappend dut_parameters "--component-param=enable_timestamping=false"
lappend dut_parameters "--component-param=enable_deterministic_latency=false"
lappend dut_parameters "--component-param=enable_ptp_1step=false"
lappend dut_parameters "--component-param=tstamp_fp_width=4"
lappend dut_parameters "--component-param=rcp_load_enable=0"
lappend dut_parameters "--component-param=cal_recipe_sel=NRZ_28Gbps_VSR"
lappend dut_parameters "--component-param=ctle_lf_val_a=999"
lappend dut_parameters "--component-param=ctle_lf_val_ada_a=adaptable"
lappend dut_parameters "--component-param=ctle_lf_min_a=999"
lappend dut_parameters "--component-param=ctle_lf_max_a=999"
lappend dut_parameters "--component-param=ctle_hf_val_a=999"
lappend dut_parameters "--component-param=ctle_hf_val_ada_a=adaptable"
lappend dut_parameters "--component-param=ctle_hf_min_a=999"
lappend dut_parameters "--component-param=ctle_hf_max_a=999"
lappend dut_parameters "--component-param=rf_p2_val_a=999"
lappend dut_parameters "--component-param=rf_p2_val_ada_a=adaptable"
lappend dut_parameters "--component-param=rf_p2_min_a=999"
lappend dut_parameters "--component-param=rf_p2_max_a=999"
lappend dut_parameters "--component-param=rf_p1_val_a=999"
lappend dut_parameters "--component-param=rf_p1_val_ada_a=adaptable"
lappend dut_parameters "--component-param=rf_p1_min_a=999"
lappend dut_parameters "--component-param=rf_p1_max_a=999"
lappend dut_parameters "--component-param=rf_reserved0_a=999"
lappend dut_parameters "--component-param=rf_p0_val_a=999"
lappend dut_parameters "--component-param=rf_p0_val_ada_a=adaptable"
lappend dut_parameters "--component-param=rf_reserved1_a=999"
lappend dut_parameters "--component-param=rf_b0t_a=999"
lappend dut_parameters "--component-param=ctle_gs1_val_a=999"
lappend dut_parameters "--component-param=ctle_gs2_val_a=999"
lappend dut_parameters "--component-param=rf_b1_a=999"
lappend dut_parameters "--component-param=rf_b1_ada_a=adaptable"
lappend dut_parameters "--component-param=rf_b0_a=999"
lappend dut_parameters "--component-param=rf_b0_ada_a=adaptable"
lappend dut_parameters "--component-param=rf_a_a=999"
lappend dut_parameters "--component-param=ctle_lf_val_b=999"
lappend dut_parameters "--component-param=ctle_lf_val_ada_b=adaptable"
lappend dut_parameters "--component-param=ctle_lf_min_b=999"
lappend dut_parameters "--component-param=ctle_lf_max_b=999"
lappend dut_parameters "--component-param=ctle_hf_val_b=999"
lappend dut_parameters "--component-param=ctle_hf_val_ada_b=adaptable"
lappend dut_parameters "--component-param=ctle_hf_min_b=999"
lappend dut_parameters "--component-param=ctle_hf_max_b=999"
lappend dut_parameters "--component-param=rf_p2_val_b=999"
lappend dut_parameters "--component-param=rf_p2_val_ada_b=adaptable"
lappend dut_parameters "--component-param=rf_p2_min_b=999"
lappend dut_parameters "--component-param=rf_p2_max_b=999"
lappend dut_parameters "--component-param=rf_p1_val_b=999"
lappend dut_parameters "--component-param=rf_p1_val_ada_b=adaptable"
lappend dut_parameters "--component-param=rf_p1_min_b=999"
lappend dut_parameters "--component-param=rf_p1_max_b=999"
lappend dut_parameters "--component-param=rf_reserved0_b=999"
lappend dut_parameters "--component-param=rf_p0_val_b=999"
lappend dut_parameters "--component-param=rf_p0_val_ada_b=adaptable"
lappend dut_parameters "--component-param=rf_reserved1_b=999"
lappend dut_parameters "--component-param=rf_b0t_b=999"
lappend dut_parameters "--component-param=ctle_gs1_val_b=999"
lappend dut_parameters "--component-param=ctle_gs2_val_b=999"
lappend dut_parameters "--component-param=rf_b1_b=999"
lappend dut_parameters "--component-param=rf_b1_ada_b=adaptable"
lappend dut_parameters "--component-param=rf_b0_b=999"
lappend dut_parameters "--component-param=rf_b0_ada_b=adaptable"
lappend dut_parameters "--component-param=rf_a_b=999"
lappend dut_parameters "--component-param=adpt_multi_enable=1"
lappend dut_parameters "--component-param=adpt_recipe_cnt=1"
lappend dut_parameters "--component-param=adpt_recipe_select=0"
lappend dut_parameters "--component-param=adpt_recipe_data0="
lappend dut_parameters "--component-param=adpt_recipe_data1="
lappend dut_parameters "--component-param=adpt_recipe_data2="
lappend dut_parameters "--component-param=adpt_recipe_data3="
lappend dut_parameters "--component-param=adpt_recipe_data4="
lappend dut_parameters "--component-param=adpt_recipe_data5="
lappend dut_parameters "--component-param=adpt_recipe_data6="
lappend dut_parameters "--component-param=adpt_recipe_data7="
lappend dut_parameters "--component-param=EXAMPLE_DESIGN_VARIANT=0"
lappend dut_parameters "--component-param=GEN_SIM=0"
lappend dut_parameters "--component-param=GEN_SYNTH=0"
lappend dut_parameters "--component-param=HDL_FORMAT=1"
lappend dut_parameters "--component-param=DEV_BOARD=0"


if {[lsearch -regexp $deviceDieList {^HSSI_GDR}] != -1} {
  if {[is_project_open]} {
     set project_name $::quartus(project)
     if {[string compare $project_name "generate_sim_verilog"] != 0} {
        post_message -type error "Invalid project \"$project_name\""
        post_message -type error "In order to generate the simulation model,"
        post_message -type error "please close the current project \"$project_name\""
        post_message -type error "and open the project \"generate_sim_verilog\""
        return 1
     }
  }
} else {
  if {[is_project_open]} {
     set project_name $::quartus(project)
     if {[string compare $project_name "generate_sim"] != 0} {
        post_message -type error "Invalid project \"$project_name\""
        post_message -type error "In order to generate the simulation model,"
        post_message -type error "please close the current project \"$project_name\""
        post_message -type error "and open the project \"generate_sim\""
        return 1
     }
  }
}
set arg_list [list]
puts "Generating Verilog simulation model"

if { [string match "QSYS_PRO" $is_qsys_edition] } {
   set sim_script_arg_list [list]
   set dut_arg_list [list]
   set output_dir testbench_verilog
   
   lappend arg_list "--family=$dut_device_family"
   lappend arg_list "--part=$dut_device"

   # IP_GENERATION
   lappend dut_arg_list "--output-name=${variant_name}"
   lappend dut_arg_list "--output-directory=$output_dir/${variant_name}_sim"
   lappend sim_script_arg_list "--spd=$output_dir/${variant_name}_sim/${variant_name}/${variant_name}.spd"
   
   catch {eval [concat [list exec "ip-deploy" --component-name=altera_eth_tse] $arg_list $dut_arg_list $dut_parameters]} temp
   puts $temp
   if {[lsearch -regexp $deviceDieList {^HSSI_GDR}] != -1} {
     catch {eval [concat [list exec "qsys-generate" --simulation=VERILOG --synthesis=VERILOG] "$output_dir/${variant_name}_sim/${variant_name}.ip"]} temp
     catch {eval [concat [list exec quartus_tlg --verbose generate_sim_verilog]]} temp
   } else {
     catch {eval [concat [list exec "qsys-generate" --simulation=VERILOG] "$output_dir/${variant_name}_sim/${variant_name}.ip"]} temp
   }
   puts $temp

   # Generate sim_script
   set qdir $::env(QUARTUS_ROOTDIR)
   if {[lsearch -regexp $deviceDieList {^HSSI_GDR}] != -1} {
     catch {eval [concat [list exec ip-setup-simulation --quartus-project=generate_sim_verilog.qpf --output-directory=$output_dir/$variant_name --use-relative-paths=true]]}
   } else {
     catch {eval [concat [list exec "sim-script-gen" --output-directory=$output_dir/$variant_name --use-relative-paths=true] $sim_script_arg_list]}
   }

} else { 
   set output_dir [file join testbench_verilog ${variant_name}_sim]
   set spd_filename [file join $output_dir ${variant_name}.spd]
 
   lappend arg_list "--file-set=SIM_VERILOG"
   lappend arg_list "--system-info=DEVICE_FAMILY=$dut_device_family"
   lappend arg_list "--output-name=${variant_name}"
   lappend arg_list "--output-dir=$output_dir"
   lappend arg_list "--report-file=spd:$spd_filename"
   
   set qdir $::env(QUARTUS_ROOTDIR)
   catch {eval [concat [list exec "$qdir/sopc_builder/bin/ip-generate" --component-name=altera_eth_tse] $arg_list $dut_parameters]} temp
   puts $temp
   
   catch {eval [list exec "$qdir/sopc_builder/bin/ip-make-simscript" --spd=${spd_filename} --output-directory=$output_dir]} temp
   puts $temp
}
