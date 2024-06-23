///////////////////////////////////////////////////////////////////////////////////////////////////
//// Copyright (c) AsteraLabs Inc. All rights reserved.                                        ////
//// AsteraLabs Confidential Property                                                          ////
//// --------------------------------------------------                                        ////
//// Filename: driver_7_segment.sv                                                             ////
//// Author  : Nathaniel Downes & Abhishek Krishnan                                            ////
//// Details : IP to drive 4 7 segment displays from a 16 bit input. Developed for the         ////
////           Summer 2024 High School Intern Digital Design Project (Calculator)              ////
///////////////////////////////////////////////////////////////////////////////////////////////////

module driver_7_segment
    (
    input  logic [15:0] in,

    output logic [6:0] led0,
    output logic       led0_dp,
    output logic [6:0] led1,
    output logic       led1_dp,
    output logic [6:0] led2,
    output logic       led2_dp,
    output logic [6:0] led3,
    output logic       led3_dp
    );

    // Temporary wires to hold the inverted, reverse-ordered outputs from the modules
    logic [6:0] led0_n, led1_n, led2_n, led3_n;

    // Divide up input bits across 4 7-segment displays, each display getting 4 bits
    decoder_7_segment U_7seg0 (.in(in[15:12]), .out(led0_n));
    decoder_7_segment U_7seg1 (.in(in[11:8]),  .out(led1_n));
    decoder_7_segment U_7seg2 (.in(in[7:4]),   .out(led2_n));
    decoder_7_segment U_7seg3 (.in(in[3:0]),   .out(led3_n));

    // Reverse order of segements and invert because segments are active-low cathodes
    assign led0 = ~{led0_n[0], led0_n[1], led0_n[2], led0_n[3], led0_n[4], led0_n[5], led0_n[6]};
    assign led0_dp = 1'b1;
    assign led1 = ~{led1_n[0], led1_n[1], led1_n[2], led1_n[3], led1_n[4], led1_n[5], led1_n[6]};
    assign led1_dp = 1'b1;
    assign led2 = ~{led2_n[0], led2_n[1], led2_n[2], led2_n[3], led2_n[4], led2_n[5], led2_n[6]};
    assign led2_dp = 1'b1;
    assign led3 = ~{led3_n[0], led3_n[1], led3_n[2], led3_n[3], led3_n[4], led3_n[5], led3_n[6]};
    assign led3_dp = 1'b1;

endmodule
