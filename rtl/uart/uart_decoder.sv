import game_pkg::*;

module uart_decoder(
    input wire clk,
    input wire rst,
    input wire [7:0] read_data, 
    input wire rx_empty,
    
    //zmienić na osobny kabel uart_selected_player, idący bezpośrednio z tego modułu do gamemode_selectora
    //w gamemode_controlu dalszy zakomentowany kod do obsługi tego sygnału
    output logic [1:0] selected_player, 


    output logic  player1_collision,
    output logic  player2_collision,
    output logic [7:0] current_x_1,  
    output logic [7:0] current_y_1,  
    output logic [7:0] current_x_2,  
    output logic [7:0] current_y_2,
    output logic rd_uart

);

logic rd_uart_nxt;
logic player1_collision_nxt;
logic player2_collision_nxt;
logic [7:0] current_x_1_nxt;
logic [7:0] current_x_2_nxt;
logic [7:0] current_y_1_nxt;
logic [7:0] current_y_2_nxt;
logic [1:0] selected_player_nxt;


always_ff @(posedge clk) begin
    if(rst)begin
        rd_uart <= '0;
        player1_collision <= '0;
        player2_collision <= '0;
        current_x_1 <= '0;
        current_x_2 <= '0;
        current_y_1 <= '0;
        current_y_2 <= '0;
        selected_player <= '0;

        
    end
    else begin
        rd_uart <= rd_uart_nxt;
        player1_collision <= player1_collision_nxt;
        player2_collision <= player2_collision_nxt;
        current_x_1 <= current_x_1_nxt;
        current_x_2 <= current_x_2_nxt;
        current_y_1 <= current_y_1_nxt;
        current_y_2 <= current_y_2_nxt;
        selected_player <= selected_player_nxt;
    end
end


always_comb begin
    
    rd_uart_nxt = rd_uart;
    player1_collision_nxt = player1_collision;
    player2_collision_nxt = player2_collision;
    current_x_1_nxt = current_x_1;
    current_y_1_nxt = current_y_1;
    current_x_2_nxt = current_x_2;
    current_y_2_nxt = current_y_2;
    selected_player_nxt = selected_player;

    //przyklad//
    if(rx_empty == 1'b0)begin
        case(read_data[3:0]) //bits [7:3] left empty. bits [2:0] - opcode
            4'b0000:begin
                selected_player_nxt = read_data[5:4];
            end
            4'b0001: begin
                if(selected_player == 2'b01)begin
                    current_x_1_nxt[3:0] = read_data[7:4];
                end else begin
                    current_x_2_nxt[3:0] = read_data[7:4];
                end
                
            end
            4'b0010: begin
                if(selected_player == 2'b01)begin
                    current_x_1_nxt[7:4] = read_data[7:4];
                end else begin
                    current_x_2_nxt[7:4] = read_data[7:4];
                end
            end

            4'b0011: begin
                if(selected_player == 2'b01)begin
                    current_y_1_nxt[7:4] = read_data[7:4];
                end else begin
                    current_y_2_nxt[7:4] = read_data[7:4];
                end

            end
            4'b0100: begin
                if(selected_player == 2'b01)begin
                    current_y_1_nxt[3:0] = read_data[7:4];
                end else begin
                    current_y_2_nxt[3:0] = read_data[7:4];
                end
            end
            
            4'b0101: begin
                if(selected_player == 2'b01)begin
                    player1_collision_nxt = read_data[4];
                end else begin
                    player2_collision_nxt = read_data[4];
                end
            end
            default:begin
               selected_player_nxt = read_data[5:4]; 
            end
        endcase

            if(rd_uart == 1'b0)begin
                rd_uart_nxt = 1'b1;
            end
            else begin
                rd_uart_nxt = 1'b0;
            end
        end
        else begin
            rd_uart_nxt = 1'b0;
        end
end

endmodule