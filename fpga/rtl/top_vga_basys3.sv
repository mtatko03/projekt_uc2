/**
 * San Jose State University
 * EE178 Lab #4
 * Author: prof. Eric Crabilla
 *
 * Modified by:
 * 2023  AGH University of Science and Technology
 * MTM UEC2
 * Piotr Kaczmarczyk
 *
 * Description:
 * Top level synthesizable module including the project top and all the FPGA-referred modules.
 */

 `timescale 1 ns / 1 ps

 module top_vga_basys3 (
     input  wire clk,
     input  wire btnC,
     output wire Vsync,
     output wire Hsync,
     inout  PS2Clk,
     inout  PS2Data,
     input  wire JA2, //rx
     output wire JA3, //tx
     output wire [3:0] vgaRed,
     output wire [3:0] vgaGreen,
     output wire [3:0] vgaBlue,
     output wire JA1
 );
 
 
 /**
  * Local variables and signals
  */
 
 wire locked;
 wire clk975MHz;
 wire clk65MHz;
 wire pclk_mirror;
 
 (* KEEP = "TRUE" *)
 (* ASYNC_REG = "TRUE" *)
 logic [7:0] safe_start = 0;
 // For details on synthesis attributes used above, see AMD Xilinx UG 901:
 // https://docs.xilinx.com/r/en-US/ug901-vivado-synthesis/Synthesis-Attributes
 
 
 /**
  * Signals assignments
  */
 
 assign JA1 = pclk_mirror;
 
 
 /**
  * FPGA submodules placement
  */
 
 
 // Mirror pclk on a pin for use by the testbench;
 // not functionally required for this design to work.
 
 clk_wiz_0 u_clk_wiz_0 (
     .clk(clk),
     .clk975MHz(clk975MHz),
     .clk65MHz(clk65MHz),
     .locked(locked)
 );
 
 
 
 ODDR pclk_oddr (
     .Q(pclk_mirror),
     .C(clk65MHz),
     .CE(1'b1),
     .D1(1'b1),
     .D2(1'b0),
     .R(1'b0),
     .S(1'b0)
 );
 
 
 /**
  *  Project functional top module
  */
 
 top_vga u_top_vga (
     .clk65MHz,
     .clk975MHz,
     .ps2_data(PS2Data),
     .ps2_clk(PS2Clk),
     .rst(btnC),
     .r(vgaRed),
     .g(vgaGreen),
     .b(vgaBlue),
     .hs(Hsync),
     .vs(Vsync),
     .rx(JA2),
     .tx(JA3)
 );
 
 endmodule