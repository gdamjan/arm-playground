a simple program in C that blinks the led (pc13). see [https://github.com/satoshinm/pill_blink/]

the linker script is set to run in ram (0x20000000) for the stm32f103 (possibly others too).

run `make stlink` in one terminal, and then `make gdb` to load the program in ram.
use `run` to run the program.
