module project_tb;

	reg in, start, rst, clk;
	wire out, done;
	
	initial clk = 0;
	always #10 clk = ~clk;
	
	project proj_00 (.in(in), .start(start), .rst(rst), .clk(clk), .out(out), .done(done));
	initial begin
		rst = 1;
		start = 0;
		in = 0;
		
		
		#20 rst = 0;
		#20 rst = 1;
		
		#20 start = 1;
		#20 start = 0; 
		in = 1;
		#20 in = 0;
		#20 in = 1;
		#20 in = 0;
		#20 in = 1;
		#20 in = 0;
		#20 in = 1;
		#20 in = 0;
		
		#260
		
		#20 rst = 0;
		#20 rst = 1;
		
		#20 start = 1;
		#20 start = 0; 
		in = 1;
		#20 in = 1;
		#20 in = 1;
		#20 in = 1;
		#20 in = 1;
		#20 in = 1;
		#20 in = 1;
		#20 in = 1;
		
		#260
		
		#20 rst = 0;
		#20 rst = 1;
		
		#20 start = 1;
		#20 start = 0; 
		in = 1;
		#20 in = 1;
		#20 in = 1;
		#20 in = 0;
		#20 in = 1;
		#20 in = 1;
		#20 in = 1;
		#20 in = 1;
		
		#260
		
		#20 rst = 0;
		#20 rst = 1;
		
		#20 start = 1;
		#20 start = 0; 
		in = 0;
		#20 in = 1;
		#20 in = 1;
		#20 in = 0;
		#20 in = 1;
		#20 in = 0;
		#20 in = 0;
		#20 in = 1;
		
		#260
		
		#10 $stop; 
	end
	initial $monitor($time, " in=%b clk=%b rst=%b start=%b out=%b done=%b, sp_00_out=%b", in, clk, rst, start, out, done, proj_00.sp_00.out);
endmodule