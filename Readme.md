# RISC-V Pipelined Processor — RV32IM

A 5-stage pipelined RISC-V processor built in Verilog, supporting the RV32I base integer instruction set and the RV32M multiply/divide extension.

![ISA](https://img.shields.io/badge/ISA-RISC--V-blue)
![HDL](https://img.shields.io/badge/HDL-Verilog-green)
![Pipeline](https://img.shields.io/badge/Pipeline-5--Stage-orange)
![Extension](https://img.shields.io/badge/Extension-RV32M-purple)

---

## What This Is

This project implements a classic 5-stage pipeline — Fetch → Decode → Execute → Memory → Writeback — with real hazard handling, data forwarding, and a hardware multiply/divide unit. It can be simulated in Vivado/Icarus Verilog and deployed on an FPGA (tested with ZedBoard / Nexys A7).

---

## Pipeline Overview

```
  IF ──▶ ID ──▶ EX ──▶ MEM ──▶ WB
  │      │      │       │       │
 PC    RegFile  ALU   DMEM   RegWrite
               MUL/DIV
               Branch
```

**Hazard handling:**
- Load-use hazard → pipeline stall (1 cycle)
- Data hazard → EX-to-EX and MEM-to-EX forwarding
- Branch misprediction → flush IF/ID stages

---

## Repository Structure

```
RISC-V-Processor/
├── modules/               # All Verilog source files
│   ├── pipeline.v         # Top-level pipeline (includes all stages)
│   ├── fetch.v            # IF stage
│   ├── decode.v           # ID stage
│   ├── execute.v          # EX stage + ALU
│   ├── memory.v           # MEM stage
│   ├── writeback.v        # WB stage
│   ├── mul_div.v          # RV32M multiply/divide unit
│   ├── opcode.vh          # Opcode and parameter definitions
│   ├── top_fpga.v         # FPGA wrapper with clock divider
│   ├── constraint.xdc     # Xilinx pin constraints
│   ├── imem.hex           # Instruction memory (hex)
│   └── dmem.hex           # Data memory (hex)
├── testBenches/           # Simulation testbenches
│   ├── tb_pipeline.v      # General pipeline test
│   ├── tb_rv32m.v         # RV32M multiply/divide test
│   ├── imem.hex           # Test instruction memory
│   └── dmem.hex           # Test data memory
├── block_diagrams/        # PDF block diagrams for each stage
├── Timing_diagram/        # Hand-drawn timing diagram
├── group5.pptx            # Project presentation
└── README.md
```

---

## Supported Instructions

**RV32I Base:**

| Type | Instructions |
|------|-------------|
| R-Type | ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND |
| I-Type (Arithmetic) | ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI |
| I-Type (Load) | LB, LH, LW, LBU, LHU |
| S-Type | SB, SH, SW |
| B-Type | BEQ, BNE, BLT, BGE, BLTU, BGEU |
| U-Type | LUI, AUIPC |
| J-Type | JAL, JALR |

**RV32M Extension:**

| Instruction | Description | Latency |
|-------------|-------------|---------|
| MUL / MULH / MULHSU / MULHU | Multiply variants | 4 cycles |
| DIV / DIVU / REM / REMU | Divide variants | 34 cycles |

---

## Running Simulation in Vivado

### Step 1 — Set up the project

Add only `pipeline.v`, `top_fpga.v`, and `opcode.vh` as design sources. The individual stage files (`fetch.v`, `decode.v`, etc.) are already included inside `pipeline.v` — adding them separately will cause duplicate module errors.

Add `tb_pipeline.v` and `tb_rv32m.v` as simulation sources.

### Step 2 — Copy HEX files

Before running simulation, copy `imem.hex` and `dmem.hex` into the xsim working directory:
```
<project>.sim/sim_1/behav/xsim/
```

### Step 3 — Set testbench as top and simulate

In the Vivado TCL console:
```tcl
set_property top tb_pipeline [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
launch_simulation
run 100us
```

### Running with Icarus Verilog (alternative)

```bash
cd testBenches
iverilog -o tb_rv32m.vvp -I../modules ../modules/pipeline.v tb_rv32m.v
vvp tb_rv32m.vvp
gtkwave tb_rv32m.vcd
```

**Expected output:**
```
========================================
RV32M Extension Test Results
========================================
  x1 = 5    (expected: 5)
  x2 = 7    (expected: 7)
  x3 = 35   (expected: 35, MUL 5*7)
  x4 = 100  (expected: 100)
  x5 = 14   (expected: 14, DIV 100/7)
  x6 = 2    (expected: 2,  REM 100%7)

✓ ALL TESTS PASSED!
========================================
```

---

## FPGA Deployment

Tested on **Digilent ZedBoard** (Zynq xc7z020clg484-1). Should also work on Nexys A7 with minor constraint changes.

1. Open Vivado and create a new RTL project
2. Add sources as described above
3. Set `top_fpga.v` as the top module
4. Add `constraint.xdc`
5. Run Synthesis → Implementation → Generate Bitstream → Program Device

**Pin mapping (Nexys A7):**

| Signal | Pin | Description |
|--------|-----|-------------|
| clk | E3 | 100 MHz clock |
| reset | J15 | Active-low reset |
| led[15:0] | Various | Lower 16 bits of PC |

---

## Technical Notes

- Instruction and data memories are each **4 KB**, word-addressed
- x0 is hardwired to zero; register file has dual read ports and a single write port
- Multiply uses a 4-cycle pipelined partial-product approach
- Divide uses a 34-cycle iterative restoring division; division by zero returns `0xFFFFFFFF`
- The `top_fpga` module wraps the pipeline with a clock divider and 7-segment display controller for FPGA demo purposes

---

## References
- Patterson & Hennessy — *Computer Organization and Design: RISC-V Edition*
---

## Authors
Ayush Moharana EEE DEpartment
