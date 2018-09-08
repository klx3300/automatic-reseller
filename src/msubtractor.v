`timescale 1ns/1ps

module msubtractor(
    moneyv, subsig, leftv
);
    input [7:0] moneyv;
    input subsig;
    output reg [7:0] leftv;
    always @(moneyv, subsig) begin
        if(subsig) leftv = moneyv - 10;
        else leftv = moneyv - 5;
    end
endmodule // 