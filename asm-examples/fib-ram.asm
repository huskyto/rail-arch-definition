
# Calculates the Fibonacci sequence
#  and writes the values to RAM.

MOV 0 1 R1
MOV 0 1 D1

LABEL loop
MOV R2 0 D0
ADD R1 R2 R2
MOV D0 0 R1
MOV R2 0 IO

RAM_W+IM1 R2 R4 0
ADD D1 R4 R4

JMP 0 0 loop
