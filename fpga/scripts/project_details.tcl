# Copyright (C) 2023  AGH University of Science and Technology
# MTM UEC2
# Author: Piotr Kaczmarczyk
#
# Description:
# Project detiles required for generate_bitstream.tcl
# Make sure that project_name, top_module and target are correct.
# Provide paths to all the files required for synthesis and implementation.
# Depending on the file type, it should be added in the corresponding section.
# If the project does not use files of some type, leave the corresponding section commented out.

#-----------------------------------------------------#
#                   Project details                   #
#-----------------------------------------------------#
# Project name                                  -- EDIT
set project_name vga_project

# Top module name                               -- EDIT
set top_module top_vga_basys3

# FPGA device
set target xc7a35tcpg236-1

#-----------------------------------------------------#
#                    Design sources                   #
#-----------------------------------------------------#
# Specify .xdc files location                   -- EDIT
set xdc_files {
    constraints/top_vga_basys3.xdc
}

# Specify SystemVerilog design files location   -- EDIT
set sv_files {
    ../rtl/vga/vga_pkg.sv
    ../rtl/vga/vga_if.sv
    ../rtl/vga/vga_timing.sv
    ../rtl/game_pkg.sv
    ../rtl/gamemode_control.sv
    ../rtl/draw/draw_main.sv
    ../rtl/draw/draw_start.sv
    ../rtl/draw/draw_player1_win.sv 
    ../rtl/draw/draw_player2_win.sv
    ../rtl/draw/draw_map.sv
    ../rtl/draw/draw_mouse.sv
    ../rtl/top_vga.sv
    ../rtl/control.sv
    ../rtl/map_control.sv
    ../rtl/direction_control.sv
    ../rtl/uart/uart.sv
    ../rtl/uart/uart_rx.sv
    ../rtl/uart/uart_tx.sv
    ../rtl/uart/mod_m_counter.sv
    ../rtl/uart/fifo.sv
    ../rtl/uart/uart_encoder.sv 
    ../rtl/uart/uart_decoder.sv
    ../rtl/player_selector.sv
    ../rtl/mux.sv
    rtl/top_vga_basys3.sv
}

#Specify Verilog design files location         -- EDIT
set verilog_files {
    rtl/clk_wiz_0_clk_wiz.v
    rtl/clk_wiz_0.v
}

# Specify VHDL design files location            -- EDIT
 set vhdl_files {
    ../rtl/mouse/MouseCtl.vhd
    ../rtl/mouse/Ps2Interface.vhd
    ../rtl/mouse/MouseDisplay.vhd
}

# Specify files for a memory initialization     -- EDIT
# set mem_files {
#    path/to/file.data
# }
