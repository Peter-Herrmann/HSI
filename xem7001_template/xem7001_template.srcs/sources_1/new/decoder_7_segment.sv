///////////////////////////////////////////////////////////////////////////////////////////////////
//// Copyright (c) AsteraLabs Inc. All rights reserved.                                        ////
//// AsteraLabs Confidential Property                                                          ////
//// --------------------------------------------------                                        ////
//// Filename: decoder_7_segment.sv                                                            ////
//// Author  : Nathaniel Downes & Abhishek Krishnan                                            ////
//// Details : IP to decode an input 4 bit hex signal into the LED representation              ////
////           on a 7 segment display                                                          ////
///////////////////////////////////////////////////////////////////////////////////////////////////

module decoder_7_segment 
  (
    input  logic [3:0] in,
    output logic [6:0] out
  );
  
  // TODO: Assign each output segments {A, B, C, D, E, F, G}, 
  //       based on the binary number at the input
  assign out = 'b0; // Delete me

endmodule

