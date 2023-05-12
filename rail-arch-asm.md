# RAIL ASM DOCUMENTATION

This document describes the assembly language for the Rail Architecture.

## General Considerations

- Words are 8-bit wide.
- Instructions are always 4 words wide.
- `LABEL`: Defines a label for jumps and calls.
- `CONST`: Allows to define constant values.
- Comments are denoted by a hash (`#`). Everything from the `#` to the end of the line is ignored.

## REGISTERS

- `R0` - `R7`: General-purpose registers.
- `BZ0`: Buzzer register.
- `LV0`: LED levels register.
- `D0` - `D3`: 7-seg Display registers.
- `CNT`: Counter register.
- `IO`: I/O register.

## ALU (Arithmetic Logic Unit) Operations

- `ADD`: Addition.
- `SUB`: Subtraction.
- `AND`: Bitwise AND.
- `OR`: Bitwise OR.
- `NOT`: Bitwise NOT.
- `XOR`: Bitwise XOR.
- `SHL`: Bitwise shift left.
- `SHR`: Bitwise shift right.
- `RAN_SS`: Set seed for the random number generator.
- `RAN_NEXT`: Generate the next random number.
- `NOOP`: No operation.

## CU (Control Unit) Operations

- `IF_EQ`: Conditional jump if equal.
- `IF_N_EQ`: Conditional jump if not equal.
- `IF_LT`: Conditional jump if less than.
- `IF_LTE`: Conditional jump if less than or equal.
- `IF_MT`: Conditional jump if more than.
- `IF_MTE`: Conditional jump if more than or equal.
- `IF_T`: Always jumps. Aliased as `JMP`.
- `IF_F`: Never jumps. `IM` is implicit.

## RAM and Stack Operations

- `RAM_R`: Read from RAM.
- `RAM_W`: Write to RAM.
- `S_POP`: Pop from stack.
- `S_PUSH`: Push to stack.
- `RET`: Return from subroutine.
- `CALL`: Call subroutine.

## Immediate Values

- `IM2`: Immediate value (second argument).
- `IM1`: Immediate value (first argument).

## Aliases

- `MOV`: Move operation. This is an alias for `IM2`.
- `JMP`: Unconditional jump. This is an alias for `IF_T`.

Note: Any token that is not recognized is treated as an error.

## Example Usage

Here's an example program using this ASM language, which prints the values for the Fibonacci sequence to the IO:

```
ADD+IM2 R0 1 R1

LABEL loop
MOV R2 0 D0
ADD R1 R2 R2 #this is a comment
MOV D0 0 R1
MOV R2 0 IO
JMP 0 0 loop
```

## Known bugs

- Using `NOOP` sometimes sets `R0` to `0`. This doesn't happen in the simulators.
- `RAN_SS` can't be set on the first cycle.
