module multiplier4 (input [7:0] in,
		    input mul,
		    output reg [7:0] out);
	
	wire [3:0] A, B, c;
	wire [7:0] S1, S2, S3, S4, ppo1, ppo2, ppo3, ppo4;

	assign A = in[7:4];
	assign B = in[3:0];
	assign S1[7:4] = 4'b0000;
	assign S2[7:5] = 3'b000;
	assign S2[0]   = 1'b0;
	assign S3[7:6] = 2'b00;
	assign S3[1:0] = 2'b00;
	assign S4[7]   = 1'b0;
	assign S4[2:0] = 3'b000;
	
	and2 and2_00 (.a(A[0]), .b(B[0]), .y(S1[0]));
	and2 and2_01 (.a(A[1]), .b(B[0]), .y(S1[1]));
	and2 and2_02 (.a(A[2]), .b(B[0]), .y(S1[2]));
	and2 and2_03 (.a(A[3]), .b(B[0]), .y(S1[3]));
	
	and2 and2_10 (.a(A[0]), .b(B[1]), .y(S2[1]));
	and2 and2_11 (.a(A[1]), .b(B[1]), .y(S2[2]));
	and2 and2_12 (.a(A[2]), .b(B[1]), .y(S2[3]));
	and2 and2_13 (.a(A[3]), .b(B[1]), .y(S2[4]));
	
	and2 and2_20 (.a(A[0]), .b(B[2]), .y(S3[2]));
	and2 and2_21 (.a(A[1]), .b(B[2]), .y(S3[3]));
	and2 and2_22 (.a(A[2]), .b(B[2]), .y(S3[4]));
	and2 and2_23 (.a(A[3]), .b(B[2]), .y(S3[5]));
	
	and2 and2_30 (.a(A[0]), .b(B[3]), .y(S4[3]));
	and2 and2_31 (.a(A[1]), .b(B[3]), .y(S4[4]));
	and2 and2_32 (.a(A[2]), .b(B[3]), .y(S4[5]));
	and2 and2_33 (.a(A[3]), .b(B[3]), .y(S4[6]));
	
	rippleadder ra_0 (.a({1'b0, S1[4:1]}), .b(S2[4:1]), .cin(1'b0), .s(ppo1[4:1]), .cout(c[0]));		// first 2 multiplication lines added
	rippleadder ra_1 (.a({1'b0, ppo1[4:2]}), .b(S3[5:2]), .cin(1'b0), .s(ppo2[5:2]), .cout(c[1]));		// next 2 multiplication added
	rippleadder ra_2 (.a({1'b0, ppo2[5:3]}), .b(S4[6:3]), .cin(1'b0), .s(ppo3[6:3]), .cout(c[2]));		// next 2 multiplication added
	rippleadder ra_3 (.a({c[2], ppo3[6:4]}), .b({1'b0, c[1], c[0], 1'b0}), .cin(1'b0), .s(ppo4[7:4]), .cout(c[3]));	// carries added
	
	always @(*) begin
		if (mul == 1)
		out = {ppo4[7:5], ppo3[4:3], ppo2[2], ppo1[1], S1[0]};
		else
		out = 8'b00000000;
	end
endmodule