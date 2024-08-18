/*
 * This module controls the movement of the player on the map based on the direction 
 */

`timescale 1ns/1ps


import game_pkg::*;
import vga_pkg::*;
 
module control (
    input logic        clk,
    input logic        rst,
    input directions   direction,
    output tile        map [MAP_WIDTH][MAP_HEIGHT],
    output logic       player1_collision
);
 
logic [7:0] current_x, nxt_x;
logic [7:0] current_y, nxt_y;
logic [7:0] prev_x, prev_y;

tile map_nxt [MAP_WIDTH][MAP_HEIGHT];

// Pozycja startowa
logic [7:0] start_x = 10;
logic [7:0] start_y = 18;

always_ff @(posedge clk) begin
    if (rst) begin
        // Resetowanie pozycji gracza
        current_x <= start_x;
        current_y <= start_y;
        player1_collision <= 0;
        
        // Inicjalizacja mapy
        for (bit [7:0] j = 0; j < MAP_HEIGHT; j++) begin
            for (bit [7:0] i = 0; i < MAP_WIDTH; i++) begin
                if (i == start_x && j == start_y) begin
                    map[i][j] <= PLAYER1;
                end else begin
                    map[i][j] <= EMPTY;
                end
            end
        end
    end else begin
        if (map[nxt_x][nxt_y] == EMPTY || (nxt_x == start_x && nxt_y == start_y)) begin
            // Aktualizacja pozycji gracza
            current_x <= nxt_x;
            current_y <= nxt_y;
            map <= map_nxt;
            player1_collision <= 0;
        end else begin
            // Gracz trafił na zajętą pozycję, gra kończy się
            // Przejdź do stanu `PLAYER2_WIN` tutaj lub w `gamemode_control.sv`
            player1_collision <= 1;
        end
    end
end

always_comb begin
    // Kopiowanie mapy z nową pozycją
    for (bit [7:0] j = 0; j < MAP_HEIGHT; j++) begin
        for (bit [7:0] i = 0; i < MAP_WIDTH; i++) begin
            if (i == nxt_x && j == nxt_y) begin
                map_nxt[i][j] = PLAYER1;
            end else begin
                map_nxt[i][j] = map[i][j];
            end
        end
    end
    // Ustalanie nowej pozycji
    case(direction)
        WAIT: begin
            nxt_x = current_x;
            nxt_y = current_y;
        end
        RIGHT: begin
            nxt_x = current_x + 1;
            nxt_y = current_y;
        end
        LEFT: begin
            nxt_x = current_x - 1;
            nxt_y = current_y;
        end
        DOWN: begin
            nxt_x = current_x;
            nxt_y = current_y + 1;
        end
        UP: begin
            nxt_x = current_x;
            nxt_y = current_y - 1;
        end
        default: begin
            nxt_x = current_x;
            nxt_y = current_y;
        end
    endcase
end

 
endmodule