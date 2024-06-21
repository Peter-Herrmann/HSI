//////////////////////////////////////////////////////////////////////////////
//// Copyright (c) AsteraLabs Inc. All rights reserved.
//// AsteraLabs Confidential Property
//// --------------------------------------------------
//// Filename: led_driver.sv
//// Author  : Nathaniel Downes & Abhishek Krishnan
//// Details : IP to drive 4 7 segment displays from a 16 bit input. Developed for the
////           Summer 2024 High School Intern Digital Design Project (Calculator)
//////////////////////////////////////////////////////////////////////////////

module led_driver
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

    decoder7seg U_7seg0 (.in(in[15:12]), .out(led0));
    decoder7seg U_7seg1 (.in(in[11:8]), .out(led1));
    decoder7seg U_7seg2 (.in(in[7:4]), .out(led2));
    decoder7seg U_7seg3 (.in(in[3:0]), .out(led3));

    assign led0_dp = 1'b1; //active low
    assign led1_dp = 1'b1;
    assign led2_dp = 1'b1;
    assign led3_dp = 1'b1;

endmodule
