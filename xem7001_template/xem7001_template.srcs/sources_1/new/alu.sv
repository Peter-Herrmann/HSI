module alu(
    input logic [3:0] i_A,
    input logic [3:0] i_B,
    input logic i_aluEn,
    input logic [2:0] i_OpCode,
    output logic [15 : 0] o_out
);

    always @(*) begin
        if (i_aluEn) begin
            case(i_OpCode) 
                3'b000: o_out  = {12'b0, $unsigned(i_A) + $unsigned(i_B)};
                3'b001: o_out  = {12'b0, $unsigned(i_A) - $unsigned(i_B)};
                3'b011: o_out  = {12'b0, $unsigned(i_A) * $unsigned(i_B)};
                3'b111: o_out  = {12'b0, $unsigned(i_B)};
                default: o_out = 16'd0;
            endcase
        end else begin
            o_out = 16'd0;
        end
    end
endmodule
