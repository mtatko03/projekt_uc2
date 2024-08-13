`timescale 1ns/1ps

import game_pkg::*;
import vga_pkg::*;

module gamemode_control(
    input logic        clk,
    input logic        rst,
    input logic        mouse_right,
    output game_mode   mode
);

game_mode current_game_mode, game_mode_nxt;

always_ff @(posedge clk)begin
    if(rst)begin
        current_game_mode <= START;
    end
    else begin
        current_game_mode <= game_mode_nxt;
    end
end

always_comb begin
        game_mode_nxt = START;
    case(current_game_mode)
        START:begin
            if(mouse_right)begin
                game_mode_nxt = GAME;
            end
            else begin
                game_mode_nxt = START;
            end
        end
        
        GAME:begin
            game_mode_nxt = GAME;
        end

        default:begin
            game_mode_nxt = current_game_mode;
        end
    endcase
end

assign mode = current_game_mode;

endmodule