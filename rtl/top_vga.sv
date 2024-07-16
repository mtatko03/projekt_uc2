/**
 * San Jose State University
 * EE178 Lab #4
 * Author: prof. Eric Crabilla
 *
 * Modified by:
 * 2023  AGH University of Science and Technology
 * MTM UEC2
 * Agnieszka Wroblewska, Magdalena Tatko
 *
 * Description:
 * The project top module.
 */

`timescale 1 ns / 1 ps

module top_vga (
    input  logic clk,
    input  logic rst,
    output logic vs,
    output logic hs,
    output logic [3:0] r,
    output logic [3:0] g,
    output logic [3:0] b
);


/**
 * Local variables and signals
 */

// VGA signals from timing
 vga_if vga_timing();

// VGA signals from background
 vga_if vga_bg();

// VGA signals from square
 vga_if vga_square();

/**
 * Signals assignments
 */

assign vs = vga_square.vsync;
assign hs = vga_square.hsync;
assign {r,g,b} = vga_square.rgb;


/**
 * Submodules instances
 */

vga_timing u_vga_timing (
    .clk,
    .rst,
    .vga_out (vga_timing)
);

draw_bg u_draw_bg (
    .clk,
    .rst,
    
    .vga_inbg (vga_timing),
    .vga_outbg (vga_bg)
);

draw_square u_draw_square (
    .clk,
    .rst,

    .vga_in(vga_bg),
    .vga_out(vga_square)
);

endmodule
