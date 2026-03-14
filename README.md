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

