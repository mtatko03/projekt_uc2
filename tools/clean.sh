#!/bin/bash
#
# Copyright (C) 2023  AGH University of Science and Technology
# MTM UEC2
# Author: Piotr Kaczmarczyk
#
# Modified by:
# 2024 AGH University of Science and Technology
# MTM UEC2
# Agnieszka Wroblewska, Magdalena Tatko
#
#
# Description:
# Remove untracked files from the project
# To work properly, a git repository in the project directory is required.
# Run from the project root directory.

git clean -fdX
