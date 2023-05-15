
# Example using the 7 segment displays.
# It just counts up.

  LABEL reset
MOV 0 0 D0
MOV 0 0 D1
MOV 0 0 D2
MOV 0 0 D3

  LABEL loop
ADD+IM1 1 D3 D3
IF_EQ+IM1 0xFF D3 step1
JMP 0 0 loop

  LABEL step1
MOV 0 0 D3
ADD+IM1 1 D2 D2
IF_EQ+IM1 0xFF D2 step2
JMP 0 0 loop

  LABEL step2
MOV 0 0 D2
ADD+IM1 1 D1 D1
IF_EQ+IM1 0xFF D1 step3
JMP 0 0 loop

  LABEL step3
MOV 0 0 D1
ADD+IM1 1 D0 D0
IF_EQ+IM1 0xFF D0 end
JMP 0 0 loop

  LABEL end
MOV 0 0xFF LV0
MOV 0 0 LV0
MOV 0 0xFF LV0
MOV 0 0 LV0
MOV 0 0xFF LV0
MOV 0 0 LV0
JMP 0 0 reset
