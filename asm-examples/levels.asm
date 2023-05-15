
# Testing the level register (LV1).
#  It should appear as a moving value in
#  the levels.

  LABEL reset
ADD+IM1 0x80 0 LV0

  LABEL loop
SHR+IM2 LV0 1 LV0
IF_EQ+IM2 LV0 0 reset
JMP 0 0 loop
