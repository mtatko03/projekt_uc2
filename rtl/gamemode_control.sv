`timescale 1ns/1ps



import game_pkg::*;
import vga_pkg::*;

module gamemode_control (
    input logic        clk,
    input logic        rst,
    input logic        mouse_right,
    output game_mode   mode
);

game_mode current_game_mode, game_mode_nxt;

always_ff @(posedge clk) begin
    if (rst) begin
        current_game_mode <= START;
    end else begin
        current_game_mode <= game_mode_nxt;
    end
end

always_comb begin
    game_mode_nxt = current_game_mode; // Domyślnie pozostań w bieżącym trybie
    
    case (current_game_mode)
        START: begin
            if (mouse_right) begin
                game_mode_nxt = GAME;
            end
        end
        
        GAME: begin
            // Możliwość wprowadzenia logiki końca gry
            // W praktyce, powinno być to obsługiwane w module `control.sv`
        end
        
        PLAYER1_WIN: begin
            // Logika końca gry dla PLAYER1_WIN
            game_mode_nxt = PLAYER1_WIN;
        end
        
        PLAYER2_WIN: begin
            // Logika końca gry dla PLAYER2_WIN
            game_mode_nxt = PLAYER2_WIN;
        end

        GAME_OVER: begin
            // Możliwość dodania logiki końca gry
            game_mode_nxt = GAME_OVER;
        end
        
        default: begin
            game_mode_nxt = current_game_mode;
        end
    endcase
end

assign mode = current_game_mode;

endmodule