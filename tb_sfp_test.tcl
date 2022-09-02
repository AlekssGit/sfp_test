transcript on

set QSYS_SIMDIR "./../sim_setup"
source $QSYS_SIMDIR/mentor/msim_setup.tcl
dev_com
com

# Compile the design files in correct order

# vlog -work work +incdir+./ ../ram_packets/synth/ram_packets.v

vlog -sv -work work +incdir+./ ../i2c_slave.sv
vlog -sv -work work +incdir+./ ../modules/expander_gpio/generator.sv
vlog -sv -work work +incdir+./ ../modules/expander_gpio/i2c_master.sv
vlog -sv -work work +incdir+./ ../modules/expander_gpio/control_i2c_master.sv
vlog -sv -work work +incdir+./ ../modules/expander_gpio/i2c_expander_ctrl.sv
vlog -sv -work work +incdir+./ ../modules/expander_gpio/i2c_expander_mm.sv
vlog -sv -work work +incdir+./ ../modules/expander_gpio/i2c_expander.sv


vlog -sv -work work +incdir+./ ../modules/phyip_reset.sv
vlog -sv -work work +incdir+./ ../sfp_test_top.sv
vlog -sv -work work +incdir+./ ../tb_sfp_test.sv

# vsim -novopt tb_top
set TOP_LEVEL_NAME tb_sfp_test
# vsim -voptargs="+acc"  tb_tse_test
elab_debug

add wave -group clocks  /tb_sfp_test/clk_50
add wave -group clocks  /tb_sfp_test/clk_125_lvds


add wave -group sgmii_1   /tb_sfp_test/device/sgmii_tx_1
add wave -group sgmii_1   /tb_sfp_test/device/sgmii_rx_1

add wave -group sgmii_2   /tb_sfp_test/device/sgmii_tx_2
add wave -group sgmii_2   /tb_sfp_test/device/sgmii_rx_2

add wave -group resets  -label "rst_n"      /tb_sfp_test/device/rst_n
add wave -group resets  -label "main_reset" /tb_sfp_test/device/main_reset
add wave -group resets  -label "reset_phy"  /tb_sfp_test/device/reset_phy
add wave -group resets  -label "tx_analogreset"  /tb_sfp_test/device/tx_analogreset
add wave -group resets  -label "tx_digitalreset"  /tb_sfp_test/device/tx_digitalreset
add wave -group resets  -label "rx_analogreset"  /tb_sfp_test/device/rx_analogreset
add wave -group resets  -label "rx_digitalreset"  /tb_sfp_test/device/rx_digitalreset
add wave -group resets  -label "tx_ready"  /tb_sfp_test/device/tx_ready
add wave -group resets  -label "rx_ready"  /tb_sfp_test/device/rx_ready

add wave -group avalon_tse_Setup   -label "mac_inited"              /tb_sfp_test/device/mac_inited
add wave -group avalon_tse_Setup   -label "led_link_reg"            /tb_sfp_test/device/platform_design/init_mac/init_mac/control_init/led_link_reg
add wave -group avalon_tse_Setup   -label "count_channels_inited"   /tb_sfp_test/device/platform_design/init_mac/init_mac/control_init/count_channels_inited
add wave -group avalon_tse_Setup   -label "init_state"              /tb_sfp_test/device/platform_design/init_mac/init_mac/control_init/init_state
add wave -group avalon_tse_Setup   -label "wr_adr"                  /tb_sfp_test/device/platform_design/init_mac/init_mac/control_init/wr_adr
add wave -group avalon_tse_Setup   -label "allow_add_channel"       /tb_sfp_test/device/platform_design/init_mac/init_mac/control_init/allow_add_channel

# add wave -group avalon_tse_Setup   -label "mm_readdata"       /tb_sfp_test/device/platform_design/init_mac_avalon_master_readdata
# add wave -group avalon_tse_Setup   -label "mm_waitrequest"       /tb_sfp_test/device/platform_design/init_mac_avalon_master_waitrequest
# add wave -group avalon_tse_Setup   -label "mm_address"       /tb_sfp_test/device/platform_design/init_mac_avalon_master_address
# add wave -group avalon_tse_Setup   -label "mm_read"       /tb_sfp_test/device/platform_design/init_mac_avalon_master_read
# add wave -group avalon_tse_Setup   -label "mm_writedata"       /tb_sfp_test/device/platform_design/init_mac_avalon_master_writedata
# add wave -group avalon_tse_Setup   -label "mm_write"       /tb_sfp_test/device/platform_design/init_mac_avalon_master_write


