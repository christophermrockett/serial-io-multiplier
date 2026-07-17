module parallelserial (	input [7:0] in, 
			input load, rst, clk,
			output reg out);
	
	reg [7:0] shift;
	
	always @(posedge clk or negedge rst) begin
	
		if (rst == 0) begin
			shift <= 8'b00000000;
			out <= 0;
		end
		
		else if (load == 1) begin
			shift <= in;
			out <= in[7];
			end
			
		else begin
			out <= shift[6];
			shift <= shift << 1;
			end
			
		end
endmodule