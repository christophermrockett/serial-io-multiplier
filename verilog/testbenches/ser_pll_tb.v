module SIPO_tb;
	reg in, rst, load, clk;
	wire [7:0] out;
	serialparallel DUT (.in(in), .load(load), .rst(rst), .clk(clk), .out(out));
	// 10 time - unit period clock
	always #10 clk = ~ clk;
	initial begin
		clk = 0;
		in = 0;
		load = 0;
		rst = 0; // active - low reset asserted
		// release reset
		#20 rst = 1;
		//load = 1
		#20 load = 1;
		
		// TEST 1: shifting of bits ( LSB -> MSB )
		#20 in = 1; // will be captured at next posedge
		#20 in = 0;
		#80;
		// TEST 2: reset back to 8’h00
		#30;
		#20 in = 1; // will be captured at next posedge
		#20 in = 0;
		#40 rst = 0;
		// TEST 3: load = 0
		#40 load = 0;
		#20 in = 1;
		#20 in = 0;
		#80
		#80 $finish;
	end
	initial begin
		$monitor ($time , "in =%b clk =%b rst =%b load =%b out =%b ", in, rst, load, clk, out);
	end
endmodule