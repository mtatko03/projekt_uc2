/**
 * Copyright (C) 2023  AGH University of Science and Technology
 * MTM UEC2
 * Author:Piotr Kaczmarczyk
 * 
 * Modified by:
 * 2024 AGH University of Science and Technology
 * MTM UEC2
 * Agnieszka Wroblewska, Magdalena Tatko
 *
 * Description:
 * Draw background.
 */


`timescale 1 ns / 1 ps

module draw_bg (
    input  logic clk,
    input  logic rst,
    vga_if.in vga_inbg,
    vga_if.out vga_outbg
);

import vga_pkg::*;


/**
 * Local variables and signals
 */

logic [11:0] rgb_nxt;


/**
 * Internal logic
 */

always_ff @(posedge clk) begin : bg_ff_blk
    if (rst) begin
        vga_outbg.vcount <= '0;
        vga_outbg.vsync  <= '0;
        vga_outbg.vblnk  <= '0;
        vga_outbg.hcount <= '0;
        vga_outbg.hsync  <= '0;
        vga_outbg.hblnk  <= '0;
        vga_outbg.rgb    <= '0;
    end else begin
        vga_outbg.vcount <= vga_inbg.vcount;
        vga_outbg.vsync  <= vga_inbg.vsync;
        vga_outbg.vblnk  <= vga_inbg.vblnk;
        vga_outbg.hcount <= vga_inbg.hcount;
        vga_outbg.hsync  <= vga_inbg.hsync;
        vga_outbg.hblnk <= vga_inbg.hblnk;
        vga_outbg.rgb   <= vga_inbg.rgb;
    end
end

always_comb begin : bg_comb_blk
    if (vga_inbg.vblnk || vga_inbg.hblnk) begin         // Blanking region:
        rgb_nxt = 12'h0_0_0;                            // - make it it black.
    end else begin                                      // Active region:
        if (vga_inbg.vcount == 0)                       // - top edge:
            rgb_nxt = 12'hf_f_0;                
        else if (vga_inbg.vcount == VER_PIXELS - 1)       // - bottom edge:
            rgb_nxt = 12'hf_0_0;                    
        else if (vga_inbg.hcount == 0)                    // - left edge:
            rgb_nxt = 12'h0_f_0;                
        else if (vga_inbg.hcount == HOR_PIXELS - 1)       // - right edge:
            rgb_nxt = 12'h0_0_f;                



        else                                            // The rest of active display pixels:
            rgb_nxt = 12'h8_8_8;                        // - fill with gray.
    end
end

endmodule
