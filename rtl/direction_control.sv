`timescale 1ns/1ps

import game_pkg::*;
import vga_pkg::*;

module direction_control(
    input logic        clk,
    input logic        rst,
    input logic        mouse_right,
    input logic        mouse_left,
    output directions  direction_1,
    output directions  direction_2,
    input  logic [1:0] selected_player
);

directions current_direction_1, nxt_direction_1;
directions current_direction_2, nxt_direction_2;


always_ff@ (posedge clk) begin
    if(rst)begin
        current_direction_1 <= WAIT;
        current_direction_2 <= WAIT;
    end else begin
        current_direction_1 <= nxt_direction_1;
        current_direction_2 <= nxt_direction_2;
    end
end

always_comb begin

    nxt_direction_1 = WAIT;
    nxt_direction_2 = WAIT;

    case(selected_player)
    2'b01:begin
    case(current_direction_1)
        WAIT: begin
            if(mouse_right)begin
                nxt_direction_1 = RIGHT;
            end 
            else if (mouse_left)begin
                nxt_direction_1 = LEFT;
            end
            else begin
                nxt_direction_1 = WAIT;
            end
        end

        RIGHT:begin
            if(mouse_right)begin
                nxt_direction_1 = DOWN;
            end 
            else if (mouse_left) begin
                nxt_direction_1 = UP;
            end 
            else begin
                nxt_direction_1 = RIGHT;
            end
        end

        DOWN:begin
            if(mouse_right)begin
                nxt_direction_1 = LEFT;
            end 
            else if (mouse_left)begin
                nxt_direction_1 = RIGHT;
            end 
            else begin 
                nxt_direction_1 = DOWN;
            end
        end

        LEFT:begin
            if(mouse_right)begin
                nxt_direction_1 = UP;
            end 
            else if (mouse_left)begin
                nxt_direction_1 = DOWN;
            end 
            else begin 
                nxt_direction_1 = LEFT;
            end
        end

        UP:begin
            if(mouse_right)begin
                nxt_direction_1 = RIGHT;
            end 
            else if (mouse_left)begin
                nxt_direction_1 = LEFT;
            end 
            else begin 
                nxt_direction_1 = UP;
            end
        end
        
        default:begin
            nxt_direction_1 = current_direction_1;
        end
    endcase
end

2'b11:begin
    case(current_direction_2)
        WAIT: begin
            if(mouse_right)begin
                nxt_direction_2 = RIGHT;
            end 
            else if (mouse_left)begin
                nxt_direction_2 = LEFT;
            end
            else begin
                nxt_direction_2 = WAIT;
            end
        end

        RIGHT:begin
            if(mouse_right)begin
                nxt_direction_2 = DOWN;
            end 
            else if (mouse_left) begin
                nxt_direction_2 = UP;
            end 
            else begin
                nxt_direction_2 = RIGHT;
            end
        end

        DOWN:begin
            if(mouse_right)begin
                nxt_direction_2 = LEFT;
            end 
            else if (mouse_left)begin
                nxt_direction_2 = RIGHT;
            end 
            else begin 
                nxt_direction_2 = DOWN;
            end
        end

        LEFT:begin
            if(mouse_right)begin
                nxt_direction_2 = UP;
            end 
            else if (mouse_left)begin
                nxt_direction_2 = DOWN;
            end 
            else begin 
                nxt_direction_2 = LEFT;
            end
        end

        UP:begin
            if(mouse_right)begin
                nxt_direction_2 = RIGHT;
            end 
            else if (mouse_left)begin
                nxt_direction_2 = LEFT;
            end 
            else begin 
                nxt_direction_2 = UP;
            end
        end
        
        default:begin
            nxt_direction_2 = current_direction_2;
        end
    endcase
end

default: begin
    nxt_direction_1 = current_direction_1;
    nxt_direction_2 = current_direction_2;
    end
    endcase
end

assign direction_1 = current_direction_1;
assign direction_2 = current_direction_2;

endmodule