TARGET := simple.elf
SOURCE = simple.c
OBJ = $(SOURCE:.c=.o)

default: $(TARGET)

include ../common/common.mk

$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(OBJ) $(LDLIBS)
