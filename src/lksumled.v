`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 10:01:04
// Design Name: 
// Module Name: lksumled
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


module lksumled(
clk,sw,led
    );
    input clk;
    input [1:0] sw;
    output [15:0] led;
    wire [31:0] sumresult;
    wire divsig;
    assign led[12:0] = sumresult[12:0];
    wire iscomp;
    wire [1:0] statdisp; 
    assign led[15] = iscomp;
    assign led[14:13] = statdisp;
    // go through a timer to ..
    clkdiv cdiv(clk,divclk);
    // assign divclk = clk;
    lkfinstm state_machine(divclk,sw[1],sw[0],nzmark,sum_load,next_load,sum_sel,next_sel,mem_sel,iscomp,statdisp);
    lkdatapath proced(sw[1],divclk,sum_sel,sum_load,next_sel,next_load,mem_sel,nzmark,sumresult);
endmodule
