`timescale 1ns/1ps

module sellersm(
    clk, led, an, seg, sw, btnC, btnU, btnL, btnR, btnD, btnRst//, startled, stateled, btnstat, tickled
);
    input clk, sw, btnC, btnU, btnL, btnR, btnD, btnRst;
    output [3:0] led;
    output [7:0] an;
    output [7:0] seg;
    // reg startled;
    // reg btnstat;

    wire [7:0] money;
    wire [7:0] mleft, mdisp;
    wire [7:0] helloan, hellosdp, digitan, digitsdp;
    // generate divided clock signals
    btnclkdiv bcd(clk, btnclk);
    sdpclkdiv scd(clk, sdpclk);
    tickclkdiv tcd(clk, tickclk);
    // button stablizer
    // btnstablizer a(btnclk, btnU, rmb10);
    // btnstablizer b(btnclk, btnC, rmb1);
    // btnstablizer c(btnclk, btnD, start);
    // btnstablizer d(btnclk, btnL, sel5);
    // btnstablizer e(btnclk, btnR, sel25);
    // btnstablizer f(btnclk, btnRst, cancel);
    assign rmb10 = btnU;
    assign rmb1 = btnC;
    assign start = btnD;
    assign sel5 = btnL;
    assign sel25 = btnR;
    assign cancel = btnRst;
    // assign  startled = ~start;
    // assign  btnstat = btnL;
    // money accumulator
    maccumulator ma(clk, acculock, accurst, rmb1, rmb10, money);
    // money subtractor
    msubtractor ms(money, subsig, mleft);
    // money display multiplexer
    multiplexer #(8) mmux(mdisp, money, mleft, submux);
    // hello displayer
    hellodisp hd(sdpclk, helloan, hellosdp);
    // money displayer
    moneydisp md(sdpclk, mdisp, digitan, digitsdp);
    // sdpsel and sdpdisp multiplexer
    // multiplexer #(8) sdpselmux(an, helloan, digitan, hellomux);
    multiplexer #(8) sdpdispmux(seg, hellosdp, mdisp, hellomux);
    // finally the controller
    sellerctrlsm controller(sw, clk, start, ~cancel, rmb10, rmb1, sel25, sel5, led[0], led[1], led[2], led[3], subsig, hellomux, submux, money, accurst, acculock);
endmodule // 