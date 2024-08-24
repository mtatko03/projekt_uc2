`timescale 1ns/1ps

import game_pkg::*;
import vga_pkg::*;

module gamemode_control (
    input logic        clk,
    input logic        rst,
    input logic        mouse_left,
    output game_mode   mode,
    input logic        player1_collision,
    input logic        player2_collision,
    input logic [11:0] xpos,
    input logic [11:0] ypos,
    output logic player1,
    output logic player2
);

game_mode current_game_mode, game_mode_nxt;
logic player1_nxt, player2_nxt;

always_ff @(posedge clk) begin
    if (rst) begin
        current_game_mode <= START;
        player1 <= 0;
        player2 <= 0;
    end else begin
        current_game_mode <= game_mode_nxt;
        player1 <= player1_nxt;
        player2 <= player2_nxt;
    end
end

always_comb begin
    game_mode_nxt = current_game_mode; // Domyślnie pozostań w bieżącym trybie
    player1_nxt = 0;
    player2_nxt = 0;

    case (current_game_mode)
        START: begin
            current_direction = WAIT;
            if (mouse_left && (xpos >= PLAY_X_MIN && xpos <= PLAY_X_MAX) && (ypos >= PLAY_Y_MIN && ypos <= PLAY_Y_MAX)) begin
                if(player1 == 0)begin
                game_mode_nxt = GAME;
                player1_nxt = 1;
            end
            end 
            else if (mouse_left && (xpos >= 0 && xpos <= 1024) && (ypos >= 0 && ypos <= 300))begin
                if(player2 == 0)begin
                game_mode_nxt = GAME;
                player2_nxt = 1;
            end
            end
        end
        
        GAME: begin
            if(player1_collision)begin
                game_mode_nxt = PLAYER2_WIN;
            end else if (player2_collision)begin
                game_mode_nxt = PLAYER1_WIN;
            end
            // Możliwość wprowadzenia logiki końca gry
            // W praktyce, powinno być to obsługiwane w module `control.sv`
        end
        
        PLAYER1_WIN: begin
            current_direction = WAIT; 
            if(mouse_left && (xpos >= RECT_X_MIN && xpos <= RECT_X_MAX) && (ypos >= RECT_Y_MIN && ypos <= RECT_Y_MAX)) begin
                game_mode_nxt = START;
                player1_nxt = 0; // Resetowanie stanu gracza 1
                player2_nxt = 0; // Resetowanie stanu gracza 2
            end
        end
        
        PLAYER2_WIN: begin
            current_direction = WAIT;
            if(mouse_left && (xpos >= RECT_X_MIN && xpos <= RECT_X_MAX) && (ypos >= RECT_Y_MIN && ypos <= RECT_Y_MAX)) begin
                game_mode_nxt = START;
                player1_nxt = 0; // Resetowanie stanu gracza 1
                player2_nxt = 0; // Resetowanie stanu gracza 2

            end 
        end
        
        default: begin
            game_mode_nxt = current_game_mode;
        end
    endcase
end

assign mode = current_game_mode;

endmodule