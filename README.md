Features
Generates square, sawtooth, triangle, and sine waveforms
Uses a phase accumulator for frequency control
Uses an 8-bit waveform value internally
Converts the waveform into a 1-bit PWM output
Includes amplitude scaling
Sine wave generated using a lookup table
Designed for the Basys 3 FPGA with a 100 MHz clock
Waveform Modes

The waveform is selected using sw[1:0].

Switch Value	Waveform
00	Square
01	Sawtooth
10	Triangle
11	Sine


To view a smoother waveform shape, use an RC low-pass filter:
The sample images were sampled from a filter of value
R = 1kohm
C = 10 nF

wavePin ---- resistor ---- scope probe tip
                       |
                    capacitor
                       |
                      GND
