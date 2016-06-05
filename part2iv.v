module part2iv(SW,LEDR);
	input [1:0] SW;
	output LEDR;
	part2 latch (.D(SW[0]),.Clk(SW[1]),.Q(LEDR));
endmodule
module part2(input D,Clk,output Q);
	wire R,S,S_g,R_g, Qa, Qb;
	assign S = D /*synthesis keep*/;
   assign R = ~D/*synthesis keep*/;
	assign Q = Qa;
	assign S_g = ~(S & Clk)/*synthesis keep*/;
	assign R_g = ~(R & Clk)/*synthesis keep*/;
	assign Qa = ~(S_g & Qb);
	assign Qb = ~(Qa & R_g);
endmodule