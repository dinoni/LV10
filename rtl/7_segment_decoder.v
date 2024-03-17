module seven_segment_decoder(
    input [3:0] isoValue,
    input clk,
    input [3:0] shutterSpeedValue,
    input [3:0] focalLenghtValue,
    input [2:0] brightnessIndicatorValue,
    input [1:0] selectInput,
    output reg [7:0] seven_seg_1,
    output reg [7:0] seven_seg_2,
    output reg [7:0] seven_seg_3,
    output reg [7:0] seven_seg_4
);

always @(posedge clk) begin
    
    case (selectInput)
        2'b00: begin {seven_seg_4,seven_seg_3,seven_seg_2,seven_seg_1}=decodeISO(isoValue); end
        2'b01: begin {seven_seg_4,seven_seg_3,seven_seg_2,seven_seg_1}=decodeshutter(shutterSpeedValue); end
        2'b10: begin {seven_seg_4,seven_seg_3,seven_seg_2,seven_seg_1}=decodefocal(focalLenghtValue); end
        2'b11: begin {seven_seg_4,seven_seg_3,seven_seg_2,seven_seg_1}=decodeindicator(brightnessIndicatorValue); end
        default: 
        begin
       {seven_seg_1,seven_seg_2,seven_seg_3,seven_seg_4}=8'b11111111;
        end
    endcase
end

// ISO values decoding
function [7:0] decodeISO; 
    input[3:0] value;
    begin
    case (value)
        4'b0000: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b10000010; end //6
        4'b0001: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111001; seven_seg_1=8'b10100100; end //12
        4'b0010: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b10100100; seven_seg_1=8'b10010010; end //25
        4'b0011: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b10010010; seven_seg_1=8'b11000000; end //50
        4'b0100: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111001; seven_seg_2=8'b11000000; seven_seg_1=8'b11000000; end //100
        4'b0101: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111001; seven_seg_2=8'b10100100; seven_seg_1=8'b10010010; end //125
        4'b0110: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111001; seven_seg_2=8'b10000010; seven_seg_1=8'b11000000; end //160
        4'b0111: begin seven_seg_4=8'b11111111; seven_seg_3=8'b10100100; seven_seg_2=8'b11000000; seven_seg_1=8'b11000000; end //200
        4'b1000: begin seven_seg_4=8'b11111111; seven_seg_3=8'b10110000; seven_seg_2=8'b10100100; seven_seg_1=8'b11000000; end //320
        4'b1001: begin seven_seg_4=8'b11111111; seven_seg_3=8'b10011001; seven_seg_2=8'b11000000; seven_seg_1=8'b11000000; end //400
        4'b1010: begin seven_seg_4=8'b11111111; seven_seg_3=8'b10000000; seven_seg_2=8'b11000000; seven_seg_1=8'b11000000; end //800
        4'b1011: begin seven_seg_4=8'b11111001; seven_seg_3=8'b10000010; seven_seg_2=8'b11000000; seven_seg_1=8'b11000000; end //1600
        4'b1100: begin seven_seg_4=8'b10110000; seven_seg_3=8'b10100100; seven_seg_2=8'b11000000; seven_seg_1=8'b11000000; end //3200
        4'b1101: begin seven_seg_4=8'b10000010; seven_seg_3=8'b10011001; seven_seg_2=8'b11000000; seven_seg_1=8'b11000000; end //6400
        4'b1110: begin seven_seg_4=8'b11111001; seven_seg_3=8'b10100100; seven_seg_2=8'b10000000; seven_seg_1=8'b01000000; end //1280.

        default: decodeISO=8'b11111111;
    endcase
    end
    
