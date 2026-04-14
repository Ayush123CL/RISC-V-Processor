<div align="center">
  
# 🚀 RISC-V Pipelined Processor (RV32IM)

**A highly optimized 5-stage pipelined RISC-V processor built in Verilog, supporting the RV32I base integer instruction set and the RV32M multiply/divide extension.**

![ISA](https://img.shields.io/badge/ISA-RISC--V_RV32IM-blue?style=for-the-badge&logo=riscv)
![HDL](https://img.shields.io/badge/HDL-Verilog-green?style=for-the-badge)
![Pipeline](https://img.shields.io/badge/Architecture-5--Stage_Pipeline-orange?style=for-the-badge)
![Deployment](https://img.shields.io/badge/Deployment-Xilinx_FPGA-purple?style=for-the-badge)

*Developed as part of the CS224 Computer Architecture Lab at IIT Guwahati.*

</div>

---

## 📋 Table of Contents
- [Overview](#-overview)
- [Architecture & Features](#-architecture--features)
- [Supported Instructions](#-supported-instructions)
- [Repository Structure](#-repository-structure)
- [Simulation in Vivado](#-simulation-in-vivado)
- [FPGA Deployment](#-fpga-deployment)

---

## 🔭 Overview
This project implements a classic 5-stage pipeline architecture with robust hazard handling, data forwarding, and a custom multicycle hardware multiply/divide unit. It is fully synthesizable, can be simulated using Vivado or Icarus Verilog, and is designed for deployment on FPGAs (tested on ZedBoard / Nexys A7).

---

## 🏗️ Architecture & Features

### The 5-Stage Pipeline
```text
  [IF] ──────▶ [ID] ──────▶ [EX] ──────▶ [MEM] ──────▶ [WB]
 Fetch        Decode      Execute       Memory      Writeback
 (PC/IMEM)  (Reg/Ctrl)  (ALU/MULDIV)    (DMEM)      (RegWrite)