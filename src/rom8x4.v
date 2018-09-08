`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 10:45:34
// Design Name: 
// Module Name: rom8x4
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


module rom8x4(
    addr,data
    );
    input [2:0] addr;
    output [3:0] data;

    reg [3:0] memory [7:0];
    initial begin
      memory[0] = 4'b0000;
      memory[1] = 4'b0010;
      memory[2] = 4'b0100;
      memory[3] = 4'b0110;
      memory[4] = 4'b1000;
      memory[5] = 4'b1010;
      memory[6] = 4'b1100;
      memory[7] = 4'b1110;
    end
    assign data = memory[addr];
endmodule
