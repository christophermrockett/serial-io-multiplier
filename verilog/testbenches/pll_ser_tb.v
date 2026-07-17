module parallelserial_tb;
	reg [7:0] in;
	reg clk, rst, load;
	wire out;
	
	initial clk = 0;
	always #10 clk = ~clk;
	
	parallelserial sp_00 (.in(in), .load(load), .rst(rst), .clk(clk), .out(out));
	
	initial begin
		rst = 0;
		in = 8'b00000000;
		load = 0;
		
		#25 rst = 1;
		
		#20 in = 8'b11001010; // Should display 11001010 then reset to 0
		
		#20 load = 1;
		#20 load = 0;
		
		#160
		
		#20 rst = 0;
		#20 rst = 1;
		
		#20
		
		#20 in = 8'b10101010; // Should display 10101010
		
		#20 load = 1;
		#20 load = 0;
		
		#160
		
		#20 rst = 0;
		#20 rst = 1;
		
		#20
		
		#20 in = 8'b11001011; // Should display 11001011
		
		#20 load = 1;
		#20 load = 0;
		
		#160 	
		
		#10 $stop; 
	end
	initial $monitor($time, " in=%b clk=%b rst=%b load=%b out=%b", in, clk, rst, load, out);
endmodule