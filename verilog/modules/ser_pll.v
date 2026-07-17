module serialparallel (	input in, load, rst, clk,
			output reg [7:0] out);
	
	reg [7:0] shift;
	
	always @(posedge clk or negedge rst) begin
	
		if (rst == 0) begin
			shift <= 8'b00000000;
			out <= 8'b00000000;
		end
			
		else begin
			shift <= shift << 1;
			shift[0] <= in;
			
			if (load == 1) begin
			out <= shift;
			end
			
		end
	end
endmodule