# add wave -group mdio   -label "mdc"       /tb_sfp_test/device/mdio_mdc
# add wave -group mdio   -label "in"       /tb_sfp_test/device/mdio_in
# add wave -group mdio   -label "out"       /tb_sfp_test/device/mdio_out
# add wave -group mdio   -label "oen"       /tb_sfp_test/device/mdio_oen


add wave -group channel_1_signals   -label "crs"                            /tb_sfp_test/device/status_0_crs
add wave -group channel_1_signals   -label "link"                           /tb_sfp_test/device/status_0_link
add wave -group channel_1_signals   -label "panel_lin"                      /tb_sfp_test/device/status_0_panel_link
add wave -group channel_1_signals   -label "col"                            /tb_sfp_test/device/status_0_col
add wave -group channel_1_signals   -label "an"                             /tb_sfp_test/device/status_0_an
add wave -group channel_1_signals   -label "char_err"                       /tb_sfp_test/device/status_0_char_err
add wave -group channel_1_signals   -label "disp_err"                       /tb_sfp_test/device/status_0_disp_err
add wave -group channel_1_signals   -label "tx_cal_busy"                    /tb_sfp_test/device/tx_cal_busy_0
add wave -group channel_1_signals   -label "rx_cal_busy"                    /tb_sfp_test/device/rx_cal_busy_0
add wave -group channel_1_signals   -label "rx_is_lockedtoref"              /tb_sfp_test/device/rx_is_lockedtoref_0
add wave -group channel_1_signals   -label "rx_is_lockedtodata"             /tb_sfp_test/device/rx_is_lockedtodata_0
add wave -group channel_1_signals   -label "rx_recov_clk"                   /tb_sfp_test/device/serdes_control_connection_0

# add wave -group channel_2_signals   -label "crs"                            /tb_sfp_test/device/status_1_crs
# add wave -group channel_2_signals   -label "link"                           /tb_sfp_test/device/status_1_link
# add wave -group channel_2_signals   -label "panel_lin"                      /tb_sfp_test/device/status_1_panel_link
# add wave -group channel_2_signals   -label "col"                            /tb_sfp_test/device/status_1_col
# add wave -group channel_2_signals   -label "an"                             /tb_sfp_test/device/status_1_an
# add wave -group channel_2_signals   -label "char_err"                       /tb_sfp_test/device/status_1_char_err
# add wave -group channel_2_signals   -label "disp_err"                       /tb_sfp_test/device/status_1_disp_err
# add wave -group channel_2_signals   -label "tx_cal_busy"                    /tb_sfp_test/device/tx_cal_busy_1
# add wave -group channel_2_signals   -label "rx_cal_busy"                    /tb_sfp_test/device/rx_cal_busy_1
# add wave -group channel_2_signals   -label "rx_is_lockedtoref"              /tb_sfp_test/device/rx_is_lockedtoref_1
# add wave -group channel_2_signals   -label "rx_is_lockedtodata"             /tb_sfp_test/device/rx_is_lockedtodata_1
# add wave -group channel_2_signals   -label "rx_recov_clk"                   /tb_sfp_test/device/serdes_control_connection_1


# add wave -group avalon_st_1    -label "serial_clk"   /tb_sfp_test/device/platform_design/xcvr_pll_tx_serial_clk_clk
# add wave -group avalon_st_1    -label "valid"   /tb_sfp_test/device/platform_design/send_packet_1_avalon_streaming_source_valid
# add wave -group avalon_st_1    -label "data"    /tb_sfp_test/device/platform_design/send_packet_1_avalon_streaming_source_data
# add wave -group avalon_st_1    -label "ready"   /tb_sfp_test/device/platform_design/send_packet_1_avalon_streaming_source_ready
# add wave -group avalon_st_1    -label "sop"     /tb_sfp_test/device/platform_design/send_packet_1_avalon_streaming_source_startofpacket
# add wave -group avalon_st_1    -label "eop"     /tb_sfp_test/device/platform_design/send_packet_1_avalon_streaming_source_endofpacket
# add wave -group avalon_st_1    -label "error"     /tb_sfp_test/device/platform_design/send_packet_1_avalon_streaming_source_error
# add wave -group avalon_st_1    -label "mac_tx_clk"     /tb_sfp_test/device/platform_design/tse_mac_tx_clock_connection_0_clk

