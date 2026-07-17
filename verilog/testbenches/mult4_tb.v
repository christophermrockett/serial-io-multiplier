module multiplier4_tb;
	reg [7:0] in;
	reg mul;
	wire [7:0] out;
	multiplier4 mul_00 (.in(in), .mul(mul), .out(out));
	
	initial begin
		in = 8'b10101010; // 1010 * 1010
		mul = 0;
		
		#50
		
		mul = 1;
		
		#50 in = 8'b11111111; // 1111 * 1111
		mul = 0;
		
		#50
		
		mul = 1;
		
		#50 in = 8'b11101111; // 1110 * 1111
		mul = 0;
		
		#50
		
		mul = 1;
		
		#50 in = 8'b01101001; // 0110 * 1001
		mul = 0;
		
		#50
		
		mul = 1;
		
		#50
		
		#10 $stop;
	end
	initial $monitor($time, "in=%b mul=%b out=%b", in, mul, out);
endmodule