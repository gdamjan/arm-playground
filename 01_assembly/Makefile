TARGET = simple.elf
SOURCE = simple.S
OBJ = $(SOURCE:.S=.o)

default: $(TARGET)

include ../common/common.mk

$(TARGET): $(OBJ)
	$(LD) -T $(LDSCRIPT) $< -o $@ -g

%.o: %.S
	$(AS) --warn --fatal-warnings $(CPUFLAGS) $< -o $@ -g
