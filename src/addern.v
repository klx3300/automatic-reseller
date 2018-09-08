`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 08:23:20
// Design Name: 
// Module Name: addern
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module addern(
a,b,sum,carry
    );
    parameter WIDTH = 8;
    input [WIDTH-1:0] a,b;
    output [WIDTH-1:0] sum;
    output carry;
    assign {carry,sum} = a+b;
endmodule
