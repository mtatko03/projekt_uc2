`timescale 1ns/1ps

module draw_square_ctl
import vga_pkg::*; (
    input logic        clk,
    input logic        rst,
    input logic        mouse_right,


    vga_if.in vga_in,

    output logic [11:0] xpos_square,
    output logic [11:0] ypos_square
);

localparam SIZE = 8;

logic [11:0]    xpos_nxt, ypos_nxt;


typedef enum bit [1:0]{
    WAIT        = 2'b00,
    RIGHT       = 2'b01
} STATE_T;

STATE_T state, state_nxt;


always_ff @(posedge clk ) begin : xypos_blk
    if(rst) begin
        state    <= WAIT;
        xpos_square     <= 12'd150;
        ypos_square     <= 12'd100;

    end else begin 
        if (vga_in.hcount == 0 && vga_in.vcount == 0) begin
        state    <= state_nxt;
        xpos_square     <= xpos_nxt;
        ypos_square     <= ypos_nxt;
        end 

    end
end


always_comb begin : state_nxt_blk
    case(state)
        WAIT:        state_nxt = mouse_right ? RIGHT: WAIT;
        RIGHT:       state_nxt = WAIT;
        default:     state_nxt = WAIT;
    endcase  
end


always_comb begin : output_blk
    case(state)
        WAIT: begin
            xpos_nxt = 12'd150;
            ypos_nxt = 12'd100; 
        end

        RIGHT: begin
            xpos_nxt = xpos_square + SIZE;
            ypos_nxt = ypos_square; 
        end

        default: begin
            xpos_nxt = 12'd150;
            ypos_nxt = 12'd100;
        end
    endcase
end

endmodule