/**
 *  Copyright (C) 2023  AGH University of Science and Technology
 * MTM UEC2
 * Author: Piotr Kaczmarczyk
 *
 * Description:
 * Testbench for vga_timing module.
 */

`timescale 1 ns / 1 ps

module vga_timing_tb;

import vga_pkg::*;


/**
 *  Local parameters
 */

localparam CLK_PERIOD = 15.385;     // 65 MHz


/**
 * Local variables and signals
 */

logic clk;
logic rst;

vga_if if_tb();

/**
 * Clock generation
 */

initial begin
    clk = 1'b0;
    forever #(CLK_PERIOD/2) clk = ~clk;
end


/**
 * Reset generation
 */

initial begin
                       rst = 1'b0;
    #(1.25*CLK_PERIOD) rst = 1'b1;
                       rst = 1'b1;
    #(2.00*CLK_PERIOD) rst = 1'b0;
end


/**
 * Dut placement
 */

vga_timing dut(
    .clk,
    .rst,
    .vga_out (if_tb)
);

/**
 * Tasks and functions
 */
task afterreset();
    begin 
        assert (vga_if.hcount == 0 && vga_if.vcount == 0);
    end
endtask
 // Here you can declare tasks with immediate assertions (assert).


/**
 * Assertions
 */

// Here you can declare concurrent assertions (assert property).
/**
 * Main test
 */

initial begin
    @(posedge rst);
    @(negedge rst);

    wait (vga_if.vsync == 1'b0);
    @(negedge vga_if.vsync)
    @(negedge vga_if.vsync)

    $finish;
end

endmodule
