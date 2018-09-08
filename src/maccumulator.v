`timescale 1ns/1ps

module maccumulator (
    clk, lock, rst, onesig, tensig, moneyv
);
    input clk;
    input rst;
    input onesig;
    input tensig;
    input lock;
    output reg [7:0] moneyv;
    initial moneyv = 0;
    reg lastonesig, lasttensig;
    initial lastonesig = 0;
    initial lasttensig = 0;
    always @(posedge clk) begin
        if(rst) moneyv <= 0;
        else if(onesig & ~lastonesig & ~tensig & ~rst & ~lock) moneyv <= moneyv + 2;
        else if(tensig & ~lasttensig & ~onesig & ~rst & ~lock) moneyv <= moneyv + 20;
        lastonesig = onesig;
        lasttensig = tensig;
    end
endmodule // 