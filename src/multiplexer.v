`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 08:11:01
// Design Name: 
// Module Name: multiplexer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplexer(
    result, srca, srcb, selector
    );
    parameter WIDTH = 8;
    input [WIDTH-1:0] srca,srcb;
    input selector;
    output reg [WIDTH-1:0] result;
    always @(selector or srca or srcb) begin
        if(selector)
            result = srcb;
        else
            result = srca;
    end
endmodule