endfunction
function [7:0] decodeshutter;

  input [3:0] value;
  begin 
    case (value)
        4'b0000: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b10110000; seven_seg_1=8'b11000000; end //30
        4'b0001: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111001; seven_seg_1=8'b10010010; end //15
        4'b0010: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b10000000; end //8
        4'b0011: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b10011001; end //4
        4'b0100: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b10100100; end //2
        4'b0101: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b11111001; end //1
        4'b0110: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b01111111; seven_seg_1=8'b10100100; end // 1/2 (.2)
        4'b0111: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b01111111; seven_seg_1=8'b10011001; end // 1/4 (.4)
        4'b1000: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b01111111; seven_seg_1=8'b10000000; end // 1/8 (.8)
        4'b1001: begin seven_seg_4=8'b11111111; seven_seg_3=8'b01111111; seven_seg_2=8'b11111001; seven_seg_1=8'b10010010; end // 1/15 (.15)
        4'b1010: begin seven_seg_4=8'b11111111; seven_seg_3=8'b01111111; seven_seg_2=8'b10110000; seven_seg_1=8'b11000000; end // 1/30 (.30)
        4'b1011: begin seven_seg_4=8'b11111111; seven_seg_3=8'b01111111; seven_seg_2=8'b10000010; seven_seg_1=8'b11000000; end // 1/60 (.60)
        4'b1100: begin seven_seg_4=8'b01111111; seven_seg_3=8'b11111001; seven_seg_2=8'b10100100; seven_seg_1=8'b10010010; end // 1/125 (.125)
        4'b1101: begin seven_seg_4=8'b01111111; seven_seg_3=8'b10100100; seven_seg_2=8'b10010010; seven_seg_1=8'b11000000; end // 1/250 (.250)
        4'b1110: begin seven_seg_4=8'b01111111; seven_seg_3=8'b10010010; seven_seg_2=8'b11000000; seven_seg_1=8'b11000000; end // 1/500 (.500)
        4'b1111: begin seven_seg_4=8'b11111001; seven_seg_3=8'b11000000; seven_seg_2=8'b11000000; seven_seg_1=8'b01000000; end // 1/1000(1000.)
        default: decodeshutter=8'b11111111;
    endcase
  end
    
endfunction

function [7:0] decodefocal;
   input[3:0] value;
   begin 
    case (value)

        4'b0000: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b01111001; seven_seg_1=8'b10100100; end // 1,2
        4'b0001: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b01111001; seven_seg_1=8'b10011001; end // 1,4
        4'b0010: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b01111001; seven_seg_1=8'b10000000; end // 1,8
        4'b0011: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b00100100; seven_seg_1=8'b11000000; end //2,0
        4'b0100: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b00100100; seven_seg_1=8'b10000000; end //2,8
        4'b0101: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b00110000; seven_seg_1=8'b10010010; end //3,5
        4'b0110: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b00011001; seven_seg_1=8'b11000000; end // 4,0
        4'b0111: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b00010010; seven_seg_1=8'b10000010; end // 5,6
        4'b1000: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b00000000; seven_seg_1=8'b11000000; end // 8,0
        4'b1001: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111001; seven_seg_1=8'b11111001; end // 11,0
        4'b1010: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111001; seven_seg_1=8'b10000010; end // 16,0
        4'b1011: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b10100100; seven_seg_1=8'b10100100; end // 22,0
      
        default: decodefocal =8'b11111111;
    endcase
   end
    
endfunction

function [7:0] decodeindicator;
   input [2:0] value;
   begin
    case (value)
    
        3'b000: begin seven_seg_4=8'b10100100; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b11111111; end //-2 stop
        3'b001: begin seven_seg_4=8'b11111001; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b11111111; end //-1 stop
        3'b010: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b11000000; end // 0 stop
        3'b011: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b11111001; end //+1 stop
        3'b100: begin seven_seg_4=8'b11111111; seven_seg_3=8'b11111111; seven_seg_2=8'b11111111; seven_seg_1=8'b10100100; end //+2 stop
       
        default: decodeindicator =8'b11111111;
    endcase
   end
    
endfunction

endmodule