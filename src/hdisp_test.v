`timescale 1ns / 1ps

module hdisp_test(
    clk, seg, an
);
    input clk;
    output [7:0] seg;
    output [7:0] an;
    sdpclkdiv scd(clk, sdpclk);
    hellodisp hd(sdpclk, an, seg);
endmodule