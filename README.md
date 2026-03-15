# Verilog Vending Machine Controller (FSM)

This project implements a Finite State Machine (FSM) based vending machine controller using Verilog. The system accepts ₹5 and ₹10 coins and dispenses a product costing ₹15. It also returns appropriate change when excess money is inserted.

## Features
- Accepts ₹5 and ₹10 coins
- Dispenses product when ₹15 is reached
- Returns change for overpayment
- Returns inserted money if transaction is incomplete
- Fully verified using a Verilog testbench

## System Design

The vending machine is implemented using a Finite State Machine with three states representing the amount of money currently inserted.

States:

S0 → ₹0 inserted  
S1 → ₹5 inserted  
S2 → ₹10 inserted  

When the inserted amount reaches ₹15, the machine dispenses the product.

## State Transitions

| Current State | Input | Next State | Output | Change |
|---------------|------|-----------|-------|-------|
| S0 | 5 | S1 | 0 | 0 |
| S0 | 10 | S2 | 0 | 0 |
| S1 | 5 | S2 | 0 | 0 |
| S1 | 10 | S0 | 1 | 0 |
| S2 | 5 | S0 | 1 | 0 |
| S2 | 10 | S0 | 1 | ₹5 |

## Inputs

clk : system clock
rst : reset signal
in : coin input
01 → ₹5
10 → ₹10


## Outputs

out : product dispense signal
change : change returned

## Simulation

The design was verified using a Verilog testbench which simulates multiple transaction scenarios such as:

- inserting ₹5 three times
- inserting ₹5 followed by ₹10
- inserting ₹10 twice
- incomplete transactions

Simulation waveform confirms correct state transitions and outputs.

## Tools Used

- Verilog HDL
- Xilinx Vivado Simulator

## Concepts Used

- Finite State Machines (FSM)
- Sequential logic
- State transition design
- Verilog RTL modeling
- Testbench based verification

## Author
Laxmi Sathvika Chenna
