

## Rail Arch

The `Rail Architecture` is an 8-bit architecture that was initially conceived as a small project for the game `Turing Complete`.

Now, it's grown to include two simulators (one in [Rust](https://github.com/huskyto/rail-arch-rust) and one in [Kotlin](https://github.com/huskyto/rail-arch-kt)), each equipped with an assembler, so you can run code specifically crafted for this architecture.

If you wish to try it, you can develop a program in the simulator and then deploy that same code in the game.

&nbsp;

### Base concepts

- Instructions are 4 bytes wide.
- The first byte defines the operation and includes the immediate flags.
- Depending on the system, the next 3 bytes can have different meanings.

The following is the basic structure. The zeros represent a single bit.

|0|0|00|0000| I |00000000|I|00000000|I|00000000|
|---|---|---|---|---|---|---|---|---|---|
|IM1|IM2|System|Instruction||Arg1||Arg2||Arg3|

### OP Codes

|Code   |   |
|---    |---|
0		|Instruction
1		|Instruction
4		|Instruction
8		|Instruction
16		|System
32		|System
64		|IM2	( Arg2 )
128		|IM1	( Arg1 )
&nbsp;

## Systems

|Code   | System |
|---    |---|
00		|ALU
01		|RAM / Stack
10		|CU
11		|Peripheral
&nbsp;

## Instructions

&nbsp;

### ALU

	[ OPC, Arg1, Arg2, Result ]

|Code|OP|Code|OP|
|---|---|---|---|
|0	|Add	|	8|
|1	|Sub	|	9|
|2	|And	|	10|
|3	|Or		|   11|
|4	|Not	|	12|	RAN-SetSeed
|5	|Xor	|	13|	RAN-Next
|6	|shl	|	14|
|7	|shr	|	15|	noop

&nbsp;

### CU
	[ OPC, Arg1, Arg2, JMP_ADDR ]

|Code|OP|Code|OP|
|---|---|---|---|
|32|	==|		40|
|33|	!=|		41|
|34|	<|		42|
|35|	<=|		43|
|36|	>|		44|
|37|	>=|		45|
|38|  TRUE|	46|
|39|	FALSE|	47|

&nbsp;

### RAM / Stack
	[ OPC, (source)*, (addr)*, (target)* ]

|Code|OP|Code|OP|
|---|---|---|---|
|16|	R_Read		|24| S_POP
|17|	R_Write		|25| S_PUSH
|#18|	VR_Read		|26| RET
|#19|	VR_Write	|27| CALL
|#20|	Disk_Read	|28|
|#21|	Disk_Write	|29|
|22|				|30|
|23|				|31|

Note: VR and Disk ops are not yet implemented.

&nbsp;


## REGISTERS

| Code | Name | notes | Code | Came | notes |
| --- | --- | --- | --- | --- | --- |
| 0 | R0 |  | 8 | BZ0 | Buzzer |
|1| R1|  |9|LV0|LED levels|
|2|R2|  |10|D0|7-seg Display|
|3|R3|  |11|D1|7-seg Display|
|4|R4|  |12|D2|7-seg Display|
|5|R5|  |13|D3|7-seg Display|
|6|R6|  |14|CNT|Program Counter|
|7|R7|  |15|IO|  |
