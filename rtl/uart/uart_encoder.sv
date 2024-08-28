import game_pkg::*;

module uart_encoder(
    input wire clk,
    input wire rst,
    input wire tx_full,
    input wire [1:0] selected_player,
    input wire player1_collision,
    input wire player2_collision,
    input wire [7:0] current_x_1,  
    input wire [7:0] current_y_1,  
    input wire [7:0] current_x_2,  
    input wire [7:0] current_y_2,
    input wire game_start,            

    output logic wr_uart,
    output logic [7:0] w_data
);


    logic [7:0] w_data_nxt;
    logic [2:0] module_counter, module_counter_nxt;
    logic wr_uart_nxt;
    logic tx_tick, tx_tick_nxt;
   

    always_ff @(posedge clk) begin
        if(rst) begin
            w_data <= '0;
            module_counter <= '0;
            wr_uart <= '0;
            tx_tick <= 1'b1;
    
        end
        else begin
            w_data <= w_data_nxt;
            module_counter <= module_counter_nxt;
            wr_uart <= wr_uart_nxt;
            tx_tick <= tx_tick_nxt;

        end
    end



    always_comb begin
        if(tx_full == 1'b0) begin
            case(module_counter)
                3'b000: begin
                    w_data_nxt ={3'b000, selected_player, 3'b000};   
                end
            

                3'b001:begin
                    if(selected_player == 2'b01)begin
                       w_data_nxt ={1'b0, current_x_1[3:0], 3'b001};
                    end
                    else if(selected_player == 2'b11)begin
                        w_data_nxt ={1'b0, current_x_2[3:0], 3'b001};
                    end
                end

                3'b010:begin
                    if(selected_player == 2'b01)begin
                        w_data_nxt ={1'b0, current_x_1[7:4], 3'b010};
                     end
                     else if(selected_player == 2'b11)begin
                         w_data_nxt ={1'b0, current_x_2[7:4], 3'b010};
                     end
                end

                3'b011:begin
                    if(selected_player == 2'b01)begin
                        w_data_nxt ={1'b0, current_y_1[7:4], 3'b011};
                     end
                     else if(selected_player == 2'b11)begin
                         w_data_nxt ={1'b0, current_y_2[7:4], 3'b011};
                     end
                end
                
                3'b100:begin
                    if(selected_player == 2'b01)begin
                       w_data_nxt ={1'b0, current_y_1[3:0], 3'b100};
                    end
                    else if(selected_player == 2'b11)begin
                        w_data_nxt ={1'b0, current_y_2[3:0], 3'b100};
                    end
                end

                3'b101: begin
                    if(selected_player == 2'b01)begin
                        w_data_nxt ={4'b0000, player1_collision, 3'b101};
                    end
                    else if(selected_player == 2'b11)begin
                        w_data_nxt={4'b0000, player2_collision, 3'b101};
                    end
                end
             
                
                default:begin 
                end 
        
            endcase


            if(tx_tick)begin
                module_counter_nxt = module_counter + 1;
                tx_tick_nxt = 1'b0;
            end
            else begin
                module_counter_nxt = module_counter;
                tx_tick_nxt = 1'b0;
            end


            if(wr_uart)begin
                wr_uart_nxt = 1'b0;
            end
            else begin
                wr_uart_nxt = 1'b1;
            end
        
        end
        else begin
            wr_uart_nxt = 1'b0;
            tx_tick_nxt = 1'b1;
            w_data_nxt = w_data;
            module_counter_nxt = module_counter;
        end
    end
        

endmodule
