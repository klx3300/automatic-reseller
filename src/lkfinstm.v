`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 09:33:07
// Design Name: 
// Module Name: lkfinstm
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


module lkfinstm(
    clock,reset,sum_start,nzmark,
    sum_load,next_load,sum_sel,next_sel,mem_sel,done,nxstat
    );
    input clock,reset,sum_start,nzmark;
    output reg sum_load,next_load,sum_sel,next_sel,mem_sel,done;
    output [1:0] nxstat;
    reg [1:0] currstat,nextstat;
    assign nxstat = currstat;
    // GenOutput
    always @(currstat, sum_start, nzmark) begin
      case (currstat)
        0: begin
          sum_load = 0;
          next_load = 0;
          sum_sel = 0;
          next_sel = 0;
          mem_sel = 0;
          done = 0;
          if(sum_start == 1) nextstat = 1;
          else nextstat = 0;
        end
        1: begin
          sum_load = 1;
          sum_sel = 1;
          next_load = 0;
          next_sel = 1;
          mem_sel = 1;
          done = 0;
          nextstat = 2;
        end
        2: begin
          sum_load = 0;
          sum_sel = 1;
          next_load = 1;
          next_sel = 1;
          mem_sel = 0;
          done = 0;
          if(nzmark == 0) nextstat = 1;
          else nextstat = 3;
        end
        3: begin
          sum_load = 0;
          sum_sel = 0;
          next_sel = 0;
          next_load = 0;
          mem_sel = 0;
          done = 1;
          if(sum_start == 0) nextstat = 0;
          else nextstat = 3;
        end
      endcase
    end

    // StateCnvt
    always @(posedge clock) begin
        if (reset) begin
          currstat = 0;
        end
        else begin
          currstat = nextstat;
        end
    end
endmodule
