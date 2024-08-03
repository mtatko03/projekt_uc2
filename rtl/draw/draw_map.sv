/*
 * Display a game map on a screen.
 */

`timescale 1ns/1ps

import game_pkg::*;

module draw_map
import vga_pkg::*; (
    input logic        clk,
    input logic        rst,
    input tile map [MAP_WIDTH][MAP_HEIGHT],

    vga_if.in vga_in,
    vga_if.out vga_out
);

logic [11:0] rgb_nxt;
logic frame;

assign frame = (vga_in.hcount/SIZE == 0 || vga_in.hcount/SIZE == MAP_WIDTH-1 || vga_in.vcount/SIZE == 0 || vga_in.vcount/SIZE == MAP_HEIGHT-1);

always_ff @(posedge clk ) begin 
    if (rst) begin
        vga_out.vcount  <= '0;
        vga_out.vsync   <= '0;
        vga_out.vblnk   <= '0;
        vga_out.hcount  <= '0;
        vga_out.hsync   <= '0;
        vga_out.hblnk   <= '0;
        vga_out.rgb     <= '0;
    end else begin
        vga_out.vcount  <= vga_in.vcount;
        vga_out.vsync   <= vga_in.vsync;
        vga_out.vblnk   <= vga_in.vblnk;
        vga_out.hcount  <= vga_in.hcount;
        vga_out.hsync   <= vga_in.hsync;
        vga_out.hblnk   <= vga_in.hblnk;
        vga_out.rgb     <= rgb_nxt;
    end
end

always_comb begin
    if (frame) begin
        rgb_nxt = FRAME_COLOR;
    end else begin

    case(map[vga_in.hcount/SIZE][vga_in.vcount/SIZE])
        EMPTY:     rgb_nxt = EMPTY_COLOR;
        PLAYER1:   rgb_nxt = PLAYER1_COLOR;
        PLAYER2:   rgb_nxt = PLAYER2_COLOR;
        FRAME:     rgb_nxt = FRAME_COLOR;
        default:   rgb_nxt = EMPTY_COLOR;
    endcase
end
end
endmodule