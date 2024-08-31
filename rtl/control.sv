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
    input logic [1:0]  selected_player,
    input tile         map [MAP_WIDTH][MAP_HEIGHT],
    output logic       player1_collision,
    output logic       player2_collision,
    output logic [7:0] current_x_1,
    output logic [7:0] current_x_2,
    output logic [7:0] current_y_1,
    output logic [7:0] current_y_2
);

//variables

logic [23:0]    count, count_nxt;
logic player1_collision_nxt, player2_collision_nxt;
 
//params

localparam clk_loop = 16_250_000;



always_ff @(posedge clk) begin
    if(rst)begin

    current_x_1 <= start_x_1;
    current_y_1 <= start_y_1;
    player1_collision <=  0;

    current_x_2 <= start_x_2;
    current_y_2 <= start_y_2;
    player2_collision <=  0;

    count <=0;


    end else begin

	current_x_1 <= current_x_1_nxt ;
	current_y_1 <= current_y_1_nxt ;
 	player1_collision <=  player1_collision_nxt ;

    current_x_2 <= current_x_2_nxt ;
    current_y_2 <= current_y_2_nxt ;
    player2_collision <=  player2_collision_nxt ;

    count<= count_nxt;

    end

end

always_comb begin
	//wykrycie kolizji
    if(selected_player == 2'b01)begin
        if (map[current_x_1_nxt][current_y_1_nxt] == EMPTY || (current_x_1_nxt == start_x_1 && current_y_1_nxt == start_y_1)) begin
                // Aktualizacja pozycji gracza

            current_x_1_nxt = current_x_1;
            current_y_1_nxt = current_y_1;
            player1_collision_nxt = 0;

            current_x_2_nxt =  current_x_2;
            current_y_2_nxt =  current_y_2;
            player2_collision_nxt = player2_collision;

        end else begin

            current_x_1_nxt = current_x_1;
            current_y_1_nxt = current_y_1;
            player1_collision_nxt = 0; //original 1

            current_x_2_nxt =  current_x_2;
            current_y_2_nxt =  current_y_2;
            player2_collision_nxt = player2_collision;
        end
    end

    else if (selected_player == 2'b11)begin
        if (map[current_x_2_nxt][current_y_2_nxt] == EMPTY || (current_x_2_nxt == start_x_1 && current_y_2_nxt == start_y_1)) begin
           
            current_x_2_nxt = current_x_2;
            current_y_2_nxt = current_y_2;
            player2_collision_nxt = 0;

            current_x_1_nxt =  current_x_1;
            current_y_1_nxt =  current_y_1;
            player1_collision_nxt = player1_collision;

        end else begin

            current_x_2_nxt = current_x_2;
            current_y_2_nxt = current_y_2;
            player2_collision_nxt = 0; //original 1

            current_x_1_nxt =  current_x_1;
            current_y_1_nxt =  current_y_1;
            player1_collision_nxt = player1_collision;

        end
     end

    else if (selected_player == 2'b00) begin

        current_x_1_nxt = start_x_1;
        current_y_1_nxt = start_y_1;
        player1_collision_nxt =  0;
    
        current_x_2_nxt = start_x_2;
        current_y_2_nxt = start_y_2;
        player2_collision_nxt =  0;

    end else begin

        current_x_1_nxt = start_x_1;
        current_y_1_nxt = start_y_1;
        player1_collision_nxt =  0;
    
        current_x_2_nxt = start_x_2;
        current_y_2_nxt = start_y_2;
        player2_collision_nxt =  0;
    
    end
    

                //aktualizacja pozycji
	if(count >= clk_loop) begin
        case(selected_player)
        2'b01: begin //DOPISAĆ CO SIĘ DZIEJE Z nxt_x_2 i nxt_y_2
        // Ustalanie nowej pozycji 
            case(direction_1) 
                WAIT: begin
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1;
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2;
                end
                RIGHT: begin
                    current_x_1_nxt = current_x_1 + 1;
                    current_y_1_nxt = current_y_1;
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2;
                end
                LEFT: begin
                    current_x_1_nxt = current_x_1 - 1;
                    current_y_1_nxt = current_y_1;
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2;
                end
                DOWN: begin
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1 + 1;
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2;
                end
                UP: begin
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1 - 1;
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2;
                end
                default: begin
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1;
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2;
                end
            endcase
        end

        2'b11:begin //DOPISAĆ CO SIĘ DZIEJE Z nxt_x_1 i nxt_y_1
            // Ustalanie nowej pozycji
            case(direction_2)
                WAIT: begin
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2;
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1;
                end
                RIGHT: begin
                    current_x_2_nxt = current_x_2 + 1;
                    current_y_2_nxt = current_y_2;
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1;
                end
                LEFT: begin
                    current_x_2_nxt = current_x_2 - 1;
                    current_y_2_nxt = current_y_2;
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1;
                end
                DOWN: begin
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2 + 1;
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1;
                end
                UP: begin
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2 - 1;
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1;
                end
                default: begin
                    current_x_2_nxt = current_x_2;
                    current_y_2_nxt = current_y_2;
                    current_x_1_nxt = current_x_1;
                    current_y_1_nxt = current_y_1;
                end
            endcase
        end

        2'b00:begin
            current_x_1_nxt = current_x_1;
            current_y_1_nxt = current_y_1;
            current_x_2_nxt = current_x_2;
            current_y_2_nxt = current_y_2;
        end
        default:begin
            current_x_1_nxt = current_x_1;
            current_y_1_nxt = current_y_1;
            current_x_2_nxt = current_x_2;
            current_y_2_nxt = current_y_2;
        end
    endcase

        count_nxt = 0;

   	 end else begin
    
        	count_nxt = count + 1;
    end
	
end

endmodule