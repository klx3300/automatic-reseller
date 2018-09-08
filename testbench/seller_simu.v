`timescale 1ns/1ps

module sellersimu(
);
    reg [31:0] counter;
    reg cp;
    reg rst;
    reg rmb1;
    reg rmb10;
    reg start;
    reg sel5;
    reg sel25;
    reg cancel;
    wire [3:0] led;
    wire [7:0] sdpsel;
    wire [7:0] sdpdisp;

    initial begin
        counter = 0;
        cp = 0;
        rst = 0;
        rmb1 = 0;
        rmb10 = 0;
        start = 0;
        sel5 = 0;
        sel25 = 0;
        cancel = 0;
        // simulate buy 2.5
        #4 start = 1;
        #4 start = 0;
        #4 rmb1 = 1;
        #4 rmb1 = 0;
        #4 rmb1 = 1;
        #4 rmb1 = 0;
        #4 rmb1 = 1;
        #4 rmb1 = 0;
        #4 sel25 = 1;
        #4 sel25 = 0;
        // simulate buy 5
        #20 start = 1;
        #4 start = 0;
        #4 rmb10 = 1;
        #4 rmb10 = 0;
        #4 sel5 = 1;
        #4 sel5 = 0;
        // simulate cancel
        #20 start = 1;
        #4 start = 0;
        #4 rmb1 = 1;
        #4 rmb1 = 0;
        #4 rmb10 = 1;
        #4 rmb10 = 0;
        #4 cancel = 1;
        #4 cancel = 0;
        #20 $finish;
    end

    initial begin
        for(counter = 0 ; counter < 999; counter = counter + 1) begin
            #2 cp = ~cp;
        end
    end
    sellersm s(cp, led, sdpsel, sdpdisp, rst, rmb1, rmb10, sel5, sel25, start, ~cancel);

endmodule // 