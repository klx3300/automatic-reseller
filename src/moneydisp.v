`timescale 1ns / 1ps


module moneydisp(
    clk, moneyv, sdpsel, sdpdisp
);
    input clk;
    input [7:0] moneyv; // MAX 128, last digit for .5 precision
    output reg [7:0] sdpsel;
    output reg [7:0] sdpdisp;
    reg [2:0] curr_dig;
    reg [7:0] original;
    reg [7:0] tens;
    reg [7:0] ones;
    initial curr_dig = 0;
    always @(posedge clk) begin
        // do the decode work first
        curr_dig = curr_dig + 1;
        sdpsel = 8'b11111111;
        original[7] = 0;
        original[6:0] = moneyv[7:1];
        tens = original % 100;
        ones = tens % 10;
        sdpsel[curr_dig] = 0;
        // we have 4 digits total. so we need to divide up a bit..
        case(curr_dig)
            3: begin
                if (moneyv >= 200) begin
                    sdpdisp = 8'b11111001; // 1
                end
                else begin
                    sdpdisp = 8'b11000000; // 0
                end
            end
            2: begin
                if(tens >= 90) begin
                    sdpdisp = 8'b10010000;
                end
                else if(tens >= 80) begin
                    sdpdisp = 8'b10000000;
                end
                else if(tens >= 70) begin
                    sdpdisp = 8'b11111000;
                end
                else if(tens >= 60) begin
                    sdpdisp = 8'b10000010;
                end
                else if(tens >= 50) begin
                    sdpdisp = 8'b10010010;
                end
                else if(tens >= 40) begin
                    sdpdisp = 8'b10011001;
                end
                else if(tens >= 30) begin
                    sdpdisp = 8'b10110000;
                end
                else if(tens >= 20) begin
                    sdpdisp = 8'b10100100;
                end
                else if(tens >= 10) begin
                    sdpdisp = 8'b11111001;
                end
                else begin
                    sdpdisp = 8'b11000000;
                end
            end
            1: begin
                if(ones >= 9) begin
                    sdpdisp = 8'b00010000;
                end
                else if(ones >= 8) begin
                    sdpdisp = 8'b00000000;
                end
                else if(ones >= 7) begin
                    sdpdisp = 8'b01111000;
                end
                else if(ones >= 6) begin
                    sdpdisp = 8'b00000010;
                end
                else if(ones >= 5) begin
                    sdpdisp = 8'b00010010;
                end
                else if(ones >= 4) begin
                    sdpdisp = 8'b00011001;
                end
                else if(ones >= 3) begin
                    sdpdisp = 8'b00110000;
                end
                else if(ones >= 2) begin
                    sdpdisp = 8'b00100100;
                end
                else if(ones >= 1) begin
                    sdpdisp = 8'b01111001;
                end
                else begin
                    sdpdisp = 8'b01000000;
                end
            end
            0: begin
                if(moneyv[0]) begin
                    sdpdisp = 8'b10010010;
                end
                else begin
                    sdpdisp = 8'b11000000;
                end
            end
            4: sdpdisp = 8'b10101111;
            5: sdpdisp = 8'b10101111;
            6: sdpdisp = 8'b11100011;
            7: sdpdisp = 8'b10100111;
        endcase
    end
endmodule // 