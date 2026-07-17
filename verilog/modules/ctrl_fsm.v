module controllerfsm (	input clk, rst, start,
			output reg done, mul, load1, load2);
	
	reg [1:0] state, next_state;
	reg [3:0] count;
	
	
	always @(posedge clk or negedge rst) begin
		
		if (rst == 0) begin
		state <= 2'b00;
		count <= 4'b0000;
		end

		else begin
			if (state != next_state)
			count <= 4'b0000;
			
			else
			count <= count + 1;
			
		state <= next_state;
			
		end
		
	end
	
	always @(*) begin
		
		next_state = state;
		load1 = 0;
		load2 = 0;
		done = 0;
		mul = 0;
		
		case (state)
			
			2'b00: begin
				if (start == 1) 
				next_state = 2'b01;
				end

			2'b01: begin
				if (count == 4'b1000) begin
				load1 = 1;
				next_state = 2'b10;
				end
				end

			2'b10: 	begin
				mul = 1;
				if (count == 4'b0001) begin
				load2 = 1;
				done =1;
				next_state = 2'b11;
				end
				end
			
			2'b11: 	begin
				mul = 1;
				if (count == 4'b1000) begin
				next_state = 2'b00;
				end
				end

		endcase
	end
endmodule