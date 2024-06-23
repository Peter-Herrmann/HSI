///////////////////////////////////////////////////////////////////////////////////////////////////
//// Copyright (c) AsteraLabs Inc. All rights reserved.                                        ////
//// AsteraLabs Confidential Property                                                          ////
//// --------------------------------------------------                                        ////
//// Filename: breadboard_test.sv                                                              ////
//// Author  : Nathaniel Downes & Abhishek Krishnan                                            ////
//// Details : File to connect keypad to 7 segment decoder. Displays values                    ////
////           of keypad ouput (hex, not decoded values) on 7 segment display                  ////
////           sequentially, shifting one display each cycle                                   ////
///////////////////////////////////////////////////////////////////////////////////////////////////

module breadboard_test (
    // General IO
    input  logic       clk,                  
    input  logic       rst,
    input  logic       btn_test,
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

    logic [3:0]      keypad_index;       // Key position index, 1st row is 0-3 from left to right
    logic            key_is_pressed;     // High if a key is currently pressed

    logic [3:0]      keypad_number;      // Binary number if the key is a number key
    logic [1:0]      keypad_function;    // Function index (0-3) for functions A-D
    logic            keypad_is_number;   // High if key index is a number key
    logic            keypad_is_function; // High if key index is a function key
    logic            keypad_clear;       // High if key index is the clear key
    logic            keypad_equals;      // High if key index is the equals key

    logic [1:0]      alu_function;
    logic [3:0]      operand_A;
    logic [3:0]      operand_B;
    logic            alu_enable;

    logic [15:0]     calculator_result;

    logic            clk_div;

    // The 8 LEDs on the board can be used to help debug. Replace any signals here to display them.
    assign led_test[7:0] = ~{ rst, 
                              keypad_function[1:0], 
                              key_is_pressed, 
                              keypad_clear, 
                              keypad_equals, 
                              keypad_is_number, 
                              keypad_is_function };


    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                 Keypad Driver and Decoder                                 //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    // Keypad Driver: Reads the keypad raw values, outputing an index (0-15) and a single bit 
    //                high if a key was pressed.
    keypad_driver U_keypad_driver ( 
        // Clocks and Resets
        .i_clk          (clk_div), 
        .i_rst_n        (rst), 

        // Row and column drivers
        .i_row_bits     (RowIn), 
        .o_column_bits  (ColOut),

        // Outputs to decoder and Finite State Machine
        .o_key_index    (keypad_index), 
        .o_key_pressed  (key_is_pressed) 
    );


    // Keypad Decoder: reads the key index and decodes into signals used by the state machine
    keypad_decoder U_keypad_decoder (
        .i_key_index    (keypad_index), 

        .o_number       (keypad_number),
        .o_function     (keypad_function),
        .o_is_number    (keypad_is_number),
        .o_is_function  (keypad_is_function),
        .o_clear        (keypad_clear),
        .o_equals       (keypad_equals)
    );


    // Finite State Machine: reads the decoded keypad values and drives the ALU
    finite_state_machine U_finite_state_machine (
        // Clocks and Resets
        .i_clk          (clk_div),
        .i_rst          (rst),

        // Keypad inputs
        .i_keypressed   (key_is_pressed),
        .i_number       (keypad_number),
        .i_function     (keypad_function),
        .i_is_number    (keypad_is_number),
        .i_is_function  (keypad_is_function),
        .i_clear        (keypad_clear),
        .i_equals       (keypad_equals),

        // ALU control outputs
        .o_A            (operand_A),
        .o_B            (operand_B),
        .o_OpCode       (alu_function),
        .o_alu_en       (alu_enable)
    );


    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                 Arithmetic and Logic Unit                                 //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    // Arithmetic and Logic Unit (ALU) : takes the operands and operation and calculates the result
    alu U_alu(
        // Clocks and Resets
        .i_clk      (clk_div),
        .i_rst_n    (rst & ~(key_is_pressed && keypad_clear)),

        .i_A        (operand_A),
        .i_B        (operand_B),
        .i_aluEn    (alu_enable),
        .i_OpCode   (alu_function),

        .o_out      (calculator_result)
    );
    

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                       Display Driver                                      //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    // Split the 16-bit calculator result across the 4 seven segment display decoders
    driver_7_segment U_leddriver (
        .in         (calculator_result), 
        .led0       (led0), 
        .led0_dp    (led0_dp),
        .led1       (led1),
        .led1_dp    (led1_dp),
        .led2       (led2), 
        .led2_dp    (led2_dp), 
        .led3       (led3), 
        .led3_dp    (led3_dp) );
            

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                       Clock Divider                                       //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    clock_divider #(.DIVISOR(32'd781250)) U_clk_div (
        .i_clk      (clk), 
        .rst        (rst),
        .o_clk      (clk_div));

    assign led_test[7:0] = ~{rst, keypad_function, key_is_pressed, keypad_clear, keypad_equals, keypad_is_number, keypad_is_function};


endmodule
