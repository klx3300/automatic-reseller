`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 08:23:20
// Design Name: 
// Module Name: romemory
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


module romemory(
addr,cont
    );
    parameter WIDTH = 8;
    input [3:0] addr;
    reg [3:0] memory [WIDTH-1:0];
    output [WIDTH-1:0] cont;
    initial $readmemh("linkedlist.txt",memory);
    assign cont = memory[addr];
endmodule
