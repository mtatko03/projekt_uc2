/*
 * This module draws the appropriate game screen (start, gameplay, or win) based on the game state.
 */

 `timescale 1ns/1ps

 import game_pkg::*;
 import vga_pkg::*;
 
 module draw_main(
     input logic        clk,
     input logic        rst,
     input tile         map [MAP_WIDTH][MAP_HEIGHT],
     input game_mode    mode,
 
     vga_if.in vga_in,
     vga_if.out vga_out
 );
 
 logic [11:0] rgb_nxt;
 
 vga_if vga_nxt();
 vga_if start(), game(), player1(), player2();
 
 
 
 always_ff@(posedge clk)begin
     if(rst)begin
         vga_out.vcount   <= '0;
         vga_out.vsync    <= '0;
         vga_out.vblnk    <= '0;
         vga_out.hcount   <= '0;
         vga_out.hsync    <= '0;
         vga_out.hblnk    <= '0;
         vga_out.rgb      <= '0;
     end 
     else begin
         vga_out.vcount   <= vga_nxt.vcount;
         vga_out.vsync    <= vga_nxt.vsync;
         vga_out.vblnk    <= vga_nxt.vblnk;
         vga_out.hcount   <= vga_nxt.hcount;
         vga_out.hsync    <= vga_nxt.hsync;
         vga_out.hblnk    <= vga_nxt.hblnk;
         vga_out.rgb      <= rgb_nxt;
     end
 end
     
 
 always_comb begin
     case(mode)
 
         START:begin
             vga_nxt.vcount   = start.vcount;
             vga_nxt.vsync    = start.vsync;
             vga_nxt.vblnk    = start.vblnk;
             vga_nxt.hcount   = start.hcount;
             vga_nxt.hsync    = start.hsync;
             vga_nxt.hblnk    = start.hblnk;
             rgb_nxt          = start.rgb;
         end
 
         GAME:begin
             vga_nxt.vcount   = game.vcount;
             vga_nxt.vsync    = game.vsync;
             vga_nxt.vblnk    = game.vblnk;
             vga_nxt.hcount   = game.hcount;
             vga_nxt.hsync    = game.hsync;
             vga_nxt.hblnk    = game.hblnk;
             rgb_nxt          = game.rgb;
         end
 
         PLAYER1_WIN:begin
             vga_nxt.vcount   = player1.vcount;
             vga_nxt.vsync    = player1.vsync;
             vga_nxt.vblnk    = player1.vblnk;
             vga_nxt.hcount   = player1.hcount;
             vga_nxt.hsync    = player1.hsync;
             vga_nxt.hblnk    = player1.hblnk;
             rgb_nxt          = player1.rgb;
         end
 
         PLAYER2_WIN:begin
             vga_nxt.vcount   = player2.vcount;
             vga_nxt.vsync    = player2.vsync;
             vga_nxt.vblnk    = player2.vblnk;
             vga_nxt.hcount   = player2.hcount;
             vga_nxt.hsync    = player2.hsync;
             vga_nxt.hblnk    = player2.hblnk;
             rgb_nxt          = player2.rgb;
         end
 
         default:begin
             vga_nxt.vcount   = start.vcount;
             vga_nxt.vsync    = start.vsync;
             vga_nxt.vblnk    = start.vblnk;
             vga_nxt.hcount   = start.hcount;
             vga_nxt.hsync    = start.hsync;
             vga_nxt.hblnk    = start.hblnk;
             rgb_nxt          = start.rgb;
         end
 
     endcase
 
 end
 
 
 draw_start draw_start(
     .clk(clk),
     .rst(rst),
     .vga_in,
     .vga_out(start)
 );
 
 draw_map draw_map(
     .clk(clk),
     .rst(rst),
     .vga_in,
     .map,
     .vga_out(game)
 );
 
 draw_player1_win draw_player1_win(
     .clk(clk65MHz),
     .rst(rst),
     .vga_in,
     .vga_out(player1)
 );
 
 draw_player2_win draw_player2_win(
     .clk(clk65MHz),
     .rst(rst),
     .vga_in,
     .vga_out(player2)
 );
 
 
 endmodule