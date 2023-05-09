// (C) 2001-2021 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on
module altpciexpav128_p2a_addrtrans (  
                        k_bar_i,
                        cb_p2a_avalon_addr_b0_i,
                        cb_p2a_avalon_addr_b1_i,
                        cb_p2a_avalon_addr_b2_i,
                        cb_p2a_avalon_addr_b3_i,
                        cb_p2a_avalon_addr_b4_i,
                        cb_p2a_avalon_addr_b5_i,
                        cb_p2a_avalon_addr_b6_i,
                        PCIeAddr_i,
                        BarHit_i,
                        AvlAddr_o
                       );
                       
input [223:0] k_bar_i;
input [31:0] cb_p2a_avalon_addr_b0_i;
input [31:0] cb_p2a_avalon_addr_b1_i;
input [31:0] cb_p2a_avalon_addr_b2_i;
input [31:0] cb_p2a_avalon_addr_b3_i;
input [31:0] cb_p2a_avalon_addr_b4_i;
input [31:0] cb_p2a_avalon_addr_b5_i;
input [31:0] cb_p2a_avalon_addr_b6_i;
input [63:0] PCIeAddr_i;
input [6:0] BarHit_i;
output [63:0] AvlAddr_o;


reg [63:0] bar_parameter;
reg [63:0] avl_addr;

wire [31:0] bar0;   
wire [31:0] bar1; 
wire [31:0] bar2; 
wire [31:0] bar3; 
wire [31:0] bar4; 
wire [31:0] bar5; 
wire [31:0] exp_rom_bar; 
wire        bar0_64bit;
wire        bar1_64bit;
wire        bar2_64bit;


assign bar0_64bit = k_bar_i[2];
assign bar2_64bit = k_bar_i[66];
assign bar4_64bit = k_bar_i[130];
assign bar0 = k_bar_i[31:0];       
assign bar1 = k_bar_i[63:32]; 
assign bar2 = k_bar_i[95:64]; 
assign bar3 = k_bar_i[127:96]; 
assign bar4 = k_bar_i[159:128]; 
assign bar5 = k_bar_i[191:160]; 
assign exp_rom_bar = k_bar_i[223:192]; 

// mux to select the right BAR parameter to use.
// based on the BAR hit information, determined BAR paremeter
// is used for the address translation

always  @(BarHit_i or bar0 or bar1 or bar2 or bar3 or bar4 or bar5 or
		  exp_rom_bar or bar0_64bit or bar2_64bit or bar4_64bit)
begin
  case (BarHit_i)
    7'b0000001 : if (bar0_64bit) bar_parameter = {bar1,bar0};
                 else            bar_parameter = {32'b0,bar0};
    7'b0000010 : bar_parameter = {32'b0,bar1};
    7'b0000100 : if (bar2_64bit) bar_parameter = {bar3,bar2};
                 else            bar_parameter = {32'b0,bar2};
    7'b0001000 : bar_parameter = {32'b0,bar3};
    7'b0010000 : if (bar4_64bit) bar_parameter = {bar5,bar4};
                 else            bar_parameter = {32'b0,bar4};
    7'b0100000 : bar_parameter = {32'b0,bar5};
    7'b1000000 : bar_parameter = {32'b0,exp_rom_bar};
    default    : bar_parameter = 64'h0;
  endcase
end


// mux to select the right avalon address entry to use
// Based on the BAR hit information, select which entry in the table to
// be used for the address translation

always  @(BarHit_i or cb_p2a_avalon_addr_b0_i or cb_p2a_avalon_addr_b1_i or
        cb_p2a_avalon_addr_b2_i or cb_p2a_avalon_addr_b3_i or
        cb_p2a_avalon_addr_b4_i or cb_p2a_avalon_addr_b5_i or
        cb_p2a_avalon_addr_b6_i)
begin
  case (BarHit_i )
    7'b0000001 : avl_addr = {32'b0,cb_p2a_avalon_addr_b0_i};
    7'b0000010 : avl_addr = {32'b0,cb_p2a_avalon_addr_b1_i};
    7'b0000100 : avl_addr = {32'b0,cb_p2a_avalon_addr_b2_i};
    7'b0001000 : avl_addr = {32'b0,cb_p2a_avalon_addr_b3_i};
    7'b0010000 : avl_addr = {32'b0,cb_p2a_avalon_addr_b4_i};
    7'b0100000 : avl_addr = {32'b0,cb_p2a_avalon_addr_b5_i};
    7'b1000000 : avl_addr = {32'b0,cb_p2a_avalon_addr_b6_i};
    default    : avl_addr = 64'h0;
  endcase
end

// address translation. The high order bits is from the corresponding
// entry of the table and low order is passed through unchanged.
assign AvlAddr_o = (PCIeAddr_i & ~({bar_parameter[63:4], 4'b0000})) |
                   (avl_addr & ({bar_parameter[63:4], 4'b0000})) ;

endmodule
