`timescale 1ns / 1ps

module sdpctrl7(
  sw,an,seg,led
);
    input [15:0]sw;
    output [7:0]an;
    output [7:0]seg;
    output [15:0]led;
    
    assign led = sw;
    sdpdecoder7e dec(sw,seg);
    sdpselector7e sel(sw,an);
endmodule // sdpctrl7sw,an,seg,led