
package game_pkg;
import vga_pkg::*;


typedef enum {
    START,
    GAME,
    PLAYER1_WIN,
    PLAYER2_WIN
}game_mode;

typedef enum {
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

//mapa
localparam MAP_WIDTH = 64;
localparam MAP_HEIGHT = 48;

tile map [MAP_WIDTH][MAP_HEIGHT];

localparam SIZE=HOR_PIXELS/MAP_WIDTH;

//kolory
localparam EMPTY_COLOR   = 12'h0_0_0;
localparam PLAYER1_COLOR = 12'hf_0_f;
localparam PLAYER2_COLOR = 12'h0_f_0;
localparam FRAME_COLOR   = 12'h0_0_f;

endpackage