# add wave -group avalon_st_2    -label "valid"   /tb_sfp_test/device/platform_design/send_packet_2_avalon_streaming_source_valid
# add wave -group avalon_st_2    -label "data"    /tb_sfp_test/device/platform_design/send_packet_2_avalon_streaming_source_data
# add wave -group avalon_st_2    -label "ready"   /tb_sfp_test/device/platform_design/send_packet_2_avalon_streaming_source_ready
# add wave -group avalon_st_2    -label "sop"     /tb_sfp_test/device/platform_design/send_packet_2_avalon_streaming_source_startofpacket
# add wave -group avalon_st_2    -label "eop"     /tb_sfp_test/device/platform_design/send_packet_2_avalon_streaming_source_endofpacket
# add wave -group avalon_st_2    -label "error"     /tb_sfp_test/device/platform_design/send_packet_2_avalon_streaming_source_error

# add wave -group avalon_mem_1    -label "chipselect"     /tb_sfp_test/device/platform_design/send_packet_1_avalon_master_chipselect
# add wave -group avalon_mem_1    -label "readdata"       /tb_sfp_test/device/platform_design/send_packet_1_avalon_master_readdata
# add wave -group avalon_mem_1    -label "address"        /tb_sfp_test/device/platform_design/send_packet_1_avalon_master_address
# add wave -group avalon_mem_1    -label "byteenable"     /tb_sfp_test/device/platform_design/send_packet_1_avalon_master_byteenable
# add wave -group avalon_mem_1    -label "write"          /tb_sfp_test/device/platform_design/send_packet_1_avalon_master_write
# add wave -group avalon_mem_1    -label "writedata"      /tb_sfp_test/device/platform_design/send_packet_1_avalon_master_writedata

# add wave -group avalon_mem_2    -label "chipselect"     /tb_sfp_test/device/platform_design/send_packet_2_avalon_master_chipselect
# add wave -group avalon_mem_2    -label "readdata"       /tb_sfp_test/device/platform_design/send_packet_2_avalon_master_readdata
# add wave -group avalon_mem_2    -label "address"        /tb_sfp_test/device/platform_design/send_packet_2_avalon_master_address
# add wave -group avalon_mem_2    -label "byteenable"     /tb_sfp_test/device/platform_design/send_packet_2_avalon_master_byteenable
# add wave -group avalon_mem_2    -label "write"          /tb_sfp_test/device/platform_design/send_packet_2_avalon_master_write
# add wave -group avalon_mem_2    -label "writedata"      /tb_sfp_test/device/platform_design/send_packet_2_avalon_master_writedata

# add wave -group send_packet_1    -label "wait_data_flag"        /tb_sfp_test/device/platform_design/send_packet_1/send_packet_1/wait_data_flag
# add wave -group send_packet_1    -label "count_prepare_wait"    /tb_sfp_test/device/platform_design/send_packet_1/send_packet_1/count_prepare_wait
# add wave -group send_packet_1    -label "state"                 /tb_sfp_test/device/platform_design/send_packet_1/send_packet_1/state
# add wave -group send_packet_1    -label "address_wait"                 /tb_sfp_test/device/platform_design/send_packet_1/send_packet_1/address_wait
# add wave -group send_packet_1    -label "ram_address_tx_local"                 /tb_sfp_test/device/platform_design/send_packet_1/send_packet_1/ram_address_tx_local

add wave -group avalon_rcv_1    -label "valid"   /tb_sfp_test/device/platform_design/tse_receive_0_valid
add wave -group avalon_rcv_1    -label "data"    /tb_sfp_test/device/platform_design/tse_receive_0_data
add wave -group avalon_rcv_1    -label "ready"   /tb_sfp_test/device/platform_design/tse_receive_0_ready
add wave -group avalon_rcv_1    -label "sop"     /tb_sfp_test/device/platform_design/tse_receive_0_startofpacket
add wave -group avalon_rcv_1    -label "eop"     /tb_sfp_test/device/platform_design/tse_receive_0_endofpacket
add wave -group avalon_rcv_1    -label "error"   /tb_sfp_test/device/platform_design/tse_receive_0_error
add wave -group avalon_rcv_1    -label "mac_rx_clk"   /tb_sfp_test/device/platform_design/tse_mac_rx_clock_connection_0_clk

add wave -group avalon_rcv_2    -label "valid"   /tb_sfp_test/device/platform_design/tse_receive_1_valid
add wave -group avalon_rcv_2    -label "data"    /tb_sfp_test/device/platform_design/tse_receive_1_data
add wave -group avalon_rcv_2    -label "ready"   /tb_sfp_test/device/platform_design/tse_receive_1_ready
add wave -group avalon_rcv_2    -label "sop"     /tb_sfp_test/device/platform_design/tse_receive_1_startofpacket
add wave -group avalon_rcv_2    -label "eop"     /tb_sfp_test/device/platform_design/tse_receive_1_endofpacket
add wave -group avalon_rcv_2    -label "error"   /tb_sfp_test/device/platform_design/tse_receive_1_error

