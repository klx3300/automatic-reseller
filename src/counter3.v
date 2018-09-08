`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 10:41:25
// Design Name: 
// Module Name: counter3
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


module counter3(
    clk,out
    );
    input clk;
    output reg [2:0] out;
    initial out = 0;
    always @(posedge clk) begin
      out = out + 1;
    end
endmodule
