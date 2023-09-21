`define REG_SEND_PACKET             16'h0050
`define REG_TEST                    16'h0010
`define REG_DDR_STATUS              16'h00C0
`define REG_DDR_CNTRL               16'h00B0
`define REG_SEND_CHANNEL_2_TIMER    16'h0060

module avalon_mm_slave 
(
    input   logic             clk                   ,
    input   logic             rst_n                 ,

    input   logic             avalon_mm_write       ,
    input   logic             avalon_mm_read        ,
    input   logic   [31:0]    avalon_mm_write_data  ,
    output  logic   [31:0]    avalon_mm_read_data   ,
    input   logic   [15:0]    avalon_mm_addr        ,
    output  logic             avalon_mm_rd_valid    ,


    output  logic             send_cmd              ,
    output  logic   [5:0]     start_ram_addr        ,
    output  logic   [31:0]    send_ch_2_timer       ,

    input   logic             ddr_local_cal_success ,
    input   logic             ddr_local_cal_fail    ,
    input   logic             ddr_setup_done        ,
    input   logic             system_main_reset     ,
    input   logic             ddr_avalon_rst,
    input   logic             board_reset,
    output  logic             ddr_setup_cmd
);

logic [31:0] data_reg_send_packet;

assign  send_cmd        =   data_reg_send_packet[5];
assign  start_ram_addr  =   data_reg_send_packet[13:8]; 

logic [31:0] ddr_status;
logic d_ddr_local_success;
logic d_ddr_local_fail;

logic d_system_main_reset;
logic d_ddr_avalon_rst;

always_ff @(posedge clk)
begin
    d_ddr_local_success <= ddr_local_cal_success;
    d_ddr_local_fail <= ddr_local_cal_fail;

    d_system_main_reset <= system_main_reset;

    d_ddr_avalon_rst <= ddr_avalon_rst;
end

assign ddr_status = {26'h0, board_reset, d_ddr_avalon_rst, d_system_main_reset, ddr_setup_done, d_ddr_local_success, d_ddr_local_fail};

always_ff @(posedge clk, negedge rst_n)
begin
    if(!rst_n)
    begin
        data_reg_send_packet <= 32'd0;
        ddr_setup_cmd <= 1'b0;

        send_ch_2_timer <= 32'h01646033;
    end
    else
    begin
        if(avalon_mm_write & avalon_mm_addr == `REG_SEND_PACKET)
        begin
            data_reg_send_packet <= avalon_mm_write_data;
        end
        else if (avalon_mm_write & avalon_mm_addr == `REG_DDR_CNTRL) 
        begin
            ddr_setup_cmd <= avalon_mm_write_data[0];
        end
        else if (avalon_mm_write & avalon_mm_addr == `REG_SEND_CHANNEL_2_TIMER) 
        begin
            send_ch_2_timer <= avalon_mm_write_data[31:0];
        end
    end
end

always_ff @(posedge clk, negedge rst_n)
begin
    if(!rst_n)
    begin
        avalon_mm_read_data <= 32'd0;
    end
    else
    begin
        if(avalon_mm_read & avalon_mm_addr == `REG_SEND_PACKET)
        begin
            avalon_mm_read_data <= data_reg_send_packet;
        end
        else if(avalon_mm_read & avalon_mm_addr == `REG_TEST)
        begin
            avalon_mm_read_data <= 32'hff0ff423;
        end
        else if(avalon_mm_read & avalon_mm_addr == `REG_DDR_STATUS)
        begin
            avalon_mm_read_data <= ddr_status;
        end
        else if(avalon_mm_read & avalon_mm_addr == `REG_SEND_CHANNEL_2_TIMER)
        begin
            avalon_mm_read_data <= send_ch_2_timer;
        end
        else if(avalon_mm_read)
        begin
            avalon_mm_read_data <= 32'd0;
        end
    end
end

always_ff @(posedge clk, negedge rst_n)
begin
    if(!rst_n)
    begin
        avalon_mm_rd_valid <= 1'b0;
    end
    else
    begin
        if(avalon_mm_read)
        begin
            avalon_mm_rd_valid  <= 1'b1;
        end
        else
        begin
            avalon_mm_rd_valid <= 1'b0;
        end
    end
end

endmodule