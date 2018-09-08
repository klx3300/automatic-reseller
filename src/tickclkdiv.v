`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 10:29:32
// Design Name: 
// Module Name: clkdiv
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


module tickclkdiv(
    clk,divclk
    );
    input clk;
    output reg divclk;
    parameter interval = 1_000_000;
    reg [31:0] cnt;
    initial cnt = 0;
    initial divclk = 0;
    always @(posedge clk) begin
      cnt = cnt + 1;
      if (cnt == interval/2 - 1 ) begin
        divclk = ~divclk;
        cnt = 0;
      end
    end
endmodule
