`timescale 1ns/1ps

import game_pkg::*;
import vga_pkg::*;

module direction_control(
    input logic        clk,
    input logic        rst,
    input logic        mouse_right,
    input logic        mouse_left,
    output directions  direction
);

directions current_direction, nxt_direction;

always_ff@ (posedge clk) begin
    if(rst)begin
        current_direction <= WAIT;
    end else begin
        current_direction <= nxt_direction;
    end
end

always_comb begin

    nxt_direction = WAIT;
    case(current_direction)
        WAIT: begin
            if(mouse_right)begin
                nxt_direction = RIGHT;
            end 
            else if (mouse_left)begin
                nxt_direction = LEFT;
            end
            else begin
                nxt_direction = WAIT;
            end
        end

        RIGHT:begin
            if(mouse_right)begin
                nxt_direction = DOWN;
            end 
            else if (mouse_left) begin
                nxt_direction = UP;
            end 
            else begin
                nxt_direction = RIGHT;
            end
        end

        DOWN:begin
            if(mouse_right)begin
                nxt_direction = LEFT;
            end 
            else if (mouse_left)begin
                nxt_direction = RIGHT;
            end 
            else begin 
                nxt_direction = DOWN;
            end
        end

        LEFT:begin
            if(mouse_right)begin
                nxt_direction = UP;
            end 
            else if (mouse_left)begin
                nxt_direction = DOWN;
            end 
            else begin 
                nxt_direction = LEFT;
            end
        end

        UP:begin
            if(mouse_right)begin
                nxt_direction = RIGHT;
            end 
            else if (mouse_left)begin
                nxt_direction = LEFT;
            end 
            else begin 
                nxt_direction = UP;
            end
        end
        
        default:begin
            nxt_direction = current_direction;
        end
    endcase
end

assign direction = current_direction;

endmodule