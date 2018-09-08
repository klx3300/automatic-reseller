`timescale 1ns / 1ps

module mdisp_test(
    clk, sw, seg, an
);
    input clk;
    input [7:0] sw;
    output [7:0] seg;
    output [7:0] an;
    sdpclkdiv scd(clk, sdpclk);
    moneydisp md(sdpclk, sw, an, seg);
endmodule