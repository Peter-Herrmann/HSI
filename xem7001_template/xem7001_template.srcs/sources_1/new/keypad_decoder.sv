
module keypad_decoder(
        input  logic [3:0] i_key_index,        

        output logic [3:0] o_number,      // Binary number if the key is a number key
        output logic [1:0] o_function,    // Function index (0-3) for functions (A-D)
        output logic       o_is_number,   // High if key index is a number key
        output logic       o_is_function, // High if key index is a funciton key
        output logic       o_clear,       // High if key index is the clear key
        output logic       o_equals       // High if key index is the equals key
    );
    
    // TODO : Replace these assignments with digital logic give the outputs the correct behavior
    assign o_number      = 'b0;
    assign o_function    = 'b0;
    assign o_is_number   = 'b0;
    assign o_is_function = 'b0;
    assign o_clear       = 'b0;
    assign o_equals      = 'b0;
    
endmodule
