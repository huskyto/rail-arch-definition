
# RAIL ASM V2

This document describes the changes in the version 2 of the assembly language for the Rail Architecture.

## Why another version?

The main reason to make a different version instead of changing the original one, is that code writen with the `asm v2` will NOT work in TuringComplete directly.

However, internally, the `asm v2` get expanded to the original asm, so that transformed version (as well as the assembled binary files) can be run in TuringComplete.

## Using it.

To make sure that the assembler recognizes your code as `asm v2`, add the following line before your code:

```
#&rail-asm-v2
```

## Changes.

### Remove unecessary zeros.

Instructions that need zeros to keep structure, doesn't need them in `v2`.

Examples:

- `MOV R2 0 D0` -> `MOV R2 D0`
- `JMP lbl 0 0` -> `JMP lbl`
- `NOOP 0 0 0`  -> `NOOP`
- etc.

### Immediates.

Instead of having to add the `IM1` or `IM2` to the instruction, now you can instead add a `*` before the value.

Examples:

- `ADD+IM2 R1 12 R1` -> `ADD R1 *12 R1`
- `MOV+IM1 0x0F 0 R1` -> `MOV *0x0F R1`

### Stack expansion.

Added a couple expansions to push and pop some register values to the general stack. This can help to keep registers consistent during function calls.

- `!ST<`: Pushes the following registers into the general stack.
- `!ST>`: Pops to the defined registers. The register order is taken in reverse.

Example:

- `!ST< R1 R2 D2 D3`: Pushes the values of R1, R2, D2 and D3 into the stack. Then afterwards you can call:
- `!ST> R1 R2 D2 D3`: Pops the values back into the registers. Since the expansion works in reverse, you can keep the same order as in the push.

### Halt instruction.

The `HALT` instruction stops execution. It was very much needed for the simulator.


## Example.

The following program calculated the Fibonacci sequence and writes it to RAM.

```
#&rail-asm-v2

MOV *1 R1

  LABEL loop
MOV R2 D0
ADD R1 R2 R2
MOV D0 R1
RAM_W *R2 R4 0
ADD *1 R4 R4

JMP loop
```

This longer example multiplies the values of `R1` and `R2`, and stores the result in `D0`. It also saves and restores the values in the registers it uses internally.

```
#&rail-asm-v2

CONST sum D0
CONST m1 R1
CONST m2 R2
CONST mask LV0
CONST masked R4
CONST pos R5


  MOV *12 R1
  MOV *3  R2
  CALL mult
  HALT


  LABEL mult    # R1 * R2 -> D0
!ST< mask masked pos R6

MOV *1 mask
MOV *0xFF pos

  LABEL mult_loop
IF_EQ mask *0 end_mult
ADD pos *1 pos
AND mask m2 masked
SHL mask *1 mask
IF_EQ masked *0 mult_loop

MOV m1 R6
SHL R6 pos R6
ADD sum R6 sum
IF_N_EQ mask *0 mult_loop

  LABEL end_mult
!ST> mask masked pos R6
RET

```
