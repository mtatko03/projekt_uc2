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
 
  vga_if mouse_out();
  vga_if vga_map();
  vga_if vga_start();
  vga_if vga_player1();
  vga_if vga_player2();
 
  logic [11:0] xpos;
  logic [11:0] ypos;
 
  logic [11:0] xpos_buf;
  logic [11:0] ypos_buf;

  logic clk_div;
  import game_pkg::*;

  tile map [MAP_WIDTH][MAP_HEIGHT];
  directions direction;
 
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
 

 draw_start u_draw_start (
    .clk(clk65MHz),
    .rst,
    .vga_in (vga_timing),
    .vga_out (vga_start)
 );

 draw_player1_win u_draw_player1_win (
    .clk(clk65MHz),
    .rst,
    .vga_in (vga_timing),
    .vga_out (vga_player1)
);


draw_player2_win u_draw_player2_win (
    .clk(clk65MHz),
    .rst,
    .vga_in (vga_timing),
    .vga_out (vga_player2)
);

 draw_map u_draw_ (
     .clk(clk65MHz),
     .rst,
     .map,
     .vga_in(vga_timing),
     .vga_out(vga_map)
 );

 direction_control u_direction_control(
    .clk(clk_div),
    .rst,
    .direction(direction),
    .mouse_right(mouse_right),
    .mouse_left(mouse_left)
 );

 control u_control (
    .clk(clk_div),
    .rst,
    .direction(direction),
    .map(map)
 );

 clk_div u_clk_div(
    .clk_in(clk65MHz),
    .rst,
    .clk_div(clk_div)
 );
 
 MouseCtl u_MouseCtl(
     .clk(clk975MHz),
     .rst,
     .ps2_data,
     .ps2_clk,
     .xpos(xpos_buf),
     .ypos(ypos_buf),
 
     .zpos(),
     .left(mouse_left),
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
     .vga_in(vga_map),
     .vga_out(mouse_out),
     .xpos,
     .ypos
 );
 
 endmodule
 
 
 
 
 
 