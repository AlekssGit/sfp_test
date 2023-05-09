// `include "tse_ddr_pci_qsys.sv"
module reset_module (
	input   clk         ,
	input   rst_n       ,
	output  reset_phy   ,
	output  reset 
);

parameter TIME_RESET_PHY = 32'd10_000_000;
parameter TIME_WORK_PHY  = 32'd5_000_000;

//Variables for phy_reset
//*********************************
logic need_wait_phy_work;
logic [31:0] wait_phy_work;
logic           need_reset_phy   ;
logic [31:0]    counter_reset_phy ;
//*********************************

assign reset = ~reset_phy | need_wait_phy_work;

always @(posedge clk, negedge rst_n) 
begin
    if(!rst_n)
    begin
        need_reset_phy = 1'b1;
        need_wait_phy_work = 1'b0;
    end
    else
    begin
        if(need_reset_phy)
        begin
            if(counter_reset_phy == TIME_RESET_PHY)
            begin
                need_reset_phy = 1'b0;
                need_wait_phy_work = 1'b1;
            end
        end
        else if(need_wait_phy_work)
        begin
            if(wait_phy_work == TIME_WORK_PHY)
            begin
                need_wait_phy_work = 1'b0;
            end
        end
    end
end

assign reset_phy = (need_reset_phy) ?  1'b0 : 1'b1;
always @(posedge clk, negedge rst_n) 
begin
    if(!rst_n)
    begin
        counter_reset_phy = 32'd0;
    end
    else
    begin
        if(need_reset_phy)
        begin
            counter_reset_phy++;
        end
        else
        begin
            counter_reset_phy = 32'd0;
        end
    end    
end


always @(posedge clk, negedge rst_n) 
begin
    if(!rst_n)
    begin
        wait_phy_work = 32'd0;
    end
    else
    begin
        if(need_wait_phy_work)
        begin
            wait_phy_work++;
        end
        else
        begin
            wait_phy_work = 32'd0;
        end
    end    
end

endmodule