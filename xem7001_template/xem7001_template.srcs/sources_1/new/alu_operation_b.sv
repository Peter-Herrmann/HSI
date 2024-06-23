
module alu_operation_b(
        input  logic [3:0]  i_A,
        input  logic [3:0]  i_B,
        output logic [15:0] o_result
    );
    
    assign o_result = {12'b0, i_A} - {12'b0, i_B};
        
endmodule
