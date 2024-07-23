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
     input  logic clk65MHz,
     input  logic clk975MHz,
     input  logic rst,
     inout  logic ps2_clk,
     inout  logic ps2_data,
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
 
  vga_if mouse_out();
 
  logic [11:0] xpos;
  logic [11:0] ypos;
 
  logic [11:0] xpos_square;
  logic [11:0] ypos_square;
  logic [11:0] width_square;
 
  logic [11:0] xpos_buf;
  logic [11:0] ypos_buf;
 
 /**
  * Signals assignments
  */
 
 assign vs = mouse_out.vsync;
 assign hs = mouse_out.hsync;
 assign {r,g,b} = mouse_out.rgb;
 
 
 /**
  * Submodules instances
  */
 
 vga_timing u_vga_timing (
     .clk(clk65MHz),
     .rst,
     .vga_out (vga_timing)
 );
 
 draw_bg u_draw_bg (
     .clk(clk65MHz),
     .rst,
     
     .vga_inbg (vga_timing),
     .vga_outbg (vga_bg)
 );
 
 draw_square u_draw_square (
     .clk(clk65MHz),
     .rst,
 
     .vga_in(vga_bg),
     .vga_out(vga_square),
 
     .xpos_square(xpos_square),
     .ypos_square(ypos_square),
     .width_square(width_square)
 );
 
 draw_square_ctl u_draw_square_ctl (
     .clk(clk65MHz),
     .rst,
     .mouse_right(mouse_right),
     .vga_in(vga_timing),
     .xpos_square(xpos_square),
     .ypos_square(ypos_square),
     .width_square(width_square)
 );
 
 MouseCtl u_MouseCtl(
     .clk(clk975MHz),
     .rst,
     .ps2_data,
     .ps2_clk,
     .xpos(xpos_buf),
     .ypos(ypos_buf),
 
     .zpos(),
     .left(),
     .middle(),
     .right(mouse_right),
     .new_event(),
     .value('0),
     .setx('0),
     .sety('0),
     .setmax_x('0),
     .setmax_y('0)
 );
 
 always_ff @(posedge clk65MHz) begin
     xpos <= xpos_buf;
     ypos <= ypos_buf;
 end
 
 draw_mouse u_draw_mouse(
     .clk(clk65MHz),
     .rst,
     .vga_in(vga_square),
     .vga_out(mouse_out),
     .xpos,
     .ypos
 );
 
 endmodule
 
 
 
 
 
 