//////////////////////////////////////////////////////////////////////////////
//// Copyright (c) AsteraLabs Inc. All rights reserved.
//// AsteraLabs Confidential Property
//// --------------------------------------------------
//// Filename: decoder7seg.sv
//// Author  : Nathaniel Downes & Abhishek Krishnan
//// Details : IP to decode an input 4 bit hex signal into the LED representation
////           on a 7 segment display
//////////////////////////////////////////////////////////////////////////////

module decoder7seg 
  (
    input  logic [3:0] in,
    output logic [6:0] out
  );
  
  always_comb begin
    case (in) //G-A
      4'b0000: out = 7'b1000000; // 0 A-G 7'b0000001;
      4'b0001: out = 7'b1111001; // 1 7'b1001111
      4'b0010: out = 7'b0100100; // 2 7'b0010010;
      4'b0011: out = 7'b0110000; // 3 7'b0000110;
      4'b0100: out = 7'b0011001; // 4 1001100;
      4'b0101: out = 7'b0010010; // 5 7'b0100100; 
      4'b0110: out = 7'b0000010; // 6 7'b0100000; CHECME
      4'b0111: out = 7'b1111000; // 7 7'b0001111;
      4'b1000: out = 7'b0000000; // 8
      4'b1001: out = 7'b0011000; // 9 'b0001100;
      4'b1010: out = 7'b0001000; // a 'b0001000;
      4'b1011: out = 7'b0000011; // b 7'b1100000;
      4'b1100: out = 7'b1000110; // c b0110001;
      4'b1101: out = 7'b0100001; // d b1000010;
      4'b1110: out = 7'b0000110; // e 0110000
      default: out = 7'b0001110; // f 0111000;
    endcase
  end

endmodule

