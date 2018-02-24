PORT = 1234

CROSS_COMPILE = arm-none-eabi-
CC = $(CROSS_COMPILE)gcc
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump
GDB = $(CROSS_COMPILE)gdb

CPUFLAGS = -mcpu=cortex-m3 -mthumb
CFLAGS = -Wall -Wextra -g3 -O0 -MD $(CPUFLAGS)
LDFLAGS = $(CPUFLAGS) -nostartfiles -Wl,-T,stm32ram.ld
LDLIBS = -lc -lnosys

CSRC = simple.c
OBJ = $(CSRC:.c=.o)

simple.elf: $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(OBJ) $(LDLIBS)

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

.PHONY: gdb
gdb: simple.elf
	$(GDB) --tui --silent -ex "target extended-remote :$(PORT)" -ex "layout regs" -ex "load" $<

gdb-jlink: simple.elf
	$(GDB) --tui --silent -x openocd-jlink.gdb $<

.PHONY: dump
dump:
	$(OBJDUMP) -D simple.elf

.PHONY: stlink
stlink:
	st-util -p $(PORT) -v

.PHONY: clean
clean:
	-rm -f simple.elf simple.o simple.d