# add wave -group avalon_mem_rcv_1    -label "chipselect"     /tb_sfp_test/device/platform_design/receive_packet_1_avalon_master_chipselect
# add wave -group avalon_mem_rcv_1    -label "readdata"       /tb_sfp_test/device/platform_design/receive_packet_1_avalon_master_readdata
# add wave -group avalon_mem_rcv_1    -label "address"        /tb_sfp_test/device/platform_design/receive_packet_1_avalon_master_address
# add wave -group avalon_mem_rcv_1    -label "byteenable"     /tb_sfp_test/device/platform_design/receive_packet_1_avalon_master_byteenable
# add wave -group avalon_mem_rcv_1    -label "write"          /tb_sfp_test/device/platform_design/receive_packet_1_avalon_master_write
# add wave -group avalon_mem_rcv_1    -label "writedata"      /tb_sfp_test/device/platform_design/receive_packet_1_avalon_master_writedata

add wave -label "cmd_send_1"    /tb_sfp_test/device/cmd_send_1
add wave -label "cmd_send_2"    /tb_sfp_test/device/cmd_send_2

add wave -group misc_1    -label "magic_wakeup"     /tb_sfp_test/device/platform_design/mac_misc_1_magic_wakeup
add wave -group misc_1    -label "magic_sleep_n"    /tb_sfp_test/device/platform_design/mac_misc_1_magic_sleep_n

add wave -group fifo_status    -label "clk"         /tb_sfp_test/device/platform_design/pll_outclk0_clk
add wave -group fifo_status    -label "data"        /tb_sfp_test/device/platform_design/receive_packet_1_fifo_status_data
add wave -group fifo_status    -label "valid"       /tb_sfp_test/device/platform_design/receive_packet_1_fifo_status_valid
add wave -group fifo_status    -label "channel"     /tb_sfp_test/device/platform_design/receive_packet_1_fifo_status_channel


# i2c expander test
add wave -group i2c_slave -label "clk"          /tb_sfp_test/i2c_slave/clk
add wave -group i2c_slave -label "state"        /tb_sfp_test/i2c_slave/state
add wave -group i2c_slave -label "byte_cnt"     /tb_sfp_test/i2c_slave/counter
add wave -group i2c_slave -label "start"        /tb_sfp_test/i2c_slave/start_detect
add wave -group i2c_slave -label "slave_rx"     /tb_sfp_test/slave_rx
add wave -group i2c_slave -label "slave_ack"    /tb_sfp_test/slave_ack
add wave -group i2c_slave -label "slave_r"      /tb_sfp_test/slave_r
add wave -group i2c_slave -label "slave_w"      /tb_sfp_test/slave_w
add wave -group i2c_slave -label "cnt_ack"      /tb_sfp_test/cnt_ack
add wave -group i2c_slave -label "reg_addr_wr"  /tb_sfp_test/reg_addr_wr
add wave -group i2c_slave -label "reg_0"        /tb_sfp_test/reg_0
add wave -group i2c_slave -label "reg_1"        /tb_sfp_test/reg_1
add wave -group i2c_slave -label "reg_2"        /tb_sfp_test/reg_2
add wave -group i2c_slave -label "reg_3"        /tb_sfp_test/reg_3


add wave -group leds -label "green"     /tb_sfp_test/device/expander_device/sfp_gled
add wave -group leds -label "red"       /tb_sfp_test/device/expander_device/sfp_rled

add wave -group i2c_master -label "clk_50_pll"      /tb_sfp_test/device/clk_50_pll
add wave -group i2c_master -label "timer"           /tb_sfp_test/device/timer
add wave -group i2c_master -label "need_write_o"    /tb_sfp_test/device/expander_device/need_write_reg_o
add wave -group i2c_master -label "need_read_o"     /tb_sfp_test/device/expander_device/need_read_reg_o
add wave -group i2c_master -label "need_read_i"     /tb_sfp_test/device/expander_device/need_read_reg_i
add wave -group i2c_master -label "dev_ready"       /tb_sfp_test/device/dev_ready
add wave -group i2c_master -label "state_ctrl_exp"       /tb_sfp_test/device/state


run 200us 
wave zoom full
