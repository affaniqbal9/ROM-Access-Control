# ROM-Based Access Control System (FPGA)

![Verilog](https://img.shields.io/badge/Verilog-RTL-1F6FEB)
![Quartus](https://img.shields.io/badge/Intel%20Quartus%20Prime-Synthesis-0071C5?logo=intel&logoColor=white)
![ModelSim](https://img.shields.io/badge/ModelSim-Simulation-EE6C4D)
![FPGA](https://img.shields.io/badge/FPGA-DE0--CV-4C9A2A)

A hardware access control system implemented in synchronous **Verilog RTL** and deployed on a **DE0-CV FPGA**. A finite state machine authenticates a 4-digit password digit-by-digit against a value stored in ROM, while an LFSR-based module generates the system's 1 ms timing pulses.

Built for **ECE 6370**, University of Houston — Spring 2026.

---

## 🔍 Verification

The design was verified in **ModelSim** before it ever reached hardware:

- LFSR timer validated through waveform analysis
- ROM controller tested against both correct and incorrect password sequences
- FSM state transitions and ROM reads checked with dedicated testbenches
- Fully synthesized in Intel Quartus Prime and tested on the DE0-CV FPGA board

Waveform captures and the design document are in `doc/`.

---

## ⚙️ Features

- ROM-stored password for secure authentication
- Access control FSM that validates each digit sequentially
- LFSR-based 1 ms timer for efficient hardware timing
- Random number generator for game logic
- Modular Verilog design with clean port interfaces, suitable for FPGA implementation

---

## 📁 Folder Structure

| Path | Contents |
|---|---|
| `src/` | Verilog modules and testbenches |
| `sim_lfsr/` | LFSR timer simulation files |
| `sim_rom/` | ROM access controller simulation files |
| `syn/` | Quartus project, pin assignments, and synthesis outputs |
| `doc/` | Design document, user manual, screenshots |

---

## 🧰 Tools

**HDL:** Verilog · **Simulation:** ModelSim · **Synthesis:** Intel Quartus Prime · **Target:** DE0-CV FPGA

---

## 👤 Author

**Affan Iqbal** — [LinkedIn](https://www.linkedin.com/in/affaniqbal9/) · [GitHub](https://github.com/affaniqbal9)
