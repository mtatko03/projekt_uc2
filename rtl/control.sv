/*
 * This module controls the movement of the player on the map based on the direction 
 */

`timescale 1ns/1ps

import game_pkg::*;

module control
import vga_pkg::*; (
    input logic        clk,
    input logic        rst,
    input directions   direction, 
    output tile map    [MAP_WIDTH][MAP_HEIGHT]
);

logic [11:0] rgb_nxt;
logic [7:0] current_x, nxt_x;
logic [7:0] current_y, nxt_y;

tile map_nxt [MAP_WIDTH][MAP_HEIGHT];

always_ff @(posedge clk ) begin 
    if (rst) begin
        current_x <= 10;
        current_y <= 18;
        
        for(bit [7:0] j=0;j<MAP_HEIGHT;j++) begin
            for(bit [7:0] i=0;i<MAP_WIDTH;i++) begin
                if(i==10 && j==18) begin
                    map[i][j] <= PLAYER1;
                end else begin
                    map[i][j] <= EMPTY;
                end
            end
        end

    end else begin
        current_x <= nxt_x;
        current_y <= nxt_y;
        map <= map_nxt;
    end
end

always_comb begin

    case(direction)
        WAIT: begin
            for(bit [7:0] j=0;j<MAP_HEIGHT;j++) begin
                for(bit [7:0] i=0;i<MAP_WIDTH;i++) begin
                    if(i==current_x && j==current_y) begin
                        map_nxt[i][j] = PLAYER1;
                    end else begin
                        map_nxt[i][j] = map[i][j];
                    end
                end
            end
            nxt_x = current_x;
            nxt_y = current_y;
        end

        RIGHT: begin
            for(bit [7:0] j=0;j<MAP_HEIGHT;j++) begin
                for(bit [7:0] i=0;i<MAP_WIDTH;i++) begin
                    if(i==current_x +1 && j==current_y) begin
                        map_nxt[i][j] = PLAYER1;
                    end else begin
                        map_nxt[i][j] = map[i][j];
                    end
                end
            end
            nxt_x = current_x +1;
            nxt_y = current_y;
        end

        LEFT: begin
            for(bit [7:0] j=0;j<MAP_HEIGHT;j++) begin
                for(bit [7:0] i=0;i<MAP_WIDTH;i++) begin
                    if(i==current_x -1 && j==current_y) begin
                        map_nxt[i][j] = PLAYER1;
                    end else begin
                        map_nxt[i][j] = map[i][j];
                    end
                end
            end
            nxt_x = current_x - 1;
            nxt_y = current_y;
        end

        DOWN: begin 
            for(bit [7:0] j=0;j<MAP_HEIGHT;j++) begin
                for(bit [7:0] i=0;i<MAP_WIDTH;i++) begin
                    if(i==current_x && j==current_y+1) begin
                        map_nxt[i][j] = PLAYER1;
                    end else begin
                        map_nxt[i][j] = map[i][j];
                    end
                end
            end
            nxt_x = current_x;
            nxt_y = current_y +1;
        end

        UP: begin
            for(bit [7:0] j=0;j<MAP_HEIGHT;j++) begin
                for(bit [7:0] i=0;i<MAP_WIDTH;i++) begin
                    if(i==current_x && j==current_y-1) begin
                        map_nxt[i][j] = PLAYER1;
                    end else begin
                        map_nxt[i][j] = map[i][j];
                    end
                end
            end
            nxt_x = current_x;
            nxt_y = current_y -1;
        end

        default: begin
            for(bit [7:0] j=0;j<MAP_HEIGHT;j++) begin
                for(bit [7:0] i=0;i<MAP_WIDTH;i++) begin
                    if(i==current_x && j==current_y) begin
                        map_nxt[i][j] = PLAYER1;
                    end else begin
                        map_nxt[i][j] = map[i][j];
                    end
                end
            end
            nxt_x = current_x;
            nxt_y = current_y;
        end
    endcase
end
endmodule