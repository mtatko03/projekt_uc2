/**
 * Author: Agnieszka Wroblewska
 * MTM UEC2
 * Description: Multiplexer
 */

import game_pkg::*;

module mux(
    input wire clk,
    input wire rst,

    input logic [1:0]  selected_player,

    input wire [7:0] control_current_x_1,  
    input wire [7:0] control_current_y_1,  
    input wire [7:0] control_current_x_2,  
    input wire [7:0] control_current_y_2,
    input wire control_player1_collision,
    input wire control_player2_collision,


    input wire [7:0] uart_current_x_1,  
    input wire [7:0] uart_current_y_1,  
    input wire [7:0] uart_current_x_2,  
    input wire [7:0] uart_current_y_2,
    input wire uart_player1_collision,
    input wire uart_player2_collision,

    output logic [7:0] current_x_1,
    output logic [7:0] current_x_2,
    output logic [7:0] current_y_1,
    output logic [7:0] current_y_2,
    output logic player1_collision,
    output logic player2_collision
);

//local variables

logic [7:0] current_x_1_nxt ;
logic [7:0] current_x_2_nxt ;
logic [7:0] current_y_1_nxt ;
logic [7:0] current_y_2_nxt ;
logic player1_collision_nxt;
logic player2_collision_nxt;

//sequential logic

always_ff@ (posedge clk) begin
    if(rst)begin
        current_x_1 <= start_x_1 ;
        current_y_1 <= start_y_1 ;
        current_x_2 <= start_x_2 ;
        current_y_2 <= start_y_2 ;
        player1_collision <= '0;
        player2_collision <= '0;
    end else begin
        current_x_1 <= current_x_1_nxt ;
        current_y_1 <= current_y_1_nxt ;
        current_x_2 <= current_x_2_nxt ;
        current_y_2 <= current_y_2_nxt ;
        player1_collision <= player1_collision_nxt;
        player2_collision <= player2_collision_nxt;
    end
end

//combinational logic

always_comb begin
    case(selected_player)
        2'b00: begin
            current_x_1_nxt = start_x_1; 
            current_y_1_nxt = start_y_1; 
            current_x_2_nxt = start_x_2; 
            current_y_2_nxt = start_y_2; 
            player1_collision_nxt = '0;
            player2_collision_nxt = '0;
        end
        2'b01: begin
            current_x_1_nxt = control_current_x_1 ;
            current_y_1_nxt = control_current_y_1 ;
            current_x_2_nxt = uart_current_x_2 ;
            current_y_2_nxt = uart_current_y_2 ;
            player1_collision_nxt = control_player1_collision ;
            player2_collision_nxt = uart_player2_collision ;
        end
        2'b11: begin
            current_x_1_nxt = uart_current_x_1 ;
            current_y_1_nxt = uart_current_y_1 ;
            current_x_2_nxt = control_current_x_2 ;
            current_y_2_nxt = control_current_y_2 ;
            player1_collision_nxt = uart_player1_collision ;
            player2_collision_nxt = control_player2_collision ;
        end
        default: begin
            current_x_1_nxt = start_x_1; 
            current_y_1_nxt = start_y_1; 
            current_x_2_nxt = start_x_2; 
            current_y_2_nxt = start_y_2;
            player1_collision_nxt = '0;
            player2_collision_nxt = '0;
        end
    endcase
end

endmodule