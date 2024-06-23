
module keypad_decoder(
        input  logic [3:0] i_key_index,        

        output logic [3:0] o_number,      // Binary number if the key is a number key
        output logic [1:0] o_function,    // Function index (0-3) for functions (A-D)
        output logic       o_is_number,   // High if key index is a number key
        output logic       o_is_function, // High if key index is a funciton key
        output logic       o_clear,       // High if key index is the clear key
        output logic       o_equals       // High if key index is the equals key
    );
    

    always_comb begin
        case(i_key_index)
            4'd0:    o_number = 4'd1;
            4'd1:    o_number = 4'd2;
            4'd2:    o_number = 4'd3;
            4'd4:    o_number = 4'd4;
            4'd5:    o_number = 4'd5;
            4'd6:    o_number = 4'd6;
            4'd8:    o_number = 4'd7;
            4'd9:    o_number = 4'd8;
            4'd10:   o_number = 4'd9;
            4'd13:   o_number = 4'd0;
            default: o_number = 4'd15;
        endcase
    end   


    always_comb begin
        case (i_key_index)
            4'd3   : o_function = 2'd0;
            4'd7   : o_function = 2'd1;
            4'd11  : o_function = 2'd2;
            4'd15  : o_function = 2'd3;
            default: o_function = 2'd0;
        endcase
    end


    assign o_is_number   = (o_number != 4'd15);

    assign o_is_function = (i_key_index == 4'd3)  || (i_key_index == 4'd7) ||
                           (i_key_index == 4'd11) || (i_key_index == 4'd15);

    assign o_clear       = (i_key_index == 4'd12);
    assign o_equals      = (i_key_index == 4'd14);
    

    
endmodule
