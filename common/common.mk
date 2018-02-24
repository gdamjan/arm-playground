STLINK_PORT = 1234

CROSS_COMPILE = arm-none-eabi-
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump
GDB = $(CROSS_COMPILE)gdb
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
CC = $(CROSS_COMPILE)gcc

LDSCRIPT = ../common/stm32ram.ld

CPUFLAGS = -mcpu=cortex-m3 -mthumb
CFLAGS = -Wall -Wextra -g3 -O0 -MD $(CPUFLAGS)
LDFLAGS = $(CPUFLAGS) -nostartfiles -Wl,-T,$(LDSCRIPT)
LDLIBS = -lc -lnosys


%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

.PHONY: gdb-stlink gdb-jlink
gdb-stlink: $(TARGET)
	$(GDB) --tui --silent -ex "target extended-remote :$(STLINK_PORT)" -ex "layout regs" -ex "load" $<

gdb-jlink: $(TARGET)
	$(GDB) --tui --silent -x ../common/openocd-jlink.gdb $<

.PHONY: dump
dump: $(TARGET)
	$(OBJDUMP) -D $<

.PHONY: stlink
stlink:
	st-util -p $(STLINK_PORT) -v

.PHONY: clean
clean:
	-rm -f simple.elf simple.o simple.d
