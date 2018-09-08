`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 08:11:01
// Design Name: 
// Module Name: register
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


module register(
    in,cont,reset,clock,load
    );
    parameter WIDTH = 8;
    input [WIDTH-1:0] in;
    input reset,clock,load;
    output reg [WIDTH-1:0] cont;
    initial cont = 0;
    always @(posedge clock) begin
      if (reset) cont = 0;
      else if (clock & load) cont = in;
    end
endmodule
