module generator(
	input 	logic	nreset_i,
	input 	logic i_clk,
	output 	logic o_clk
	);
	
	parameter scaler = 100;
	reg[31:0] counter;
	always@(posedge i_clk, negedge nreset_i)
	begin
		if(~nreset_i)
		begin
			o_clk = 1'b0;
		end
		else
		begin
			if(counter < scaler)
			begin
				counter ++;
			end
			else
			begin
				counter = 0;
				o_clk = (o_clk) ? 1'b0 : 1'b1; // ~o_clk;
			end
		end	
	end
endmodule