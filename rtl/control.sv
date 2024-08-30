/*
 * This module controls the movement of the player on the map based on the direction 
 */

`timescale 1ns/1ps


import game_pkg::*;
import vga_pkg::*;
 
module control (
    input logic        clk,
    input logic        rst,
    input directions   direction_1,
    input directions   direction_2,
    input game_mode    mode,
    input logic [1:0]  selected_player,
    output tile        map [MAP_WIDTH][MAP_HEIGHT],
    output logic       player1_collision,
    output logic       player2_collision,
    output logic [7:0] current_x_1,
    output logic [7:0] current_x_2,
    output logic [7:0] current_y_1,
    output logic [7:0] current_y_2

);
 


tile map_nxt [MAP_WIDTH][MAP_HEIGHT];



always_ff @(posedge clk) begin
    if (rst) begin
        // Inicjalizacja mapy
        for (bit [7:0] j = 0; j < MAP_HEIGHT; j++) begin
            for (bit [7:0] i = 0; i < MAP_WIDTH; i++) begin
                if (i == start_x_1 && j == start_y_1) begin
                    map[i][j] <= PLAYER1;
                end else if (i == start_x_2 && j == start_y_2)begin
                    map[i][j] <= PLAYER2;
                end else if (i == 0 || i == MAP_WIDTH-1 || j == 0 || j == MAP_HEIGHT -1 )begin
                    map[i][j] <= FRAME;
                end else begin
                    map[i][j] <= EMPTY;
                end
            end
        end
    end else begin
        if(selected_player == 2'b01)begin
            if (map[nxt_x_1][nxt_y_1] == EMPTY || (nxt_x_1 == start_x_1 && nxt_y_1 == start_y_1)) begin
            // Aktualizacja pozycji gracza
                current_x_1 <= nxt_x_1;
                current_y_1 <= nxt_y_1;
                map <= map_nxt;
                player1_collision <= 0;
            end else begin
                current_x_1 <= current_x_1;
                current_y_1 <= current_y_1;
                map <= map;
                player1_collision <= 1;
            end
        end else if (selected_player == 2'b11)begin
            if (map[nxt_x_2][nxt_y_2] == EMPTY || (nxt_x_2 == start_x_2 && nxt_y_2 == start_y_2)) begin
                // Aktualizacja pozycji gracza
                current_x_2 <= nxt_x_2;
                current_y_2 <= nxt_y_2;
                map <= map_nxt;
                player2_collision <= 0;
            end else begin
                current_x_2 <= current_x_2; 
                current_y_2 <= current_y_2; 
                map <= map;
                player2_collision <= 1;
            end
        end else begin
            
            current_x_1 <= start_x_1;
            current_y_1 <= start_y_1;
    
            current_x_2 <= start_x_2;
            current_y_2 <= start_y_2;
    
            player1_collision <= 0;
            player2_collision <= 0;
        
        end
    end
end

always_comb begin //tu musimy poczytac czy nic na pewno nie trzeba wywalic

    // Kopiowanie mapy z nową pozycją
    for (bit [7:0] j = 0; j < MAP_HEIGHT; j++) begin
        for (bit [7:0] i = 0; i < MAP_WIDTH; i++) begin
            if (selected_player == 2'b01 && i == nxt_x_1 && j == nxt_y_1) begin
                map_nxt[i][j] = PLAYER1;
            end else if (selected_player == 2'b11 && i == nxt_x_2 && j == nxt_y_2)begin
                map_nxt[i][j] = PLAYER2;
            end else begin
                map_nxt[i][j] = map[i][j];
            end
        end
    end

    case(selected_player)
        2'b01: begin //DOPISAĆ CO SIĘ DZIEJE Z nxt_x_2 i nxt_y_2
    // Ustalanie nowej pozycji 
            case(direction_1) 
                WAIT: begin
                    nxt_x_1 = current_x_1;
                    nxt_y_1 = current_y_1;
                end
                RIGHT: begin
                    nxt_x_1 = current_x_1 + 1;
                    nxt_y_1 = current_y_1;
                end
                LEFT: begin
                    nxt_x_1 = current_x_1 - 1;
                    nxt_y_1 = current_y_1;
                end
                DOWN: begin
                    nxt_x_1 = current_x_1;
                    nxt_y_1 = current_y_1 + 1;
                end
                UP: begin
                    nxt_x_1 = current_x_1;
                    nxt_y_1 = current_y_1 - 1;
                end
                default: begin
                    nxt_x_1 = current_x_1;
                    nxt_y_1 = current_y_1;
                end
            endcase
        end

        2'b11:begin //DOPISAĆ CO SIĘ DZIEJE Z nxt_x_1 i nxt_y_1
            // Ustalanie nowej pozycji
            case(direction_2)
                WAIT: begin
                    nxt_x_2 = current_x_2;
                    nxt_y_2 = current_y_2;
                end
                RIGHT: begin
                    nxt_x_2 = current_x_2 + 1;
                    nxt_y_2 = current_y_2;
                end
                LEFT: begin
                    nxt_x_2 = current_x_2 - 1;
                    nxt_y_2 = current_y_2;
                end
                DOWN: begin
                    nxt_x_2 = current_x_2;
                    nxt_y_2 = current_y_2 + 1;
                end
                UP: begin
                    nxt_x_2 = current_x_2;
                    nxt_y_2 = current_y_2 - 1;
                end
                default: begin
                    nxt_x_2 = current_x_2;
                    nxt_y_2 = current_y_2;
                end
            endcase
        end

        2'b00:begin
            nxt_x_1 = current_x_1;
            nxt_y_1 = current_y_1;
            nxt_x_2 = current_x_2;
            nxt_y_2 = current_y_2;

        end

        default:begin
            nxt_x_1 = current_x_1;
            nxt_y_1 = current_y_1;
            nxt_x_2 = current_x_2;
            nxt_y_2 = current_y_2;
        end
    endcase 
end
 
endmodule