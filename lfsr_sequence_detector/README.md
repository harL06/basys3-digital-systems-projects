# LFSR Sequence Detector

Verilog FPGA project for detecting a 5-bit codeword in a pseudo-random LFSR bitstream.

This project was developed as part of a Digital Systems Design module and implemented on a Digilent Basys 3 FPGA board using Vivado.

## Overview

The system uses an 18-bit linear-feedback shift register (LFSR) to generate a pseudo-random bitstream. One bit is passed to a Moore finite state machine each clock cycle, which detects the target codeword:

```text
10010
```

Each detection increments a binary counter. The result is shown on the Basys 3 seven-segment display, while the LFSR state is routed to the board LEDs for debugging and demonstration.

The FSM supports overlapping detections, so a sequence such as 10010010 is counted as two valid occurrences.

## Main components

- 18-bit LFSR
- Moore FSM sequence detector
- Binary detection counter
- Clock divider
- LED output multiplexer
- Seven-segment display controller
- Basys 3 XDC constraints

## Verification

The design was tested using Vivado simulation before being implemented on the Basys 3 board.

Testing included:

- LFSR full-cycle simulation
- FSM testbench with reset, non-matching, single detection, and repeated-detection cases
- Counter testbench
- Top-level system simulation
- Timing and utilisation checks
- Physical board demo

## Report

The `docs/` folder contains the original report submitted for the Digital Systems Design module.
The report covers the system architecture, LFSR design, FSM design, counter design, simulation results, timing/utilisation reports, and Basys 3 board demonstration.
