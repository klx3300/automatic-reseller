`timescale 1ns/1ps

module btnstablizer (
    clk, btnsig, stabtn
);
    input clk, btnsig;
    output reg stabtn;
    reg lastbtn;
    initial lastbtn = 0;
    always @(posedge clk) begin
        if(btnsig == lastbtn) stabtn = btnsig;
        lastbtn = btnsig;
    end

endmodule // 