
package game_pkg;
import vga_pkg::*;


typedef enum {
    START,
    GAME,
    PLAYER1_WIN,
    PLAYER2_WIN,
    GAME_OVER
}game_mode;

typedef enum{
    WAIT, 
    RIGHT,
    LEFT,
    UP,
    DOWN
}directions;

typedef enum {
    EMPTY,
    PLAYER1,
    PLAYER2,
    FRAME
}tile;

logic [7:0] current_x_1, current_x_1_nxt;
logic [7:0] current_y_1, current_y_1_nxt;
logic [7:0] prev_x_1, prev_y_1;

logic [7:0] current_x_2, current_x_2_nxt;
logic [7:0] current_y_2, current_y_2_nxt;
logic [7:0] prev_x_2, prev_y_2;


// Pozycja startowa
logic [7:0] start_x_1= 10;
logic [7:0] start_y_1 = 18;

logic [7:0] start_x_2 = 30;
logic [7:0] start_y_2 = 40;

//mapa
localparam MAP_WIDTH = 64;
localparam MAP_HEIGHT = 48;

tile map [MAP_WIDTH][MAP_HEIGHT];
directions current_direction, nxt_direction;

localparam SIZE=HOR_PIXELS/MAP_WIDTH;


    // Koordynaty prostokąta "Play Again"
localparam RECT_X_MIN = 237; // Przykładowa wartość
localparam RECT_X_MAX = 787; // Przykładowa wartość
localparam RECT_Y_MIN = 430; // Przykładowa wartość
localparam RECT_Y_MAX = 530; // Przykładowa wartość

// Koordynaty prostokąta "Play"
localparam PLAY_X_MIN = 282; // Przykładowa wartość
localparam PLAY_X_MAX = 742; // Przykładowa wartość
localparam PLAY_Y_MIN = 330; // Przykładowa wartość
localparam PLAY_Y_MAX = 450; // Przykładowa wartość


//kolory
localparam EMPTY_COLOR   = 12'h0_0_0;
localparam PLAYER1_COLOR = 12'hf_0_f;
localparam PLAYER2_COLOR = 12'h0_f_0;
localparam FRAME_COLOR   = 12'h0_0_f;

endpackage
