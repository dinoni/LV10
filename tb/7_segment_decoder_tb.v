`timescale 1ns/1ps
module seven_segment_decoder_tb;

    reg [1:0] selectInput;
    reg [3:0] isoValue;
    
  
    seven_segment_decoder decoder_instance(
        .selectInput(selectInput),
        .isoValue(isoValue),
        .seven_seg_1(seven_seg_1),
        .seven_seg_2(seven_seg_2),
        .seven_seg_3(seven_seg_3)
        );

    wire [7:0] seven_seg_1; 
    

    initial begin
        $dumpfile("sim\\dump.vcd"); $dumpvars;
        selectInput=2'b00;
        #1;
        isoValue=4'b0100;
        #10;
    
        $finish;

        end
endmodule