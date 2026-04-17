# RISC_Processor_8bit
 8-bit RISC Processor (Verilog HDL)

This project presents the design and implementation of a custom 8-bit RISC processor using Verilog HDL. The processor is built with a modular architecture, integrating both datapath and control path components to execute a simple instruction set.

The design includes key modules such as an Arithmetic Logic Unit (ALU) for arithmetic and logical operations, a finite state machine (FSM)-based Control Unit for instruction sequencing, a Register File for operand storage, and separate Instruction and Data Memories. The processor supports operations including addition, subtraction, comparison, move, multiplication, and memory access (load/store).

Instructions are fetched from instruction memory, decoded, and executed through well-defined stages: Fetch, Decode, Execute, Memory Access, and Write Back. The control unit generates appropriate signals to coordinate data flow across modules, ensuring correct instruction execution.

The complete design was simulated and successfully deployed on an FPGA using Xilinx Vivado, demonstrating real-time instruction execution and proper control flow handling.

=> Features
Custom 8-bit RISC architecture
FSM-based control unit
Modular Verilog design
Supports arithmetic, logic, multiplication, and memory operations
FPGA implementation and real-time testing

=> Tools & Technologies
Verilog HDL
Xilinx Vivado
FPGA Board

