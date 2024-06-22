//////////////////////////////////////////////////////////////////////////////
//// Copyright (c) AsteraLabs Inc. All rights reserved.
//// AsteraLabs Confidential Property
//// --------------------------------------------------
//// Filename: breadboard_test.sv
//// Author  : Nathaniel Downes & Abhishek Krishnan
//// Details : File to connect keypad to 7 segment decoder. Displays values
////           of keypad ouput (hex, not decoded values) on 7 segment display
////           sequentially, shifting one display each cycle
//////////////////////////////////////////////////////////////////////////////

module breadboard_test (
    // General IO
    input  logic       clk,                  
    input  logic       rst,
    input logic btn_test,
    output logic [7:0] led_test,

    // Keypad I/O
    input  logic [3:0] RowIn,
    output logic [3:0] ColOut,

    // 7 Segment Display Signals
    output logic [6:0] led0,
    output logic       led0_dp,
    output logic [6:0] led1,
    output logic       led1_dp,
    output logic [6:0] led2,
    output logic       led2_dp,
    output logic [6:0] led3,
    output logic       led3_dp
);

    logic [3:0][3:0] KeyOut;
    logic [3:0] Keypad_output;
    logic KeyPressed;
    logic clk_div;
    logic cnt;

    // Keypad
    keypad_decoder U_keypad ( .clk(clk_div), .rst(rst), .RowIn(RowIn), .KeyOut(Keypad_output), .ColOut(ColOut),
    .KeyPressed(KeyPressed) );

    //7 Seg
    led_driver U_leddriver ( .in({KeyOut[0],KeyOut[1],KeyOut[2], KeyOut[3]}), .led0(led0), .led0_dp(led0_dp),
            .led1(led1), .led1_dp(led1_dp), .led2(led2), .led2_dp(led2_dp), .led3(led3), .led3_dp(led3_dp) );
            
    clock_divider U_clk_div (.i_clk(clk), .rst(rst),.o_clk(clk_div));

    assign led_test[7:0] = {RowIn, ColOut};

    always_ff @(posedge clk_div, negedge rst) begin
        if (rst==0 ) begin
            cnt <= '0;
        end else begin
        
        if (KeyPressed) begin
                KeyOut[0] <= Keypad_output;
        end
        
        for (int i=1; i < 4; i++) begin // Shift the KeyOuts
           KeyOut[i] <= KeyOut[i-1];
         end
             


          
    // Update 1;       
            
        end
    end

endmodule

