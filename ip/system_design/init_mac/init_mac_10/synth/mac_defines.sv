//Register addresses

//Base configuration registers
`define REV_MAC_ADDR            8'h00
`define SCRATCH_MAC_ADDR        8'h01
`define COMMAND_CONFIG_ADDR     8'h02
`define MAC_0_ADDR              8'h03
`define MAC_1_ADDR              8'h04
`define FRM_LENGTH_ADDR         8'h05
`define PAUSE_QUANT_ADDR        8'h06
`define RX_SECTION_EMPTY_ADDR   8'h07
`define RX_SECTION_FULL_ADDR    8'h08
`define TX_SECTION_EMPTY_ADDR   8'h09
`define TX_SECTION_FULL_ADDR    8'h0A
`define RX_ALMOST_EMPTY_ADDR    8'h0B
`define RX_ALMOST_FULL_ADDR     8'h0C
`define TX_ALMOST_EMPTY_ADDR    8'h0D
`define TX_ALMOST_FULL_ADDR     8'h0E
`define MDIO_ADDR_0_ADDR        8'h0F
`define MDIO_ADDR_1_ADDR        8'h10
`define HOLDOFF_QUANT_ADDR      8'h11
`define TX_IPG_LENGTH_ADDR      8'h17

//PCS Configuration Register Space
`define OFFSET_PCS_ADDRS        8'h80

`define CONTROL_ADDR            8'h00 + `OFFSET_PCS_ADDRS
`define STATUS_ADDR             8'h01 + `OFFSET_PCS_ADDRS
`define PHY_ID_0_ADDR           8'h02 + `OFFSET_PCS_ADDRS
`define PHY_ID_1_ADDR           8'h03 + `OFFSET_PCS_ADDRS
`define DEV_ABILITY_ADDR        8'h04 + `OFFSET_PCS_ADDRS
`define PARTNER_ABILITY_ADDR    8'h05 + `OFFSET_PCS_ADDRS
`define AN_EXPANSION_ADDR       8'h06 + `OFFSET_PCS_ADDRS
`define DEVICE_NEXT_PAGE_ADDR   8'h07 + `OFFSET_PCS_ADDRS
`define PARTHER_NEXT_PAGE_ADDR  8'h08 + `OFFSET_PCS_ADDRS
`define MASTER_SLAVE_CNTRL_ADDR 8'h09 + `OFFSET_PCS_ADDRS
`define MASTER_SLAVE_STAT_ADDR  8'h0A + `OFFSET_PCS_ADDRS
`define EXTENDED_STATUS_ADDR    8'h0F + `OFFSET_PCS_ADDRS
`define SCRATCH_PCS_ADDR        8'h10 + `OFFSET_PCS_ADDRS
`define REV_PCS_ADDR            8'h11 + `OFFSET_PCS_ADDRS
`define LINK_TIMER_0_ADDR       8'h12 + `OFFSET_PCS_ADDRS
`define LINK_TIMER_1_ADDR       8'h13 + `OFFSET_PCS_ADDRS
`define IF_MODE_ADDR            8'h14 + `OFFSET_PCS_ADDRS

//Register initial values

//MAC_REGISTERS
`define COMMAND_CONFIG      32'b0000_0000_1000_0000_1000_0000_0011_0000
`define DISABLE_TX_RX       `COMMAND_CONFIG 
`define ENABLE_TX_RX        `DISABLE_TX_RX + 32'h3 //32'h00800223

`define FIFO_DEPTH          32'd2048

`define TX_SECTION_EMPTY    `FIFO_DEPTH - 32'd16
`define TX_ALMOST_FULL      32'd3   
`define TX_ALMOST_EMPTY     32'd30//32'd8 
`define TX_SECTION_FULL     32'd60//32'd16


`define RX_SECTION_EMPTY    `FIFO_DEPTH - 32'd16
`define RX_ALMOST_FULL      32'd8   
`define RX_ALMOST_EMPTY     32'd8 
`define RX_SECTION_FULL     32'd16

`define MAC_0               32'h17231C00
`define MAC_1               32'h0000CB4A

`define FRM_LENGTH          32'd1518
`define TX_IPG_LENGTH       32'd12
`define PAUSE_QUANT         32'h0000FFFF

`define MAC_RESET           32'b0000_0000_0000_0000_0010_0000_0000_0000

//PCS_REGISTERS
`define PCS_RESET           32'b0000_0000_0000_0000_1000_0000_0000_0000

`define LINK_TIMER_0        32'h0000_0D40
`define LINK_TIMER_1        32'h0000_0003

`define IF_MODE             32'h0000_0003

`define TEST 1

`ifdef TEST
    `define WAIT_INIT_TIME      32'd5_000
    `define PCS_CONTROL_INIT    32'b0000_0000_0000_0000_0000_0001_0100_0000
`else
    `define WAIT_INIT_TIME      32'd500_000
    `define PCS_CONTROL_INIT    32'b0000_0000_0000_0000_0001_0001_0100_0000
`endif
