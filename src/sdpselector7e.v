`timescale 1ns / 1ps

module sdpselector7e(
  sw, an
);
    input [15:0] sw;
    output reg [7:0] an;
    
    always @(sw,an) begin
        an = 8'b11111111;
        an[sw[15:13]] = 0;
    end

endmodule // 