/**
 * Author: Agnieszka Wroblewska, Magdalena Tatko
 * MTM UEC2
 * Description: Control direction
 */

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

logic [27:0]    count, count_nxt;
localparam clk_loop = 8_125_000;

always_ff@ (posedge clk) begin
    if(rst)begin
        current_direction_1 <= WAIT;
        current_direction_2 <= WAIT;
        count <= 0;
    end else begin
        current_direction_1 <= nxt_direction_1;
        current_direction_2 <= nxt_direction_2;
        count <= count_nxt;
    end
end

always_comb begin

        nxt_direction_1 = current_direction_1;
        nxt_direction_2 = current_direction_2;
        count_nxt = count;

    if(count >= clk_loop) begin

        case(selected_player)

        2'b01:begin
            case(current_direction_1)
                WAIT: begin
                    if(mouse_right)begin
                        nxt_direction_1 = RIGHT;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else if (mouse_left)begin
                        nxt_direction_1 = LEFT;
                        nxt_direction_2 = current_direction_2;
                    end
                    else begin
                        nxt_direction_1 = WAIT;
                        nxt_direction_2 = current_direction_2;
                    end
                end

                RIGHT:begin
                    if(mouse_right)begin
                        nxt_direction_1 = DOWN;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else if (mouse_left) begin
                        nxt_direction_1 = UP;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else begin
                        nxt_direction_1 = RIGHT;
                        nxt_direction_2 = current_direction_2;
                    end
                end

                DOWN:begin
                    if(mouse_right)begin
                        nxt_direction_1 = LEFT;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else if (mouse_left)begin
                        nxt_direction_1 = RIGHT;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else begin 
                        nxt_direction_1 = DOWN;
                        nxt_direction_2 = current_direction_2;
                    end
                end

                LEFT:begin
                    if(mouse_right)begin
                        nxt_direction_1 = UP;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else if (mouse_left)begin
                        nxt_direction_1 = DOWN;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else begin 
                        nxt_direction_1 = LEFT;
                        nxt_direction_2 = current_direction_2;
                    end
                end

                UP:begin
                    if(mouse_right)begin
                        nxt_direction_1 = RIGHT;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else if (mouse_left)begin
                        nxt_direction_1 = LEFT;
                        nxt_direction_2 = current_direction_2;
                    end 
                    else begin 
                        nxt_direction_1 = UP;
                        nxt_direction_2 = current_direction_2;
                    end
                end
        
                default:begin
                        nxt_direction_1 = current_direction_1;
                        nxt_direction_2 = current_direction_2; 
                end
                endcase
            end

        2'b11:begin
            case(current_direction_2)
                WAIT: begin
                    if(mouse_right)begin
                        nxt_direction_2 = RIGHT;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else if (mouse_left)begin
                        nxt_direction_2 = LEFT;
                        nxt_direction_1 = current_direction_1;
                    end
                    else begin
                        nxt_direction_2 = WAIT;
                        nxt_direction_1 = current_direction_1;
                    end
                end

            RIGHT:begin
                    if(mouse_right)begin
                        nxt_direction_2 = DOWN;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else if (mouse_left) begin
                        nxt_direction_2 = UP;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else begin
                        nxt_direction_2 = RIGHT;
                        nxt_direction_1 = current_direction_1;
                    end
                end

            DOWN:begin
                    if(mouse_right)begin
                        nxt_direction_2 = LEFT;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else if (mouse_left)begin
                        nxt_direction_2 = RIGHT;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else begin 
                        nxt_direction_2 = DOWN;
                        nxt_direction_1 = current_direction_1;
                    end
                end

            LEFT:begin
                    if(mouse_right)begin
                        nxt_direction_2 = UP;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else if (mouse_left)begin
                        nxt_direction_2 = DOWN;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else begin 
                        nxt_direction_2 = LEFT;
                        nxt_direction_1 = current_direction_1;
                    end
                end

            UP:begin
                    if(mouse_right)begin
                        nxt_direction_2 = RIGHT;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else if (mouse_left)begin
                        nxt_direction_2 = LEFT;
                        nxt_direction_1 = current_direction_1;
                    end 
                    else begin 
                        nxt_direction_2 = UP;
                        nxt_direction_1 = current_direction_1;
                    end
                end
        
            default:begin
                    nxt_direction_2 = current_direction_2;
                    nxt_direction_1 = current_direction_1;
                end
            endcase
        end

        2'b00:begin
            nxt_direction_1 = WAIT;
            nxt_direction_2 = WAIT;
    end

        default: begin
            nxt_direction_1 = current_direction_1;
            nxt_direction_2 = current_direction_2;
    end
    endcase

    count_nxt = 0;
 
    end else begin
 
             count_nxt = count + 1;
     end
end

assign direction_1 = current_direction_1;
assign direction_2 = current_direction_2;

endmodule