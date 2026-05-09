# 6-bit Mini ALU

Verilog FPGA project implementing a small 6-bit arithmetic logic unit on a Digilent Basys 3 board.

This project was developed as part of a Digital Systems Design module and implemented using Vivado.

## Overview

The ALU takes two 6-bit two's complement inputs, `A` and `B`, and produces a 6-bit output `X`.

A 3-bit function input, `FXN`, selects which operation is routed to the output. The design is built from smaller sub-modules, with the top-level ALU acting as a structural wrapper around the individual arithmetic and logic blocks.

## Implemented operations

- Pass through `A`
- Pass through `B`
- Negate `A`
- Negate `B`
- Signed less-than comparison
- Bitwise XNOR
- Addition
- Subtraction

## Main components

- 6-bit ripple adder
- Add/subtract logic
- Two's complement negation
- Signed less-than comparator
- Bitwise XNOR module
- 8-to-1 output multiplexer
- Basys 3 switch/LED constraints

## Verification

The design was tested using Vivado behavioural simulation before being implemented on the Basys 3 board.

Testing included:

- XNOR module testbench
- 2-bit comparator testbench
- 6-bit signed comparator testbench
- Integrated ALU testbench
- Addition/subtraction overflow behaviour
- FPGA implementation and physical board demo

The final design was mapped to the Basys 3 board, with switches used for the input values and operation select, and LEDs used to display the ALU output.

## Report

The `docs/` folder contains the original report submitted for the Digital Systems Design module.

The report covers the ALU design strategy, submodule development, simulation results, FPGA implementation, I/O pin mapping, resource usage, and Basys 3 board demonstration.
