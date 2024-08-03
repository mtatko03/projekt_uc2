/*
 * implements a clock divider that reduces the frequency of the input clock
 * 
 */
 
`timescale 1ns/1ps

module clk_div(
    input  logic clk_in,
    input  logic rst,
    output logic clk_div
);

localparam clk_loop = 16_250_000;

logic           clk_div_nxt;
logic [23:0]    count, count_nxt;

always_ff @(posedge clk_in) begin : clk_div_blk
    if(rst) begin
        clk_div <= '1;
        count   <= '0;
    end else begin
        clk_div <= clk_div_nxt;
        count   <= count_nxt;
    end
end


always_comb begin : clk_div_nxt_blk
    if(count >= clk_loop) begin
        clk_div_nxt = ~clk_div;
        count_nxt = 0;

    end else begin
        clk_div_nxt = clk_div;
        count_nxt = count + 1;
    end
end

endmodule