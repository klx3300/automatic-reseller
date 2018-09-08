`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 10:52:10
// Design Name: 
// Module Name: sdpselector7f
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

module sdpselector7f(
  sw, an
);
    input [2:0] sw;
    output reg [7:0] an;
    
    always @(sw,an) begin
        an = 8'b11111111;
        an[sw] = 0;
    end

endmodule // 