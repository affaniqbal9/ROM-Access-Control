![Verilog](https://img.shields.io/badge/Verilog-HDL-blue?logo=verilog)
![Quartus](https://img.shields.io/badge/Intel-Quartus-green?logo=intel)
![ModelSim](https://img.shields.io/badge/ModelSim-Simulation-orange)
![FPGA](https://img.shields.io/badge/DE10-FPGA-blueviolet)
![Status](https://img.shields.io/badge/Status-Working-brightgreen)

# ROM-Based Access Control System (FPGA)

This project implements a complete access control system on the DE10 FPGA using a ROM‑stored password and an LFSR‑based 1 ms timer. The system authenticates a user through a 4‑digit password, manages access through a hardware FSM, and integrates timing and random number generation modules for game functionality.

## Features
- **ROM‑stored password** for secure authentication  
- **Access Control FSM** that validates each digit sequentially  
- **LFSR‑based 1 ms timer** for efficient hardware timing  
- **Random number generator** for game logic  
- **Modular Verilog design** suitable for FPGA implementation  

## Folder Structure
- **src/** – Verilog modules and testbenches  
- **sim_lfsr/** – LFSR timer simulation files  
- **sim_rom/** – ROM access controller simulation files  
- **syn/** – Quartus project, pin assignments, and synthesis outputs  
- **doc/** – Design document, user manual, screenshots  

## Hardware & Simulation
- LFSR timer validated through waveform analysis  
- ROM controller tested for correct and incorrect password sequences  
- Fully synthesized and tested on the DE10‑Lite FPGA board  

## Topics (Tags)
verilog • fpga • quartus • modelsim • rom • lfsr • access-control • digital-design • hardware • password-authentication • de10-lite

## Author
Affan Iqbal  
Spring 2026 – ECE 5440/6370

