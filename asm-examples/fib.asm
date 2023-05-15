
# Calculates the Fibonacci sequence
#  and writes the value to the IO register.

ADD+IM2 R0 1 R1

  LABEL loop
MOV R2 0 D0
ADD R1 R2 R2
MOV D0 0 R1
MOV R2 0 IO
JMP 0 0 loop
