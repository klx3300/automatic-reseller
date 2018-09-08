`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 10:55:59
// Design Name: 
// Module Name: sdpdynamic7
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


module sdpdynamic7(
    clk,seg,an
    );
    input clk;
    output [7:0] seg;
    output [7:0] an;
    wire divsig;
    wire [2:0] cnt;
    wire [3:0] disp;
    clkdiv cdiv(clk,divsig);
    counter3 cntr(divsig,cnt);
    sdpselector7f sel(cnt,an);
    rom8x4 rom(cnt,disp);
    sdpdecoder7f dec(disp,seg);
endmodule
