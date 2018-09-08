`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 08:29:13
// Design Name: 
// Module Name: 7sdpdirect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments
// 
//////////////////////////////////////////////////////////////////////////////////


module sdpdirect7(sw, ca, cb, cc, cd, ce, cf, cg, dp, an, led);
	input [15:0] sw;                          // 16λ��������
	output ca, cb, cc, cd, ce, cf, cg, dp;  // 7���������������͵�ƽ��Ч
	output [7:0] an;                          // 7��������Ƭѡ�źţ��͵�ƽ��Ч
	output [15:0] led;                        // 16λled��ʾ���ߵ�ƽ��Ч
	assign led = sw;
	assign {ca,cb,cc,cd,ce,cf,cg,dp} = ~sw[7:0];
	assign an = ~sw[15:8];
endmodule

