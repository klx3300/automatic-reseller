`timescale 1ns / 1ps


module hellodisp(
    clk, sdpsel, sdpdisp
);
    input clk;
    output reg [7:0] sdpsel;
    output reg [7:0] sdpdisp;
    reg [2:0] curr_dig;
    initial curr_dig = 0;
    always @(posedge clk) begin
        // do the decode work first
        curr_dig = curr_dig + 1;
        if(curr_dig > 4) begin
            curr_dig = 0;
        end
        sdpsel = 8'b11111111;
        sdpsel[curr_dig] = 0;
        // we have 4 digits total. so we need to divide up a bit..
        case(curr_dig)
            0: sdpdisp = 8'b10100011;
            1: sdpdisp = 8'b11000111;
            2: sdpdisp = 8'b11000111;
            3: sdpdisp = 8'b10000110;
            4: sdpdisp = 8'b10001001;
        endcase
    end
endmodule // 