module counter(
    input logic i_clk,
    input logic i_rst,
    output logic [3:0] o_out
);
 
parameter IDLE = 3'b000;
parameter ONE = 3'b001;
parameter TWO = 3'b011;
parameter THREE = 3'b111;
parameter FOUR = 3'b110;
 
reg [2:0] state;
 
always @(posedge i_clk or negedge i_rst) begin
    if (i_rst==0) begin
        o_out <= 4'b0000;
        state <= IDLE;
    end else begin
        case(state)
            IDLE: begin
                o_out <= 4'b0000; //1111
                state <= ONE;
            end
            ONE: begin
                o_out <= 4'b1000;
                state <= TWO;
            end
            TWO: begin
                 o_out <= 4'b0100;
                 state <= THREE;
            end
            THREE: begin
                o_out <= 4'b0010;
                state <= FOUR;
            end
            FOUR: begin
                o_out <= 4'b0001;
                state <= ONE;
            end
            default: begin
                o_out <= 4'b0000;
                state <= IDLE;
            end
        endcase
    end
end
 
endmodule
