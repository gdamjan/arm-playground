PORT = 1234

simple.elf: simple.o
	arm-none-eabi-ld -T stm32ram.ld $< -o $@ -g

simple.o: simple.as
	arm-none-eabi-as --warn --fatal-warnings -mcpu=cortex-m3 $< -o $@ -g

.PHONY: dump
dump:
	arm-none-eabi-objdump -D simple.elf

.PHONY: stlink
stlink:
	st-util -p $(PORT) -v

.PHONY: gdb
gdb: simple.elf
	arm-none-eabi-gdb --tui --silent -ex "target extended-remote :$(PORT)" -ex "layout regs" -ex "load" $<

.PHONY: clean
clean:
	-rm -f simple.elf simple.o
