module clock_divider(
    input logic i_clk,
    input logic rst,
    output logic o_clk
);
 
reg [31 : 0] counter = 32'd0;
parameter DIVISOR = 32'd15625000;
 
always @(posedge i_clk, negedge rst) begin
    if(rst == 1'b0) begin
        counter <= 32'd0;
        o_clk <= '0;
    end else begin
        counter <= counter + 32'd1;
        if (counter >= (DIVISOR - 1)) begin
            counter <= 32'd0;
            o_clk <= !o_clk;
            //o_clk <= (counter < (DIVISOR / 2)) ? 1'b1 : 1'b0;
        end
    end 
end
 
endmodule