#!/bin/bash
#
# Copyright (C) 2023  AGH University of Science and Technology
# MTM UEC2
# Author: Piotr Kaczmarczyk
#
#
# Modified by:
# 2024 AGH University of Science and Technology
# MTM UEC2
# Agnieszka Wroblewska, Magdalena Tatko
#
# Description:
# Load a bitstream to a Xilinx FPGA using Vivado in tcl mode
# Run from the project root directory.


bitstream_file=$(find results -name "*.bit")

vivado -mode tcl -source fpga/scripts/program_fpga.tcl -tclargs "${bitstream_file}"
