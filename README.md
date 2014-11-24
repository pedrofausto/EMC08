EMC08
=====

8 bit Microcontroller developed at CI Brasil

EMC08 project is an 8-bit Microcontroller internal IP that could be used in future projects that require, embedded DIGITAL, AMS, RF and DSP blocks as part of the automotive system application.

The 8-bit Microcontroller has a CPU optimized for control applications, extensive Boolean processing capabilities, 4K bytes of on-chip program memory (ROM) address space, 128 bytes of on-chip data RAM, 32 bidirectional and 8 unidirectional and individually addressable I/O lines, three 24-bit timer/counters, full-duplex UART, vector interrupt structure with two priority levels.

The Analog blocks are basically 8-bit digital to analog converter and low noise 2.4 GHz RF Transceiver and Receiver digital wireless protocol based. The DSP will act as a baseband processing stage, which means it will be in charge of performing several algorithms for both the transmitter and the receiver.
This Integration Guide is focused on Digital module. The Analog and DSP modules will not be part of this team development, they are considered separated IPs which can be integrated in the SoC. However, there are two essentials analog sub-modules that are necessary to digital operation: 
-	Phase Locked Loop – PLL
-	Power On Reset
-	
The main clock can be provided by an external crystal oscillator, or optionally, can be used the 20MHz Low-Jitter Oscillator, an analog block. The PLL provides the clock used for memories and Power On Reset provides a reliable start up of the digital core. Other analog blocks are optionally too, as well as DSP module.
