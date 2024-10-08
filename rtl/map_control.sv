`timescale 1ns/1ps


import game_pkg::*;
import vga_pkg::*;
 
module map_control (
    input logic        clk,
    input logic        rst,
    input logic [1:0]  selected_player,
    input game_mode mode,
    output tile        map [MAP_WIDTH][MAP_HEIGHT],
    input logic [7:0]  current_x_1,
    input logic [7:0]  current_y_1,
    input logic [7:0]  current_x_2,
    input logic [7:0]  current_y_2
);
 
tile  map_nxt [MAP_WIDTH][MAP_HEIGHT];
logic initialization, initialization_nxt;

always_ff @(posedge clk) begin
    if (rst) begin

        initialization <= 0;
         map <= map;

    end else begin

        initialization <=  initialization_nxt;
        map <= map_nxt;
        
    end
end

always_comb begin
    if( initialization == 0 || mode == PLAYER1_WIN || mode == PLAYER2_WIN )begin

        for (bit [7:0] j = 0; j < MAP_HEIGHT; j++) begin
            for (bit [7:0] i = 0; i < MAP_WIDTH; i++) begin
                if (i == start_x_1 && j == start_y_1) begin
                        map_nxt[i][j] = PLAYER1;
                    end else if (i == start_x_2 && j == start_y_2)begin
                        map_nxt[i][j] = PLAYER2;
                    end else if (i == 0 || i == MAP_WIDTH-1 || j == 0 || j == MAP_HEIGHT -1 )begin
                        map_nxt[i][j] = FRAME;
                    end else if((i == 9 && j == 19) || (i == 9 && j == 20) ||(i == 9 && j == 21) ||(i == 9 && j ==22) ||(i == 9 && j == 23) ||(i == 9 && j == 24) ||(i == 9 && j == 25) || (i == 9 && j == 26) ||(i == 9 && j == 27) ||(i == 9 && j ==28) ||(i == 9 && j == 29) ||(i == 9 && j == 30))begin
                        map_nxt[i][j] = FRAME;
                    end else if((i == 55 && j == 19) || (i == 55 && j == 20) ||(i == 55 && j == 21) ||(i == 55 && j ==22) ||(i == 55 && j == 23) ||(i == 55 && j == 24) ||(i == 55 && j == 25) || (i == 55 && j == 26) ||(i == 55 && j == 27) ||(i == 55 && j ==28) ||(i == 55 && j == 29) ||(i == 55 && j == 30))begin
                        map_nxt[i][j] = FRAME;
                    end else if ((i == 9 && j == 9) || (i == 55 && j == 9) || (i == 15 && j == 33 ) || (i ==49 && j == 33 ))begin
                        map_nxt[i][j] = PLAYER2;
                    end else if ((i == 9 && j == 39) || (i == 49 && j == 15) || (i == 55 && j == 39 ) || (i == 15 && j == 15 ))begin
                        map_nxt[i][j] = PLAYER1;
                    end else begin
                        map_nxt[i][j] = EMPTY;
                    end
            end
        end
    end
    else begin
        for (bit [7:0] j = 0; j < MAP_HEIGHT; j++) begin
            for (bit [7:0] i = 0; i < MAP_WIDTH; i++) begin
                if (selected_player == 2'b01 && i == current_x_1 && j == current_y_1) begin
                    map_nxt[i][j] = PLAYER1;
                end else if (selected_player == 2'b11 && i == current_x_2 && j == current_y_2)begin
                    map_nxt[i][j] = PLAYER2;
                end else begin
                    map_nxt[i][j] = map[i][j];
                end
            end
        end


    end

    initialization_nxt = 1;


end

endmodule

