target remote | openocd -c "gdb_port pipe; log_output openocd.log" -f interface/jlink.cfg -c "transport select swd" -f target/stm32f1x.cfg
monitor reset halt
set $pc = 0x20000000
layout regs
load
