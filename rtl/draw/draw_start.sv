/**
 * Author: Magdalena Tatko
 * MTM UEC2
 * Description: draws the game's start screen
*/ 

`timescale 1 ns / 1 ps
 
import game_pkg::*;
import vga_pkg::*;

module draw_start
   #(  parameter PLAYER1_COLOR = 12'hf_0_f

       )(
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
   if (vga_in.vblnk || vga_in.hblnk) begin               // Blanking region:
       rgb_nxt = 12'h0_0_0;                              // - make it it black.
   end else begin                                        // Active region:
       if (vga_in.vcount == 0)                           // - top edge:
           rgb_nxt = FRAME_COLOR;                
       else if (vga_in.vcount == VER_PIXELS - 1)         // - bottom edge:
           rgb_nxt = FRAME_COLOR;                
       else if (vga_in.hcount == 0)                      // - left edge:
           rgb_nxt = FRAME_COLOR;                
       else if (vga_in.hcount == HOR_PIXELS - 1)         // - right edge:
           rgb_nxt = FRAME_COLOR;                


       //LINE
           //L
           else if (vga_in.vcount > 60 & vga_in.vcount <140 & vga_in.hcount > 302 & vga_in.hcount < 312)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount> 130 & vga_in.vcount < 140 & vga_in.hcount > 302 & vga_in.hcount < 342 )begin
               rgb_nxt = PLAYER1_COLOR;
           end


           //I
           else if (vga_in.vcount > 60 & vga_in.vcount <140 & vga_in.hcount > 352 & vga_in.hcount <362)begin
               rgb_nxt = PLAYER1_COLOR;
           end


           //N
           else if (vga_in.vcount > 60 & vga_in.vcount <140 & vga_in.hcount > 372 & vga_in.hcount <382)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 60 & vga_in.vcount <140 & vga_in.hcount > 412 & vga_in.hcount <422)begin
                   rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 76 & vga_in.vcount <92 & vga_in.hcount > 382 & vga_in.hcount <392)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 92 & vga_in.vcount <108 & vga_in.hcount > 392 & vga_in.hcount <402)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 108 & vga_in.vcount <124 & vga_in.hcount > 402 & vga_in.hcount <412)begin
               rgb_nxt = PLAYER1_COLOR;
           end


           //E
           else if (vga_in.vcount > 60 & vga_in.vcount <140 & vga_in.hcount > 432 & vga_in.hcount <442)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 60 & vga_in.vcount <70 & vga_in.hcount > 432 & vga_in.hcount <472)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 130 & vga_in.vcount <140 & vga_in.hcount > 432 & vga_in.hcount <472)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 95 & vga_in.vcount <105 & vga_in.hcount > 432 & vga_in.hcount <462)begin
               rgb_nxt = PLAYER1_COLOR;
           end

           
           //RUSH
           //R
           else if (vga_in.vcount > 60 & vga_in.vcount <140 & vga_in.hcount > 522 & vga_in.hcount <532)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 60 & vga_in.vcount <70 & vga_in.hcount > 522 & vga_in.hcount <542)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 70 & vga_in.vcount <80 & vga_in.hcount > 542 & vga_in.hcount <552)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 80 & vga_in.vcount <100 & vga_in.hcount > 552 & vga_in.hcount <562)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 100 & vga_in.vcount <110 & vga_in.hcount > 542 & vga_in.hcount <552)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 110 & vga_in.vcount <120 & vga_in.hcount > 522 & vga_in.hcount <542)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 120 & vga_in.vcount <130 & vga_in.hcount > 542 & vga_in.hcount <552)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 130 & vga_in.vcount <140 & vga_in.hcount > 552 & vga_in.hcount <562)begin
               rgb_nxt = PLAYER1_COLOR;
           end


           //U
           else if (vga_in.vcount > 60 & vga_in.vcount <130 & vga_in.hcount > 572 & vga_in.hcount <582)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 130 & vga_in.vcount <140 & vga_in.hcount > 582 & vga_in.hcount <612)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 60 & vga_in.vcount <130 & vga_in.hcount > 612 & vga_in.hcount <622)begin
               rgb_nxt = PLAYER1_COLOR;
           end


           //S
           else if (vga_in.vcount > 60 & vga_in.vcount <70 & vga_in.hcount > 642 & vga_in.hcount <662)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 70 & vga_in.vcount <90 & vga_in.hcount > 632 & vga_in.hcount <642)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 70 & vga_in.vcount <80 & vga_in.hcount > 662 & vga_in.hcount <672)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 90 & vga_in.vcount <100 & vga_in.hcount > 642 & vga_in.hcount <662)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 100 & vga_in.vcount <130 & vga_in.hcount > 662 & vga_in.hcount <672)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 130 & vga_in.vcount <140 & vga_in.hcount > 642 & vga_in.hcount <662)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 120 & vga_in.vcount <130 & vga_in.hcount > 632 & vga_in.hcount <642)begin
               rgb_nxt = PLAYER1_COLOR;
           end


           //H
           else if (vga_in.vcount > 60 & vga_in.vcount <140 & vga_in.hcount > 682 & vga_in.hcount <692)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 60 & vga_in.vcount <140 & vga_in.hcount > 712 & vga_in.hcount <722)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           else if (vga_in.vcount > 95 & vga_in.vcount <105 & vga_in.hcount > 682 & vga_in.hcount <722)begin
               rgb_nxt = PLAYER1_COLOR;
           end
           

           //2 PLAYERS GAME
           //2
           else if (vga_in.vcount > 160 & vga_in.vcount <165 & vga_in.hcount >334 & vga_in.hcount <349)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165  & vga_in.vcount <170 & vga_in.hcount > 329 & vga_in.hcount <334)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount <175 & vga_in.hcount > 349 & vga_in.hcount <354)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 175 & vga_in.vcount <180 & vga_in.hcount > 344 & vga_in.hcount <349)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 180 & vga_in.vcount <185 & vga_in.hcount > 339 & vga_in.hcount <344)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 185 & vga_in.vcount <190 & vga_in.hcount > 334 & vga_in.hcount <339)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 190 & vga_in.vcount <200 & vga_in.hcount > 329 & vga_in.hcount <334)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 195 & vga_in.vcount <200 & vga_in.hcount >329  & vga_in.hcount <354)begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //P
           else if (vga_in.vcount > 160 & vga_in.vcount <200 & vga_in.hcount > 369 & vga_in.hcount <374)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount <165 & vga_in.hcount > 369 & vga_in.hcount <384)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount <170 & vga_in.hcount > 384 & vga_in.hcount <389)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 170 & vga_in.vcount <180 & vga_in.hcount > 389 & vga_in.hcount <394)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 180 & vga_in.vcount <185 & vga_in.hcount > 384 & vga_in.hcount <389)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 185 & vga_in.vcount <190 & vga_in.hcount > 369 & vga_in.hcount <384)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           

           //L
           else if (vga_in.vcount > 160 & vga_in.vcount < 200 & vga_in.hcount > 399 & vga_in.hcount <404)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 195 & vga_in.vcount < 200 & vga_in.hcount > 399 & vga_in.hcount < 424 )begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //A
           else if (vga_in.vcount > 165 & vga_in.vcount < 200 & vga_in.hcount > 429 & vga_in.hcount <434)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount < 200 & vga_in.hcount > 449 & vga_in.hcount < 454 )begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount < 165 & vga_in.hcount > 434 & vga_in.hcount <449)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 180 & vga_in.vcount < 185 & vga_in.hcount > 429 & vga_in.hcount < 454 )begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //Y
           else if (vga_in.vcount > 175 & vga_in.vcount < 200 & vga_in.hcount > 469 & vga_in.hcount <474)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 170 & vga_in.vcount < 175 & vga_in.hcount > 464 & vga_in.hcount < 469 )begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 170 & vga_in.vcount < 175 & vga_in.hcount > 474 & vga_in.hcount <479)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount < 170 & vga_in.hcount > 459 & vga_in.hcount < 464 )begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount < 170 & vga_in.hcount > 479 & vga_in.hcount < 484 )begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //E
           else if (vga_in.vcount > 160 & vga_in.vcount <200 & vga_in.hcount > 489 & vga_in.hcount <494)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount <165 & vga_in.hcount > 489 & vga_in.hcount <514)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 195 & vga_in.vcount <200 & vga_in.hcount > 489 & vga_in.hcount <514)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 175 & vga_in.vcount <180 & vga_in.hcount > 489 & vga_in.hcount <509)begin
               rgb_nxt = PLAYER2_COLOR;
           end
       

           //R
           else if (vga_in.vcount > 160 & vga_in.vcount <200 & vga_in.hcount > 519 & vga_in.hcount <524)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount <165 & vga_in.hcount > 519 & vga_in.hcount <534)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount <170 & vga_in.hcount > 534 & vga_in.hcount <539)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 170 & vga_in.vcount <180 & vga_in.hcount > 539 & vga_in.hcount <544)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 180 & vga_in.vcount <185 & vga_in.hcount > 534 & vga_in.hcount <539)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 185 & vga_in.vcount <190 & vga_in.hcount > 519 & vga_in.hcount <534)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 190 & vga_in.vcount <195 & vga_in.hcount > 534 & vga_in.hcount <539)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 195 & vga_in.vcount <200 & vga_in.hcount > 539 & vga_in.hcount <544)begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //S
           else if (vga_in.vcount > 160 & vga_in.vcount <165 & vga_in.hcount > 554 & vga_in.hcount <569)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount <170 & vga_in.hcount > 569 & vga_in.hcount <574)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount <180 & vga_in.hcount > 549 & vga_in.hcount <554)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 180 & vga_in.vcount <185 & vga_in.hcount > 554 & vga_in.hcount <569)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 185 & vga_in.vcount <195 & vga_in.hcount > 569 & vga_in.hcount <574)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 195 & vga_in.vcount <200 & vga_in.hcount > 554 & vga_in.hcount <569)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 190 & vga_in.vcount <195 & vga_in.hcount > 549 & vga_in.hcount <554)begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //GAME
           //G
           else if (vga_in.vcount > 160 & vga_in.vcount <200 & vga_in.hcount > 599 & vga_in.hcount <604)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount <165 & vga_in.hcount > 599 & vga_in.hcount <624)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 195 & vga_in.vcount <200 & vga_in.hcount > 599 & vga_in.hcount <624)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 180 & vga_in.vcount <185 & vga_in.hcount > 609 & vga_in.hcount <624)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 180 & vga_in.vcount <200 & vga_in.hcount > 619 & vga_in.hcount <624)begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //A
           else if (vga_in.vcount > 165 & vga_in.vcount < 200 & vga_in.hcount > 629 & vga_in.hcount <634)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount < 200 & vga_in.hcount > 649 & vga_in.hcount < 654 )begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount < 165 & vga_in.hcount > 634 & vga_in.hcount <649)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 180 & vga_in.vcount < 185 & vga_in.hcount > 629 & vga_in.hcount < 654)begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //M
           else if (vga_in.vcount > 160 & vga_in.vcount < 200 & vga_in.hcount > 659 & vga_in.hcount <664)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount < 200 & vga_in.hcount > 679 & vga_in.hcount < 684 )begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount < 170 & vga_in.hcount > 664 & vga_in.hcount <669)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 165 & vga_in.vcount < 170 & vga_in.hcount > 674 & vga_in.hcount < 679)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 170 & vga_in.vcount < 175 & vga_in.hcount >669 & vga_in.hcount < 674)begin
               rgb_nxt = PLAYER2_COLOR;
           end


           //E
           else if (vga_in.vcount > 160 & vga_in.vcount <200 & vga_in.hcount > 689 & vga_in.hcount <694)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 160 & vga_in.vcount <165 & vga_in.hcount > 689 & vga_in.hcount <714)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 195 & vga_in.vcount <200 & vga_in.hcount > 689 & vga_in.hcount <714)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           else if (vga_in.vcount > 175 & vga_in.vcount <180 & vga_in.hcount > 689 & vga_in.hcount <709)begin
               rgb_nxt = PLAYER2_COLOR;
           end
           

           //rectangle 1


            else if (vga_in.vcount > 330 & vga_in.vcount <335 & vga_in.hcount > 282 & vga_in.hcount <742)begin
               rgb_nxt = FRAME_COLOR;
            end
            else if (vga_in.vcount > 330 & vga_in.vcount <450 & vga_in.hcount > 282 & vga_in.hcount <287)begin
               rgb_nxt = FRAME_COLOR;
            end
            else if (vga_in.vcount > 330 & vga_in.vcount <450 & vga_in.hcount > 737 & vga_in.hcount <742)begin
               rgb_nxt = FRAME_COLOR;
            end
            else if (vga_in.vcount > 445 & vga_in.vcount <450 & vga_in.hcount > 282 & vga_in.hcount <742)begin
               rgb_nxt = FRAME_COLOR;
            end
           

           //rectangle 2


            else if (vga_in.vcount > 480 & vga_in.vcount <485 & vga_in.hcount > 282 & vga_in.hcount <742)begin
               rgb_nxt = FRAME_COLOR;
            end
            else if (vga_in.vcount > 480 & vga_in.vcount <600 & vga_in.hcount > 282 & vga_in.hcount <287)begin
               rgb_nxt = FRAME_COLOR;
            end
            else if (vga_in.vcount > 480 & vga_in.vcount <600 & vga_in.hcount > 737 & vga_in.hcount <742)begin
               rgb_nxt = FRAME_COLOR;
            end
            else if (vga_in.vcount > 595 & vga_in.vcount <600 & vga_in.hcount > 282 & vga_in.hcount <742)begin
               rgb_nxt = FRAME_COLOR;
            end

           //PLAYER1
           //P
           else if (vga_in.vcount > 360 & vga_in.vcount <370 & vga_in.hcount > 327 & vga_in.hcount <357)begin
               rgb_nxt = PLAYER1_COLOR;
            end
           else if (vga_in.vcount > 360 & vga_in.vcount <420 & vga_in.hcount > 327 & vga_in.hcount <337)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 390 & vga_in.vcount <400 & vga_in.hcount > 327 & vga_in.hcount <357)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 370 & vga_in.vcount <390 & vga_in.hcount > 357 & vga_in.hcount <367)begin
               rgb_nxt = PLAYER1_COLOR;
            end
       
            //L
            else if (vga_in.vcount > 360 & vga_in.vcount <420 & vga_in.hcount > 377 & vga_in.hcount <387)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 410 & vga_in.vcount <420 & vga_in.hcount > 377 & vga_in.hcount <417)begin
               rgb_nxt = PLAYER1_COLOR;
            end
           

           //A
           else if (vga_in.vcount > 370 & vga_in.vcount <420 & vga_in.hcount > 427 & vga_in.hcount <437)begin
               rgb_nxt = PLAYER1_COLOR;
            end
           else if (vga_in.vcount > 360 & vga_in.vcount <370 & vga_in.hcount > 437 & vga_in.hcount <457)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 390 & vga_in.vcount <400 & vga_in.hcount > 427 & vga_in.hcount <467)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 370 & vga_in.vcount <420 & vga_in.hcount > 457 & vga_in.hcount <467)begin
               rgb_nxt = PLAYER1_COLOR;
            end


            //Y
            else if (vga_in.vcount > 360 & vga_in.vcount <380 & vga_in.hcount > 477 & vga_in.hcount <487)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 380 & vga_in.vcount <390 & vga_in.hcount > 487 & vga_in.hcount <497)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 390 & vga_in.vcount <420 & vga_in.hcount > 497 & vga_in.hcount <507)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 380 & vga_in.vcount <390 & vga_in.hcount > 507 & vga_in.hcount <517)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 360 & vga_in.vcount <380 & vga_in.hcount > 517 & vga_in.hcount <527)begin
               rgb_nxt = PLAYER1_COLOR;
            end


            //E
            else if (vga_in.vcount > 360 & vga_in.vcount <420 & vga_in.hcount > 537 & vga_in.hcount <547)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 360 & vga_in.vcount <370 & vga_in.hcount > 537 & vga_in.hcount <577)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 380 & vga_in.vcount <390 & vga_in.hcount > 537 & vga_in.hcount <567)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 410 & vga_in.vcount <420 & vga_in.hcount > 537 & vga_in.hcount <577)begin
               rgb_nxt = PLAYER1_COLOR;
            end

            //R
            else if (vga_in.vcount > 360 & vga_in.vcount <420 & vga_in.hcount > 587 & vga_in.hcount <597)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 360 & vga_in.vcount <370 & vga_in.hcount > 587 & vga_in.hcount <617)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 370 & vga_in.vcount <390 & vga_in.hcount > 617 & vga_in.hcount <627)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 390 & vga_in.vcount <400 & vga_in.hcount > 587 & vga_in.hcount <617)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 400 & vga_in.vcount <420 & vga_in.hcount > 617 & vga_in.hcount <627)begin
               rgb_nxt = PLAYER1_COLOR;
            end

            //1
            else if (vga_in.vcount > 410 & vga_in.vcount <420 & vga_in.hcount > 647 & vga_in.hcount <697)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 360 & vga_in.vcount <420 & vga_in.hcount > 667 & vga_in.hcount <677)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 370 & vga_in.vcount <380 & vga_in.hcount > 657 & vga_in.hcount <667)begin
               rgb_nxt = PLAYER1_COLOR;
            end
            else if (vga_in.vcount > 380 & vga_in.vcount <390 & vga_in.hcount > 647 & vga_in.hcount <657)begin
               rgb_nxt = PLAYER1_COLOR;
            end



            //PLAYER2
           //P
           else if (vga_in.vcount >510 & vga_in.vcount <520 & vga_in.hcount > 327 & vga_in.hcount <357)begin
               rgb_nxt = PLAYER2_COLOR;
            end
           else if (vga_in.vcount > 510 & vga_in.vcount <570 & vga_in.hcount > 327 & vga_in.hcount <337)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 540 & vga_in.vcount <550 & vga_in.hcount > 327 & vga_in.hcount <357)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 520 & vga_in.vcount <540 & vga_in.hcount > 357 & vga_in.hcount <367)begin
               rgb_nxt = PLAYER2_COLOR;
            end
       
            //L
            else if (vga_in.vcount > 510 & vga_in.vcount <570 & vga_in.hcount > 377 & vga_in.hcount <387)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 560 & vga_in.vcount <570 & vga_in.hcount > 377 & vga_in.hcount <417)begin
               rgb_nxt = PLAYER2_COLOR;
            end
           

           //A
           else if (vga_in.vcount > 520 & vga_in.vcount <570 & vga_in.hcount > 427 & vga_in.hcount <437)begin
               rgb_nxt = PLAYER2_COLOR;
            end
           else if (vga_in.vcount > 510 & vga_in.vcount <520 & vga_in.hcount > 437 & vga_in.hcount <457)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 540 & vga_in.vcount <550 & vga_in.hcount > 427 & vga_in.hcount <467)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 520 & vga_in.vcount <570 & vga_in.hcount > 457 & vga_in.hcount <467)begin
               rgb_nxt = PLAYER2_COLOR;
            end


            //Y
            else if (vga_in.vcount > 510 & vga_in.vcount <530 & vga_in.hcount > 477 & vga_in.hcount <487)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 530 & vga_in.vcount <540 & vga_in.hcount > 487 & vga_in.hcount <497)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 540 & vga_in.vcount <570 & vga_in.hcount > 497 & vga_in.hcount <507)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 530 & vga_in.vcount <540 & vga_in.hcount > 507 & vga_in.hcount <517)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 510 & vga_in.vcount <530 & vga_in.hcount > 517 & vga_in.hcount <527)begin
               rgb_nxt = PLAYER2_COLOR;
            end


            //E
            else if (vga_in.vcount > 510 & vga_in.vcount <570 & vga_in.hcount > 537 & vga_in.hcount <547)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 510 & vga_in.vcount <520 & vga_in.hcount > 537 & vga_in.hcount <577)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 530 & vga_in.vcount <540 & vga_in.hcount > 537 & vga_in.hcount <567)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 560 & vga_in.vcount <570 & vga_in.hcount > 537 & vga_in.hcount <577)begin
               rgb_nxt = PLAYER2_COLOR;
            end

            //R
            else if (vga_in.vcount > 510 & vga_in.vcount <570 & vga_in.hcount > 587 & vga_in.hcount <597)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 510 & vga_in.vcount <520 & vga_in.hcount > 587 & vga_in.hcount <617)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 520 & vga_in.vcount <540 & vga_in.hcount > 617 & vga_in.hcount <627)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 540 & vga_in.vcount <550 & vga_in.hcount > 587 & vga_in.hcount <617)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 550 & vga_in.vcount <570 & vga_in.hcount > 617 & vga_in.hcount <627)begin
               rgb_nxt = PLAYER2_COLOR;
            end

            //2
            else if (vga_in.vcount > 560 & vga_in.vcount <570 & vga_in.hcount > 647 & vga_in.hcount <697)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 550 & vga_in.vcount <560 & vga_in.hcount > 657 & vga_in.hcount <667)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 540 & vga_in.vcount <550 & vga_in.hcount > 667 & vga_in.hcount <677)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 530 & vga_in.vcount <540 & vga_in.hcount > 677 & vga_in.hcount <687)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 520 & vga_in.vcount <530 & vga_in.hcount > 687 & vga_in.hcount <697)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 510 & vga_in.vcount <520 & vga_in.hcount > 657 & vga_in.hcount <687)begin
               rgb_nxt = PLAYER2_COLOR;
            end
            else if (vga_in.vcount > 520 & vga_in.vcount <530 & vga_in.hcount > 647 & vga_in.hcount <657)begin
               rgb_nxt = PLAYER2_COLOR;
            end



       else                                    
           rgb_nxt = vga_in.rgb;                  
   end
end
endmodule