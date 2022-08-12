`define REG_ADDR        4'h0
`define REG_DATA_0      4'h1
`define REG_DATA_1      4'h2
`define REG_CTRL        4'h3
`define REG_R_DATA      4'h4

module control_i2c_master
(
    input   logic   clk     ,
    input   logic   reset   ,

    input   logic   clk_i2c ,

//Avalon MM interface
    input   logic [3:0]     mm_addr     ,
    input   logic           mm_read     ,
    input   logic           mm_write    ,
    input   logic [31:0]    mm_write_data,
    output  logic [31:0]    mm_read_data,

//i2c interface without tristate buffers
    output  logic   i2c_oe      ,
    output  logic   i2c_sda_out ,
    input   bit     i2c_sda_in  ,
    input   bit     i2c_scl_in  ,
    output  logic   i2c_scl_out

);

//TODO Нужно реализовать этот функционал и можно проверить на плате DS538
/*
RW mode is about how to read/write data from/to slave:
0 - with reg address
1 - without reg address
*/
parameter read_write_mode = 0;

bit [7:0]   master_tx_data  ;
bit [6:0]   master_address  ;
bit         master_enable   ;
bit         master_rw       ;
bit         master_restart  ;
bit         master_reset_n  ;

logic [7:0] master_rxdata   ;
logic       master_ack      ;
logic       master_nack     ;
logic       master_ready    ;

//Module i2c_master connection
i2c_master master
(
    .clk        (clk_i2c        ),
    .reset_n    (~reset         ),

    .txdata     (master_tx_data ),
    .address    (master_address ),
    .enable     (master_enable  ),
    .rw         (master_rw      ),
    .restart    (master_restart ),
    

    .rxdata     (master_rxdata  ),
    .ack        (master_ack     ),
    .nack       (master_nack    ),
    .ready      (master_ready   ),
    
    .oe         (i2c_oe      ),
    .sda_out    (i2c_sda_out ),
    .sda_in     (i2c_sda_in  ),
    .scl_in     (i2c_scl_in  ),
    .scl_out    (i2c_scl_out)
);

logic   [6:0]   reg_address;
logic   [7:0]   reg_data_0;
logic   [7:0]   reg_data_1;
logic   [31:0]  reg_control;
logic   [7:0]   reg_r_data;

logic wr_rq;
logic rd_rq;  

logic prev_ack;

logic [2:0] cnt_ack;

/*
Регистры
ADDRESS - адрес устройства
DATA_0 - первые данные после адреса устройства, 
            обычно адрес регистра в устройстве
DATA_1  -   вторые данные, обычно данные для записи в регистр

Control - старт передачи в первом бите и запись/чтение во втором бите, 
            выставляем после записи необходимых значений в регистры адреса и данных,
            в 5-м бите хранится значение ready, которое надо читать перед началом операции 
            и после окончания (чтобы начинать следующие операции)

R_DATA - полученные данные
*/

always_ff@(posedge clk, posedge reset)
begin
    if(reset)
    begin
        reg_address <= 7'd0;
        reg_data_0  <= 8'd0;
        reg_data_1  <= 8'd0;
        reg_control <= 32'd0;
    end
    else
    begin
        if(mm_write)
        begin
            case(mm_addr)
            `REG_ADDR:
            begin
                reg_address <= mm_write_data[6:0];
            end 
            `REG_DATA_0:
            begin
                reg_data_0 <= mm_write_data[7:0];
            end 
            `REG_DATA_1:
            begin
                reg_data_1 <= mm_write_data[7:0];
            end 
            `REG_CTRL:
            begin
                reg_control <= mm_write_data[31:0];
            end 
            `REG_R_DATA:
            begin
                //nothing
            end 
            default: ;
            endcase
        end
        
        if(cnt_ack == 3'd3 && reg_control[1] && read_write_mode == 0)
        begin
            reg_control <= {26'd0, 1'b1, 5'd0};
        end
        else if(cnt_ack == 3'd2 && reg_control[1] && read_write_mode == 1)
        begin
            reg_control <= {26'd0, 1'b1, 5'd0};
        end
        else if(cnt_ack == 3'd3 && ~reg_control[1] && master_nack && read_write_mode == 0)
        begin
            reg_control <= {26'd0, 1'b1, 5'd0};
        end   
        else if(cnt_ack == 3'd1 && ~reg_control[1] && master_nack && read_write_mode == 1)
        begin
            reg_control <= {26'd0, 1'b1, 5'd0};
        end               
    end
end

always_ff @(posedge clk, posedge reset)
begin
    if(reset)
    begin
        mm_read_data <= 32'd0;
    end
    else
    begin
        if(mm_read)
        begin
            case(mm_addr)
            `REG_ADDR  :     mm_read_data <= {25'd0, reg_address}    ;
            `REG_DATA_0:     mm_read_data <= {24'd0, reg_data_0}     ;
            `REG_DATA_1:     mm_read_data <= {24'd0, reg_data_1}     ;
            `REG_CTRL  :     mm_read_data <= reg_control             ;
            `REG_R_DATA:     mm_read_data <= {24'd0, reg_r_data}     ;
            default:        mm_read_data <= 32'd0;
            endcase
        end
        else
        begin
            mm_read_data <= mm_read_data;
        end
    end
end

always_ff@(posedge clk, posedge reset)
begin
    if(reset)
    begin
        wr_rq <= 1'b0;
        rd_rq <= 1'b0;
        reg_r_data <= 8'd0;
    end
    else
    begin
        if(mm_write & mm_addr == `REG_CTRL )
        begin
            if(mm_write_data[0] & mm_write_data[1])
            begin
                wr_rq <= 1'b1;
            end
            else if (mm_write_data[0] & ~mm_write_data[1])
            begin
                rd_rq <= 1'b1;
            end
        end
        else if(wr_rq || rd_rq)
        begin
            if(cnt_ack == 2'b11 && read_write_mode == 0)
            begin
                wr_rq <= 1'b0;
                // reg_r_data <= master_rxdata;
            end
            else if(cnt_ack == 2'b10 && read_write_mode == 1)
            begin
                wr_rq <= 1'b0;
                // reg_r_data <= master_rxdata;
            end            
            else if(master_nack && rd_rq)
            begin
                rd_rq <= 1'b0;
                reg_r_data <= master_rxdata;
            end
        end
    end
end

always_ff @(posedge clk, posedge reset)
begin
    if(reset)
    begin
        master_enable <= 1'b0;
        master_address <= 7'd0;
        master_tx_data <= 8'd0;
        master_restart <= 1'b0;
    end
    else
    begin
        if(wr_rq)
        begin
            if(read_write_mode == 0)
            begin
                if(cnt_ack == 2'd0)
                begin
                    master_rw <= 1'b0;
                    master_enable <= 1'b1;
                    master_address <= reg_address;
                    master_tx_data <= reg_data_0;
                end
                else if (cnt_ack == 2'd1)
                begin
                    master_tx_data <= reg_data_1;
                end
                else if (cnt_ack == 2'd2)
                begin
                    master_enable <= 1'b0;
                end                  
            end
            else if(read_write_mode == 1)
            begin
                if(cnt_ack == 2'd0)
                begin
                    master_rw <= 1'b0;
                    master_enable <= 1'b1;
                    master_address <= reg_address;
                    master_tx_data <= reg_data_1;
                end
                else if (cnt_ack == 2'd1)
                begin
                    master_enable <= 1'b0;
                end                 
            end         
        end
        else if(rd_rq)
        begin
            if(read_write_mode == 0)
            begin
                if(cnt_ack == 2'd0)
                begin
                    master_rw <= 1'b0;
                    master_enable <= 1'b1;
                    master_address <= reg_address;
                    master_tx_data <= reg_data_0;
                end
                else if (cnt_ack == 2'd1)
                begin
                    master_rw <= 1'b1;
                    master_restart <= 1'b1;
                end 
                else if (cnt_ack == 2'd2)
                begin
                    master_restart <= 1'b0;
                end             
                else if(cnt_ack == 2'd3)
                begin
                    master_enable <= 1'b0;
                end   
            end
            else if(read_write_mode == 1)
            begin
                if(cnt_ack == 2'd0)
                begin
                    master_rw <= 1'b1;
                    master_enable <= 1'b1;
                    master_address <= reg_address;
                end            
                else if(cnt_ack == 2'd1)
                begin
                    master_enable <= 1'b0;
                end                 
            end
        end
        else
        begin
            master_enable <= 1'b0;
        end
    end
end


always_ff @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		cnt_ack <= 3'd0;
		prev_ack <= 1'b0;
	end
	else
	begin
		if(master_ack )
		begin
			if(!prev_ack)
			begin
				prev_ack <= master_ack;
                cnt_ack <= cnt_ack + 3'd1;
			end
		end
		else if(master_nack)
		begin
			if(~wr_rq || ~rd_rq) cnt_ack <= 3'd0;
			else if(cnt_ack == 2'b10) cnt_ack <= 2'b11;
		end
		else
		begin
			prev_ack <= 1'b0;
			if(/*cnt_ack == 3'd3 && */(~wr_rq && ~rd_rq)) cnt_ack <= 0;
		end
	end
end
endmodule