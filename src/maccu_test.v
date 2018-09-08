`timescale 1ns / 1ps

module maccu_test(
    clk, btnC, btnU, btnD, seg, an
);
    input clk, btnC, btnU, btnD;
    output [7:0] seg;
    output [7:0] an;
    wire [7:0] moneyv;
    btnclkdiv bd(clk, btnclk);
    btnstablizer ustab(btnclk, btnU, tsig);
    btnstablizer cstab(btnclk, btnC, osig);
    btnstablizer dstab(btnclk, btnD, rsig);
    maccumulator ma(clk, rsig, osig, tsig, moneyv);
    sdpclkdiv scd(clk, sdpclk);
    moneydisp md(sdpclk, moneyv, an, seg);
endmodule