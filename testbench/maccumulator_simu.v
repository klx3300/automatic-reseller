`timescale 1ns/1ps

module maccumulator_simu(
);
    reg [31:0] counter;
    reg rst;
    reg lock;
    reg onesig;
    reg tensig;
    reg cp;
    wire [7:0] moneyv;
    initial begin
        cp = 0;
        rst = 0;
        onesig = 0;
        tensig = 0;
        lock = 0;
        #4 onesig = 1;
        #4 onesig = 0;
        #4 tensig = 1;
        #4 tensig = 0;
        #4 rst = 1;
        #4 rst = 0;
        #4 tensig = 1;
        #4 tensig = 0;
        #4 tensig = 1;
        #4 tensig = 0;
        #4 rst = 1;
        #4 rst = 0;
        #4 onesig = 1;
        #4 onesig = 0;
        #4 lock = 1;
        #4 onesig = 1;
        #4 onesig = 0;
        #4 $finish;
    end
    initial begin
        for(counter = 0 ; counter < 999; counter = counter + 1) begin
            #2 cp = ~cp;
        end
    end
    maccumulator ma(cp, lock, rst, onesig, tensig, moneyv);

endmodule // 