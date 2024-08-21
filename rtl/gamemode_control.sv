`timescale 1ns/1ps



import game_pkg::*;
import vga_pkg::*;

module gamemode_control (
    input logic        clk,
    input logic        rst,
    input logic        mouse_left,
    output game_mode   mode,
    input logic        player1_collision,
    input logic [11:0] xpos,
    input logic [11:0] ypos
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
            current_x = start_x;
            current_y = start_y;
            current_direction = WAIT;
            if (mouse_left && (xpos >= PLAY_X_MIN && xpos <= PLAY_X_MAX) && (ypos >= PLAY_Y_MIN && ypos <= PLAY_Y_MAX)) begin
                game_mode_nxt = GAME;
                current_x = start_x;
                current_y = start_y;
            end
        end
        
        GAME: begin
            if(player1_collision)begin
                game_mode_nxt = PLAYER2_WIN;
            end
            // Możliwość wprowadzenia logiki końca gry
            // W praktyce, powinno być to obsługiwane w module `control.sv`
        end
        
        PLAYER1_WIN: begin
            current_x = start_x;
            current_y = start_y;
            current_direction = WAIT; 
            if(mouse_left && (xpos >= RECT_X_MIN && xpos <= RECT_X_MAX) && (ypos >= RECT_Y_MIN && ypos <= RECT_Y_MAX)) begin
                game_mode_nxt = START;
            end
        end
        
        PLAYER2_WIN: begin
            current_x = start_x;
            current_y = start_y;
            current_direction = WAIT;
            if(mouse_left && (xpos >= RECT_X_MIN && xpos <= RECT_X_MAX) && (ypos >= RECT_Y_MIN && ypos <= RECT_Y_MAX)) begin
                game_mode_nxt = START;

            end 
        end
        
        default: begin
            game_mode_nxt = current_game_mode;
        end
    endcase
end

assign mode = current_game_mode;

endmodule