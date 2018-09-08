`timescale 1ns/1ps

module sellerctrlsm(
    rst, clk, start, cancel, rmb10, rmb1, sel25, sel5, runled, occupyled, drinkled,
    returnled, subsig, hellomux, submux, money, accurst, acculock
);
    input rst; // reset signal
    input clk; // clock signal
    input start; // start purchase
    input cancel; // cancel current operation
    input sel25; // select 2.5R
    input sel5; // select 5R
    input rmb10;
    input rmb1;
    input [7:0] money; // current money
    output reg runled; // running indicator
    output reg occupyled; // occupied indicator
    output reg drinkled; // giving drink indicator
    output reg returnled; // giving return indicator
    output reg subsig; // subtractor signal
    output reg hellomux; // banner selector
    output reg submux; // money selector
    output reg accurst;
    output reg acculock;
    reg [2:0] currstat, nxstat;
    reg [31:0] cnt;
    reg lastrmb1;
    initial lastrmb1 = 0;
    initial currstat = 0;
    initial nxstat = 0;
    initial cnt = 0;
    // state move
    always @(currstat, rmb10, rmb1, start, cancel, sel25, sel5, money) begin
        case(currstat)
            0: begin // STATE_INIT
                accurst = 1;
                runled = 1;
                occupyled = 0;
                drinkled = 0;
                returnled = 0;
                subsig = 0;
                hellomux = 0;
                submux = 0;
                acculock = 0;
                // only accept #START signal
                if(start) nxstat = 1;
                else nxstat = 0;
            end
            1: begin // STATE_BEGIN, insufficient for anything
                accurst = 0;
                runled = 1;
                occupyled = 1;
                drinkled = 0;
                returnled = 0;
                subsig = 0;
                hellomux = 1;
                submux = 0;
                acculock = 0;
                if(rmb1) nxstat = 2;
                else if(rmb10) nxstat = 4;
                else if(cancel) nxstat = 7;
                else nxstat = 1;
            end
            2: begin // STATE_CAN25
                accurst = 0;
                runled = 1;
                occupyled = 1;
                drinkled = 0;
                returnled = 0;
                subsig = 0;
                hellomux = 1;
                acculock = 0;
                submux = 0;
                if(money >= 6) nxstat = 3;
                else if(rmb10) nxstat = 3;
                else if(cancel) nxstat = 7;
                else nxstat = 2;
            end
            3: begin // STATE_CAN25_2
                accurst = 0;
                runled = 1;
                occupyled = 1;
                drinkled = 0;
                returnled = 0;
                subsig = 0;
                hellomux = 1;
                acculock = 0;
                submux = 0;
                if(sel25) nxstat = 5;
                else if(cancel) nxstat = 7;
                else nxstat = 3;
            end
            4: begin // STATE_CAN5
                accurst = 0;
                runled = 1;
                occupyled = 1;
                drinkled = 0;
                returnled = 0;
                subsig = 0;
                acculock = 0;
                hellomux = 1;
                submux = 0;
                if(sel25) nxstat = 5;
                else if(sel5) nxstat = 6;
                else if(cancel) nxstat = 7;
                else nxstat = 4;
            end
            5: begin // STATE_BUY25
                accurst = 0;
                runled = 1;
                occupyled = 1;
                drinkled = 1;
                returnled = 1;
                acculock = 1;
                subsig = 0;
                hellomux = 1;
                submux = 1;
                nxstat = 5;
            end
            6: begin // STATE_BUY5
                accurst = 0;
                runled = 1;
                occupyled = 1;
                drinkled = 1;
                returnled = 1;
                acculock = 1;
                subsig = 1;
                hellomux = 1;
                submux = 1;
                nxstat = 6;
            end
            7: begin // STATE_CANCEL
                accurst = 0;
                runled = 1;
                occupyled = 1;
                drinkled = 0;
                acculock = 1;
                returnled = 1;
                subsig = 0;
                hellomux = 1;
                submux = 0;
                nxstat = 7;
            end
        endcase
        lastrmb1 = rmb1;
    end
    always @(posedge clk) begin
        if (rst) currstat = 0;
        else begin
            if(currstat != 7 && nxstat == 7) cnt = 0;
            else if(currstat != 5 && nxstat == 5) cnt = 0;
            else if(currstat != 6 && nxstat == 6) cnt = 0;
            cnt = cnt + 1;
            currstat = nxstat;
            if(cnt >= 5) begin
                if(currstat == 5) currstat = 0;
                else if(currstat == 6) currstat = 0;
                else if(currstat == 7) currstat = 0;
            end
        end
    end

endmodule // 