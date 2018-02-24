target remote | openocd -c "gdb_port pipe; log_output openocd.log" -f board/ek-lm4f120xl.cfg
monitor reset halt
set $pc = 0x20000000
layout regs
load
