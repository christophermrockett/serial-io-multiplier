module project (input in, start, rst, clk,
		output out, done);
	
	wire [7:0] o_sp, o_mp4;
	wire i_mul, i_load1, i_load2;
	
	controllerfsm cfsm_00 (.clk(clk), .rst(rst), .start(start), .done(done), .mul(i_mul), .load1(i_load1), .load2(i_load2));
	serialparallel sp_00 (.in(in), .load(i_load1), .rst(rst), .clk(clk), .out(o_sp));
	multiplier4 mp4_00 (.in(o_sp), .mul(i_mul), .out(o_mp4));
	parallelserial ps_00 (.in(o_mp4), .load(i_load2), .rst(rst), .clk(clk), .out(out));
	
endmodule