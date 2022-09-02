`timescale 1ns/1ns
module tb_sfp_test;

logic clk_50;
logic clk_125_lvds;

logic rst_n;

logic sgmii_rxd_1;
logic sgmii_txd_1;

logic sgmii_rxd_2;
logic sgmii_txd_2;

logic reset_phy;

logic clk_1250;

wire i2c_scl;
wire i2c_sda;

sfp_test_top device (
    .clk_50             (clk_50         ),
    .rst_n              (rst_n          ),

    .clk_125_lvds_tse   (clk_125_lvds   ),
    .reset_phy          (reset_phy      ),

    .sgmii_rx_1         (/*sgmii_txd_1*/    ), 
    .sgmii_tx_1         (sgmii_txd_1    ),

    .sgmii_rx_2         (sgmii_txd_2    ), 
    .sgmii_tx_2         (sgmii_txd_2    ),

    .i2c_scl_1          (i2c_scl        ),
    .i2c_sda_1          (i2c_sda        )
);

int counter_test;

initial 
begin
    clk_50          = 1'b0   ;
    clk_125_lvds    = 1'b0   ;
    rst_n           = 1'b1   ;

    counter_test = 0;
end

always #10 clk_50 = ~clk_50;
always #4 clk_125_lvds = ~clk_125_lvds;

always @(posedge clk_125_lvds) 
begin
    counter_test++;
    if(counter_test == 20)
    begin
        rst_n = 1'b0;
    end
    else if(counter_test == 370)
    begin
        rst_n = 1'b1;
    end
end

//For i2c testing
logic [7:0] slave_rx;
logic [7:0] slave_tx;
logic   slave_ack;
logic   slave_r;
logic   slave_w;

logic clk_100;

i2c_slave i2c_slave
(
    .clk        (clk_100),
    .reset_n    (rst_n),
    .scl        (i2c_scl),
    .sda        (i2c_sda),
    .txdata     (slave_tx),
    .rxdata     (slave_rx),
    .ack        (slave_ack),
    .r          (slave_r),
    .w          (slave_w)
);



initial 
begin
    clk_100          = 1'b0   ;
end

always #5 clk_100 = ~clk_100;

logic [2:0] cnt_ack;
logic [2:0] cnt_ack_d;

logic slave_ack_d;

always_ff @(posedge clk_100, negedge rst_n)
begin
  if(~rst_n)
  begin
    slave_ack_d <= 1'b0;
  end
  else
  begin
    slave_ack_d <= slave_ack;
  end
end

always_ff @(posedge clk_100, negedge rst_n)
begin
  if(~rst_n)
  begin
    cnt_ack_d <= 3'd0;
  end
  else
  begin
    cnt_ack_d <= cnt_ack;
  end
end

always_ff @( posedge clk_100, negedge rst_n ) 
begin
  if(~rst_n)
  begin
    cnt_ack <= 3'd0;
  end
  else
  begin
    if(slave_ack & ~slave_ack_d)
    begin
        cnt_ack <= cnt_ack + 3'd1;
    end
    else if(cnt_ack == 3'd2 & ~slave_ack)
    begin
        cnt_ack <= 3'd0;
    end
  end
end

logic [7:0] reg_0;
logic [7:0] reg_1;
logic [7:0] reg_2;
logic [7:0] reg_3;

logic [7:0] reg_addr_wr;

always_comb
begin
  case (reg_addr_wr)
  8'd0: slave_tx = reg_0; 
  8'd1: slave_tx = reg_1; 
  8'd2: slave_tx = reg_2; 
  8'd3: slave_tx = reg_3; 
  default: slave_tx = reg_0;
  endcase
end

always_ff @(posedge clk_100, negedge rst_n) 
begin
    if(~rst_n)
    begin
        reg_0 <= 8'd5;
        reg_1 <= 8'd6;
        reg_2 <= 8'd0;
        reg_3 <= 8'd0;
    end
    else
    begin
        if(slave_ack && slave_w)
        begin
        if(cnt_ack == 3'd2 && cnt_ack_d == 3'd1)
        begin
            case (reg_addr_wr)
            8'd0: reg_0 <= slave_rx; 
            8'd1: reg_1 <= slave_rx; 
            8'd2: reg_2 <= slave_rx; 
            8'd3: reg_3 <= slave_rx; 
            default: reg_0 <= reg_0;
            endcase
        end
        else if(cnt_ack == 3'd1 && cnt_ack_d == 3'd0)
        begin
            reg_addr_wr <= slave_rx;
        end
        end
    end
end

endmodule