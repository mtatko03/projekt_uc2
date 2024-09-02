/**
 * Author: Magdalena Tatko
 * MTM UEC2
 * Description: draws the screen when player1 wins
 */ 

 `timescale 1 ns / 1 ps
 
 import game_pkg::*;
 import vga_pkg::*;

 module draw_player2_win
        (
            input logic clk,
            input logic rst,
            vga_if.in vga_in,
            vga_if.out vga_out
 );

 logic [11:0] rgb_nxt;
 
 always_ff @(posedge clk) begin : bg_ff_blk
    if (rst) begin
        vga_out.vcount <= '0;
        vga_out.vsync  <= '0;
        vga_out.vblnk  <= '0;
        vga_out.hcount <= '0;
        vga_out.hsync  <= '0;
        vga_out.hblnk  <= '0;
        vga_out.rgb    <= '0;
    end else begin
        vga_out.vcount <= vga_in.vcount;
        vga_out.vsync  <= vga_in.vsync;
        vga_out.vblnk  <= vga_in.vblnk;
        vga_out.hcount <= vga_in.hcount;
        vga_out.hsync  <= vga_in.hsync;
        vga_out.hblnk  <= vga_in.hblnk;
        vga_out.rgb    <= rgb_nxt;
    end
end

always_comb begin 
    if (vga_in.vblnk || vga_in.hblnk) begin                // Blanking region:
        rgb_nxt = 12'h0_0_0;                               // - make it it black.
    end else begin                                         // Active region:
        if (vga_in.vcount == 0)                            // - top edge:
            rgb_nxt = PLAYER2_COLOR;                
        else if (vga_in.vcount == VER_PIXELS - 1)          // - bottom edge:
            rgb_nxt = PLAYER2_COLOR;                
        else if (vga_in.hcount == 0)                       // - left edge:
            rgb_nxt = PLAYER2_COLOR;                
        else if (vga_in.hcount == HOR_PIXELS - 1)          // - right edge:
            rgb_nxt = PLAYER2_COLOR;                


        //WINS
            //W
            else if (vga_in.vcount > 330 & vga_in.vcount <410 & vga_in.hcount > 417 & vga_in.hcount < 427)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount> 390 & vga_in.vcount < 400 & vga_in.hcount > 427 & vga_in.hcount < 437 )begin
                rgb_nxt = PLAYER2_COLOR;
            end
             else if (vga_in.vcount> 380 & vga_in.vcount < 390 & vga_in.hcount > 437 & vga_in.hcount < 447 )begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount> 390 & vga_in.vcount < 400 & vga_in.hcount > 447 & vga_in.hcount < 457 )begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 330 & vga_in.vcount <410 & vga_in.hcount > 457 & vga_in.hcount < 467)begin
                rgb_nxt = PLAYER2_COLOR;
            end


            //I
            else if (vga_in.vcount > 330 & vga_in.vcount <410 & vga_in.hcount > 477 & vga_in.hcount <487)begin
                rgb_nxt = PLAYER2_COLOR;
            end


            //N
            else if (vga_in.vcount > 330 & vga_in.vcount <410 & vga_in.hcount > 497 & vga_in.hcount <507)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 340 & vga_in.vcount <360 & vga_in.hcount > 507 & vga_in.hcount <517)begin
                    rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 360 & vga_in.vcount <380 & vga_in.hcount > 517 & vga_in.hcount <527)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 380 & vga_in.vcount <400 & vga_in.hcount > 527 & vga_in.hcount <537)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 330 & vga_in.vcount <410 & vga_in.hcount > 537 & vga_in.hcount <547)begin
                rgb_nxt = PLAYER2_COLOR;
            end


            //S
            else if (vga_in.vcount > 330 & vga_in.vcount <340 & vga_in.hcount > 567 & vga_in.hcount <597)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 340 & vga_in.vcount <360 & vga_in.hcount > 557 & vga_in.hcount <567)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 360 & vga_in.vcount <370 & vga_in.hcount > 567 & vga_in.hcount <597)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 370 & vga_in.vcount <400 & vga_in.hcount > 597 & vga_in.hcount <607)begin
                rgb_nxt = PLAYER2_COLOR;
            end
             else if (vga_in.vcount > 400 & vga_in.vcount <410 & vga_in.hcount > 567 & vga_in.hcount <597)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 390 & vga_in.vcount <400 & vga_in.hcount > 557 & vga_in.hcount <567)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            


            //PLAYER 1

            //P
            else if (vga_in.vcount > 170 & vga_in.vcount <290 & vga_in.hcount > 307 & vga_in.hcount <317)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 170 & vga_in.vcount <185 & vga_in.hcount > 307 & vga_in.hcount <337)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 185 & vga_in.vcount <200 & vga_in.hcount > 337 & vga_in.hcount <347)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 200 & vga_in.vcount <230 & vga_in.hcount > 347 & vga_in.hcount <357)begin
                rgb_nxt = PLAYER2_COLOR;
            end
             else if (vga_in.vcount > 230 & vga_in.vcount <245 & vga_in.hcount > 337 & vga_in.hcount <347)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 245 & vga_in.vcount <260 & vga_in.hcount > 307 & vga_in.hcount <337)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            

            //L
            else if (vga_in.vcount > 170 & vga_in.vcount < 290 & vga_in.hcount > 367 & vga_in.hcount <377)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 275 & vga_in.vcount < 290 & vga_in.hcount > 367 & vga_in.hcount < 417 )begin
                rgb_nxt = PLAYER2_COLOR;
            end


            //A
            else if (vga_in.vcount > 185 & vga_in.vcount < 290 & vga_in.hcount > 427 & vga_in.hcount <437)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 185 & vga_in.vcount < 290 & vga_in.hcount > 467 & vga_in.hcount < 477 )begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 170 & vga_in.vcount < 185 & vga_in.hcount > 437 & vga_in.hcount <467)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 230 & vga_in.vcount < 245 & vga_in.hcount > 427 & vga_in.hcount < 477 )begin
                rgb_nxt = PLAYER2_COLOR;
            end


            //Y
            else if (vga_in.vcount > 170 & vga_in.vcount < 215 & vga_in.hcount > 487 & vga_in.hcount <497)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 170 & vga_in.vcount < 215 & vga_in.hcount > 527 & vga_in.hcount < 537 )begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 215 & vga_in.vcount < 230 & vga_in.hcount > 497 & vga_in.hcount <507)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 215 & vga_in.vcount < 230 & vga_in.hcount > 517 & vga_in.hcount < 527 )begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 230 & vga_in.vcount < 290  & vga_in.hcount > 507 & vga_in.hcount < 517 )begin
                rgb_nxt = PLAYER2_COLOR;
            end


            //E
            else if (vga_in.vcount > 170 & vga_in.vcount <290 & vga_in.hcount > 547 & vga_in.hcount <557)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 170 & vga_in.vcount <185 & vga_in.hcount > 547 & vga_in.hcount <597)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 275 & vga_in.vcount <290 & vga_in.hcount > 547 & vga_in.hcount <597)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 222 & vga_in.vcount <237 & vga_in.hcount > 547 & vga_in.hcount <587)begin
                rgb_nxt = PLAYER2_COLOR;
            end
        

            //R
            else if (vga_in.vcount > 170 & vga_in.vcount <290 & vga_in.hcount > 607 & vga_in.hcount <617)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 170 & vga_in.vcount <185 & vga_in.hcount > 607 & vga_in.hcount <637)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 185 & vga_in.vcount <200 & vga_in.hcount > 637 & vga_in.hcount <647)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 200 & vga_in.vcount <230 & vga_in.hcount > 647 & vga_in.hcount <657)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 230 & vga_in.vcount <245 & vga_in.hcount > 637 & vga_in.hcount <647)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 245 & vga_in.vcount <260 & vga_in.hcount > 607 & vga_in.hcount <637)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 260 & vga_in.vcount <275 & vga_in.hcount > 637 & vga_in.hcount <647)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 275 & vga_in.vcount <290 & vga_in.hcount > 647 & vga_in.hcount <657)begin
                rgb_nxt = PLAYER2_COLOR;
            end


            //1
            else if (vga_in.vcount > 170 & vga_in.vcount <185 & vga_in.hcount > 677 & vga_in.hcount <707)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 185 & vga_in.vcount <200 & vga_in.hcount > 667 & vga_in.hcount <677)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 185 & vga_in.vcount <215 & vga_in.hcount > 707 & vga_in.hcount <717)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 215 & vga_in.vcount <230 & vga_in.hcount > 697 & vga_in.hcount <707)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 230 & vga_in.vcount <245 & vga_in.hcount > 687 & vga_in.hcount <697)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 245 & vga_in.vcount <260 & vga_in.hcount > 677 & vga_in.hcount <687)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 260 & vga_in.vcount <290 & vga_in.hcount > 667 & vga_in.hcount <677)begin
                rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 275 & vga_in.vcount <290 & vga_in.hcount > 667 & vga_in.hcount <717)begin
                rgb_nxt = PLAYER2_COLOR;
            end

           
            //rectangle 


             else if (vga_in.vcount > 430 & vga_in.vcount <435 & vga_in.hcount > 237 & vga_in.hcount <787)begin
                rgb_nxt = 12'h0_0_f;
             end
             else if (vga_in.vcount > 430 & vga_in.vcount <530 & vga_in.hcount > 237 & vga_in.hcount <242)begin
                rgb_nxt = 12'h0_0_f;
             end
             else if (vga_in.vcount > 430 & vga_in.vcount <530 & vga_in.hcount > 782 & vga_in.hcount <787)begin
                rgb_nxt = 12'h0_0_f;
             end
             else if (vga_in.vcount > 525 & vga_in.vcount <530 & vga_in.hcount > 237 & vga_in.hcount <787)begin
                rgb_nxt = 12'h0_0_f;
             end
           

            //PLAY
            //P
            else if (vga_in.vcount > 450 & vga_in.vcount <510 & vga_in.hcount > 287 & vga_in.hcount <297)begin
                rgb_nxt = PLAYER1_COLOR;
             end
            else if (vga_in.vcount > 450 & vga_in.vcount <460 & vga_in.hcount > 287 & vga_in.hcount <317)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 460 & vga_in.vcount <480 & vga_in.hcount > 317 & vga_in.hcount <327)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 480 & vga_in.vcount <490 & vga_in.hcount > 287 & vga_in.hcount <317)begin
                rgb_nxt = PLAYER1_COLOR;
             end

             //L
             else if (vga_in.vcount > 450 & vga_in.vcount <510 & vga_in.hcount > 337 & vga_in.hcount <347)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 500 & vga_in.vcount <510 & vga_in.hcount > 337 & vga_in.hcount <377)begin
                rgb_nxt = PLAYER1_COLOR;
             end
            

            //A
            else if (vga_in.vcount > 460 & vga_in.vcount <510 & vga_in.hcount > 387 & vga_in.hcount <397)begin
                rgb_nxt = PLAYER1_COLOR;
             end
            else if (vga_in.vcount > 460 & vga_in.vcount <510 & vga_in.hcount > 417 & vga_in.hcount <427)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 450 & vga_in.vcount <460 & vga_in.hcount > 397 & vga_in.hcount <417)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 480 & vga_in.vcount <490 & vga_in.hcount > 387 & vga_in.hcount <427)begin
                rgb_nxt = PLAYER1_COLOR;
             end


             //Y
             else if (vga_in.vcount > 450 & vga_in.vcount <470 & vga_in.hcount > 437 & vga_in.hcount <447)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 470 & vga_in.vcount <480 & vga_in.hcount > 447 & vga_in.hcount <457)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 480 & vga_in.vcount <510 & vga_in.hcount > 457 & vga_in.hcount <467)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 470 & vga_in.vcount <480 & vga_in.hcount > 467 & vga_in.hcount <477)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 450 & vga_in.vcount <470 & vga_in.hcount > 477 & vga_in.hcount <487)begin
                rgb_nxt = PLAYER1_COLOR;
             end

             //AGAIN
             //A
            else if (vga_in.vcount > 460 & vga_in.vcount <510 & vga_in.hcount > 517 & vga_in.hcount <527)begin
                rgb_nxt = PLAYER1_COLOR;
             end
            else if (vga_in.vcount > 460 & vga_in.vcount <510 & vga_in.hcount > 547 & vga_in.hcount <557)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 450 & vga_in.vcount <460 & vga_in.hcount > 527 & vga_in.hcount <547)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 480 & vga_in.vcount <490 & vga_in.hcount > 517 & vga_in.hcount <557)begin
                rgb_nxt = PLAYER1_COLOR;
             end

            //G
            else if (vga_in.vcount > 450 & vga_in.vcount <510 & vga_in.hcount > 567 & vga_in.hcount <577)begin
                rgb_nxt = PLAYER1_COLOR;
             end
            else if (vga_in.vcount > 450 & vga_in.vcount <460 & vga_in.hcount > 567 & vga_in.hcount <607)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 500 & vga_in.vcount <510 & vga_in.hcount > 567 & vga_in.hcount <607)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 480 & vga_in.vcount <510 & vga_in.hcount > 597 & vga_in.hcount <607)begin
                rgb_nxt = PLAYER1_COLOR;
             end
              else if (vga_in.vcount > 480 & vga_in.vcount <490 & vga_in.hcount > 587 & vga_in.hcount <607)begin
                rgb_nxt = PLAYER1_COLOR;
             end

            //A
            else if (vga_in.vcount > 460 & vga_in.vcount <510 & vga_in.hcount > 617 & vga_in.hcount <627)begin
                rgb_nxt = PLAYER1_COLOR;
             end
            else if (vga_in.vcount > 460 & vga_in.vcount <510 & vga_in.hcount > 647 & vga_in.hcount <657)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 450 & vga_in.vcount <460 & vga_in.hcount > 627 & vga_in.hcount <647)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 480 & vga_in.vcount <490 & vga_in.hcount > 617 & vga_in.hcount <657)begin
                rgb_nxt = PLAYER1_COLOR;
             end

             //I
             else if (vga_in.vcount > 450 & vga_in.vcount <510 & vga_in.hcount > 667 & vga_in.hcount <677)begin
                rgb_nxt = PLAYER1_COLOR;
             end


             //N
            else if (vga_in.vcount > 450 & vga_in.vcount <510 & vga_in.hcount > 687 & vga_in.hcount <697)begin
                rgb_nxt = PLAYER1_COLOR;
             end
            else if (vga_in.vcount > 450 & vga_in.vcount <510 & vga_in.hcount > 727 & vga_in.hcount <737)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 460 & vga_in.vcount <470 & vga_in.hcount > 697 & vga_in.hcount <707)begin
                rgb_nxt = PLAYER1_COLOR;
             end
             else if (vga_in.vcount > 470 & vga_in.vcount <490 & vga_in.hcount > 707 & vga_in.hcount <717)begin
                rgb_nxt = PLAYER1_COLOR;
             end
              else if (vga_in.vcount > 490 & vga_in.vcount <500 & vga_in.hcount > 717 & vga_in.hcount <727)begin
                rgb_nxt = PLAYER1_COLOR;
             end
        
        else                                    // The rest of active display pixels:
            rgb_nxt = vga_in.rgb;               
    end
end
endmodule