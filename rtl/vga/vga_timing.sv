/**
 * Copyright (C) 2023  AGH University of Science and Technology
 * MTM UEC2
 * Author: Agnieszka Wroblewska, Magdalena Tatko
 *
 * Description:
 * Vga timing controller.
 */

`timescale 1 ns / 1 ps

module vga_timing (
    input  logic clk,
    input  logic rst,
    vga_if.out vga_out
);

import vga_pkg::*;


/**
 * Local variables and signals
 */

// Add your signals and variables here.
 logic [10:0] hcount_nxt;
 logic [10:0] vcount_nxt;
 logic hblnk_nxt;
 logic vblnk_nxt;
 logic hsync_nxt;
 logic vsync_nxt;

/**
 * Internal logic
 */

// Add your code here.

always_ff@(posedge clk) begin
    if(rst) begin
        vga_out.hcount <= 0;
        vga_out.vcount <= 0;
        vga_out.hblnk <= 0;
        vga_out.vblnk <= 0;
        vga_out.hsync <= 0;
        vga_out.vsync <= 0;
        vga_out.rgb <= '0 ;
    end
    else begin
        vga_out.hcount <= hcount_nxt; 
        vga_out.vcount <= vcount_nxt;
        vga_out.hblnk <= hblnk_nxt;
        vga_out.vblnk <= vblnk_nxt;
        vga_out.hsync <= hsync_nxt;
        vga_out.vsync <= vsync_nxt;
        vga_out.rgb <= 12'h0_0_0 ;
    end
end

always_comb begin
    if(vga_out.hcount == HOR_TOTAL_TIME -1) begin
        hcount_nxt = '0;
        if(vga_out.vcount == VER_TOTAL_TIME -1)
            vcount_nxt='0;
        else
            vcount_nxt= vga_out.vcount + 1;
    end 
    else begin
        hcount_nxt = vga_out.hcount +1;
        vcount_nxt = vga_out.vcount;
    end

    hblnk_nxt = (hcount_nxt >= HOR_BLANK_START && hcount_nxt <= HOR_BLANK_END - 1);
    hsync_nxt = (hcount_nxt >= HOR_SYNC_START && hcount_nxt <= HOR_SYNC_END - 1);
    vblnk_nxt = (vcount_nxt >= VER_BLANK_START && vcount_nxt <= VER_BLANK_END - 1);
    vsync_nxt = (vcount_nxt >= VER_SYNC_START && vcount_nxt <= VER_SYNC_END - 1);
end
endmodule
