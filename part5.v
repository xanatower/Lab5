module part5(SW,KEY,LEDR,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
input [3:0] KEY;
input [9:0] SW;
output [0:6] HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
output [9:0] LEDR;
//reg [7:0] R;
//initial R = 8'b0;
//wire [7:0] Q;
reg [7:0] Q;
initial Q = 8'b0;
wire [7:0] S;
wire co;
wire [7:0] in = SW[7:0];
/*FF F0 (~KEY[1], in[0],Q[0],~KEY[0]);
FF F1 (~KEY[1], in[1],Q[1],~KEY[0]);
FF F2 (~KEY[1], in[2],Q[2],~KEY[0]);
FF F3 (~KEY[1], in[3],Q[3],~KEY[0]);
FF F4 (~KEY[1], in[4],Q[4],~KEY[0]);
FF F5 (~KEY[1], in[5],Q[5],~KEY[0]);
FF F6 (~KEY[1], in[6],Q[6],~KEY[0]);
FF F7 (~KEY[1], in[7],Q[7],~KEY[0]);*/
always@(posedge KEY[1] or posedge ~KEY[0]) begin
	if(~KEY[0]) Q<=8'b0;
	else Q <= in;
end

//always R = Q;
	
assign {co,S} = Q + in;

hex_ssd H0 (in[3:0], HEX2);
hex_ssd H1 (in[7:4], HEX3);
hex_ssd H2 (Q[3:0], HEX0);
hex_ssd H3 (Q[7:4], HEX1);
hex_ssd H4 (S[3:0], HEX4);
hex_ssd H5 (S[7:4], HEX5);
assign LEDR[0] = co;
endmodule
module D_latch (Clk,D,Q,Clr);
input D,Clk,Clr;
output reg Q;
always@(D,Clk,Clr)
if(Clk)
	Q = D;
		else
if(Clr)
Q = 0;
endmodule

module FF (Clk,D,Q,Clr);
input Clk,D,Clr;
output Q;
wire Qm;
D_latch D0 (~Clk,D,Qm,Clr);
D_latch D1 (Clk, Qm,Q,Clr);
endmodule

module hex_ssd(Bin,SSD);
	input [7:0] Bin;
	output reg [0:6] SSD;

	always@(Bin) begin
	case(Bin)
		0:SSD=7'b0000001; 
		1:SSD=7'b1001111; 
		2:SSD=7'b0010010; 
		3:SSD=7'b0000110; 
		4:SSD=7'b1001100; 
		5:SSD=7'b0100100; 
		6:SSD=7'b0100000; 
		7:SSD=7'b0001111; 
		8:SSD=7'b0000000; 
		9:SSD=7'b0001100; 
		10:SSD=7'b0001000; 
		11:SSD=7'b1100000; 
	   12:SSD=7'b0110001; 
		13:SSD=7'b1000010; 
		14:SSD=7'b0110000; 
		15:SSD=7'b0111000; 
	endcase
	end
endmodule
