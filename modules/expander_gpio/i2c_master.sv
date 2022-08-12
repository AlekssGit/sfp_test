module i2c_master
	(
		input clk,
		input bit [7:0] txdata,
		input bit [6:0] address,
		input bit enable,
		input bit rw,
		input bit restart,
		input bit reset_n,

//		inout reg scl,
//		inout reg sda,

		output reg [7:0] rxdata,
		output reg ack,
		output reg nack,
		output reg ready,
		
		output reg oe,
		output reg sda_out,
		input bit sda_in,
		input bit scl_in,
		output reg scl_out
	);

	enum int unsigned {
		IDLE,
		START,
		STOP_0,
		STOP_1,
		WAIT,
		ADRS_0,
		ADRS_1,
		RW_0,
		RW_1,
		ACK_R_0,
		ACK_W_0,
		ACK_R_1,
		ACK_W_1,
		WRITE_0,
		WRITE_1,
		READ_0,
		READ_1,
		RESTART
	} state, next;


	bit [7:0] data;
	bit [7:0] txshift;
	bit [7:0] rxshift;
	bit [2:0] byte_counter;
	bit [6:0] adrs;
	bit rw_reg;
	bit read_ack;


	// reg _sda;
	// reg _scl;

	bit arbitrary;

//	assign sda = _sda;
//	assign scl = _scl;

	assign ready = state == IDLE;
	assign read_ack = !enable || restart;

	assign arbitrary = sda_in != txshift[7];
//	assign _sda = txshift[7] ? 1'bz : 1'b0;
	
//	assign _sda = (state == READ_0 || state == READ_1 || state == ACK_W_0  || state == ACK_W_1 || state == IDLE) ? 1'bz : txshift[7];
//	
//	assign oe = (state == READ_0 || state == READ_1 || state == ACK_W_0  || state == ACK_W_1 || state == IDLE) ? 1'b1 : 1'b0;
assign oe = 1'b0;
	
	assign sda_out = txshift[7];

	always_ff @(posedge clk)
		begin
			if ((state == ACK_R_0 || state == ACK_W_0 || state == IDLE) && enable)
			begin
				data <= txdata;
			end

			if ((state == ACK_R_0 || state == ACK_W_0) && enable && restart || state == IDLE && enable)
			begin
				rw_reg <= rw;
				adrs <= address;
			end
		end

	always_ff @(posedge clk)
		begin
			if (state == ACK_W_1)
			begin
				ack <= ~sda_in;
				nack <= sda_in;
			end
			else if (state == ACK_R_1)
			begin
					ack <= ~sda_in;
					nack <= sda_in;
			end
			else
			begin
				ack <= 1'b0;
				nack <= 1'b0;
			end
		end

// start detector
	bit start_detect;
	bit stop_detect;
	bit sda_reg;

	always @(posedge clk)
		begin
			sda_reg <= sda_in;
		end

	assign start_detect = sda_reg && ~sda_in && scl_in;
	assign stop_detect = ~sda_reg && sda_in && scl_in;

// counter
	always_ff @(posedge clk, negedge reset_n)
		begin
			if (~reset_n) byte_counter <= '0;
			else if (state == ADRS_1 || state == WRITE_1 || state == READ_1 || state == RW_1 || state == WAIT)
			begin
				byte_counter <= state == WAIT ? 3'd0 : byte_counter + 3'd1;
			end	
				
		end


// state machine
	always_ff @(posedge clk, negedge reset_n)
		begin
			if (~reset_n) state <= IDLE;
			else state <= next;
		end

	always_comb
	begin
		case (state)
			IDLE: next = start_detect ? WAIT : enable ? START : IDLE;
			START: next = ADRS_0;
			STOP_0: next = STOP_1;
			STOP_1: next = IDLE;
			RESTART: next = START;

			WAIT: next = stop_detect ? IDLE : WAIT;

			ADRS_0: next = ADRS_1;
			ADRS_1: next = !scl_in ? ADRS_1 : arbitrary ? WAIT : (byte_counter == 6 ? RW_0 : ADRS_0);

			RW_0: next = RW_1;
			RW_1: next = arbitrary ? WAIT : ACK_W_0;

			ACK_R_0: next = ACK_R_1;
			ACK_W_0: next = ACK_W_1;
			ACK_R_1: next = !sda_in ? READ_0 : restart ? RESTART : STOP_0;
			ACK_W_1: next = (restart && !sda_in) ? RESTART : ((!enable || sda_in) ? STOP_0 : ((rw_reg) ? READ_0 : WRITE_0));

			WRITE_0: next = WRITE_1;
			WRITE_1: next = !scl_in ? WRITE_1 : arbitrary ? WAIT : (byte_counter == 7 ? ACK_W_0 : WRITE_0);

			READ_0: 	next = READ_1;
			READ_1:	next = !scl_in ? READ_1 : (byte_counter == 7 ? ACK_R_0 : READ_0);
			default: next = next;
		endcase
	end

// scl management
	always_comb
		begin
			case (state)
				STOP_0,
					RESTART,
					ADRS_0,
					RW_0,
					ACK_R_0,
					ACK_W_0,
					WRITE_0,
					READ_0:
					//_scl = 1'b0;
					scl_out = 1'b0;
				default: scl_out = 1'b1;//_scl = 1'bz;
			endcase
		end

	logic tx_strobe;
	assign tx_strobe = state == ADRS_0
		|| state == RW_0
		|| state == WRITE_0
		|| state == START
		|| state == RESTART
		|| state == ACK_R_0
		|| state == ACK_W_0
		|| state == STOP_0
		|| state == STOP_1
		|| state == WAIT;

	always_ff @(negedge clk, negedge reset_n)
		begin
			if (~reset_n) txshift <= '1;

			else if (tx_strobe)
				begin
					case (state)
						RESTART: txshift <= 8'b1xxxxxxx;
						START: txshift <= 8'b0xxxxxxx;
						STOP_0: txshift <= 8'b01xxxxxx;
						IDLE: txshift <= 8'b1xxxxxxx;
						ACK_R_0: txshift <= {read_ack, 7'hxx};
						
						WAIT: txshift <= 8'b1xxxxxxx;

						ADRS_0: txshift <= (byte_counter == 0) ? {adrs, rw_reg} : {txshift[6:0], 1'b1};
						WRITE_0: txshift <= (byte_counter == 0) ? data : {txshift[6:0], 1'b1};
						default: txshift <= {txshift[6:0], 1'b1};
					endcase
				end
		end

	always_ff @(negedge clk)
		begin
			if ((state == READ_1) && scl_in) rxshift <= {rxshift[6:0], sda_in};
		end

	always_ff @(posedge clk)
		begin
			if (state == ACK_R_0) rxdata <= rxshift;
		end


endmodule : i2c_master