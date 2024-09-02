`timescale 1ns/1ps

import game_pkg::*;
import vga_pkg::*;

module player_selector(
    input logic clk,
    input logic rst,
    input logic player1,
    input logic player2,
    output logic [1:0] selected_player 
    
);


logic [1:0] selected_player_nxt;

typedef enum bit [2:0] {IDLE, PLAYER_1, PLAYER_2} state_machine;
state_machine  state, state_nxt;

always_ff @(posedge clk) begin
    if(rst) begin
        state <= IDLE;
        selected_player <=2'b00;
    end
    else begin
        state <= state_nxt;
        selected_player <= selected_player_nxt;
    end
end

always_comb begin
    case(state)
        IDLE: begin
            if(player1)begin
                state_nxt = PLAYER_1;
                selected_player_nxt = 2'b01;
            end else if (player2) begin
                state_nxt = PLAYER_2;
                selected_player_nxt = 2'b11;
            end else begin
                state_nxt = IDLE;
                selected_player_nxt = 2'b00;
            end
        end

        PLAYER_1: begin
            state_nxt = PLAYER_1;
            selected_player_nxt = 2'b01;
        end
        
        PLAYER_2: begin
            state_nxt = PLAYER_2;
            selected_player_nxt = 2'b11;
        end

        default: begin
            state_nxt = IDLE;
            selected_player_nxt = 2'b00;
        end
    endcase
end      

endmodule