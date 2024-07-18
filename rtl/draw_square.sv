/**
 * Author:Agnieszka Wroblewska, Magdalena Tatko
 * 2024 AGH University of Science and Technology
 * MTM UEC2
 *
 * Description:
 * Draw the initial square
 */

 module draw_square
    #(parameter POSITION_Y = 100,
    parameter POSITION_X = 150,
    parameter HEIGHT = 8,
    parameter WIDTH = 8,
    parameter COLOR = 12'hf_0_f)(

        input logic clk,
        input logic rst,
        input logic [11:0] xpos,
        input logic [11:0] ypos,

        vga_if.in vga_in,
        vga_if.out vga_out

);

logic [11:0] rgb_nxt;

always_ff @(posedge clk) begin
    if(rst) begin
        vga_out.vcount  <= '0;
        vga_out.vsync   <= '0;
        vga_out.vblnk   <= '0;
        vga_out.hcount  <= '0;
        vga_out.hsync   <= '0;
        vga_out.hblnk   <= '0;
        vga_out.rgb  <= '0;
    end else begin
        vga_out.vcount  <= vga_in.vcount;
        vga_out.vsync   <= vga_in.vsync;
        vga_out.vblnk   <= vga_in.vblnk;
        vga_out.hcount  <= vga_in.hcount;
        vga_out.hsync   <= vga_in.hsync;
        vga_out.hblnk   <= vga_in.hblnk;
        vga_out.rgb  <= rgb_nxt;
    end
end

always_comb begin
    if (vga_in.hcount >= POSITION_X && vga_in.vcount >= POSITION_Y && ( vga_in.vcount <= POSITION_Y + HEIGHT)&& (vga_in.hcount <= POSITION_X + WIDTH))
        rgb_nxt = COLOR;
        else
        rgb_nxt = vga_in.rgb;
    end
endmodule