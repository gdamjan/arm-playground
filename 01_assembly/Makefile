PORT = 1234

CROSS_COMPILE = arm-none-eabi-
OBJDUMP = $(CROSS_COMPILE)objdump
GDB = $(CROSS_COMPILE)gdb
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
CC = $(CROSS_COMPILE)gcc

simple.elf: simple.o
	$(LD) -T stm32ram.ld $< -o $@ -g

simple.o: simple.S
	$(AS) --warn --fatal-warnings -mcpu=cortex-m3 $< -o $@ -g

.PHONY: dump
dump:
	$(OBJDUMP) -D simple.elf

.PHONY: stlink
stlink:
	st-util -p $(PORT) -v

.PHONY: gdb
gdb: simple.elf
	$(GDB) --tui --silent -ex "target extended-remote :$(PORT)" -ex "layout regs" -ex "load" $<

.PHONY: clean
clean:
	-rm -f simple.elf simple.o
