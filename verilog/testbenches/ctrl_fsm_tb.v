module controllerfsm_tb;	
    	reg clk, rst, start;
    	wire done, mul, load1, load2;
    	initial clk = 0;
    	always #10 clk = ~clk;
    	controllerfsm fsm_00 (.clk(clk), .rst(rst), .start(start), .done(done), .mul(mul), .load1(load1), .load2(load2));
    	initial begin
            // reset behavior
    		rst = 0; start = 0;
    		#20 rst = 1;
     
    		// TEST 1: normal operation
    		#20 start = 1;
    		#20 start = 0;
    		#200;
     
    		// TEST 2: reset mid-operation
    		start = 1;
    		#20 start = 0;
    		#30 rst = 0;
    		#20 rst = 1;
    		#20;
     
    		// TEST 3: back to back operations
    		start = 1;
    		#20 start = 0;
    		#200;
    		start = 1;
    		#20 start = 0;
    		#200;
     
    		#10 $stop; 
    	end
    	initial $monitor($time, " clk=%b rst=%b start=%b done=%b mul=%b load1=%b load2=%b", clk, rst, start, done, mul, load1, load2);
endmodule