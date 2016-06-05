module D_latch(input D,Clk,output reg Q);
	always @ (D,Clk)
		if(Clk)
			Q = D;
endmodule

module D_Flipflop(input D,Clk,output reg Q);
	always@(posedge Clk)
		Q<=D;
endmodule

/*module neg_D_Flipflop(input D,Clk,output reg Q);
	always@(negedge Clk)
		Q<=D;
endmodule*/

module part4(input D,Clock, output Qa,Qb,Qc);
	D_latch latch (D,Clock,Qa);
	D_Flipflop ff (D,Clock,Qb);
	D_Flipflop negff (D,~Clock,Qc);
endmodule
