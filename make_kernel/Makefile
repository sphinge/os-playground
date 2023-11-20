#
# Kurzanleitung
# =============
#
# make kernel	-- Baut den Kernel.
#
# make clean	-- Löscht alle erzeugten Dateien.
#
# make clean_selected   --Löscht alle dateien, bis auf kernel
#
# make run   -- Führt qemu aus.
#
# make run-debug   -- Führt qemu aus, wartet auf GDB.
#
# make debugger   -- Führt GDB aus.
#
# make clean_kernel_run    -- Führt clean, kernel und run hintereinander aus.
#

SRC_ISR = ../ISR/
SRC_DBGU = ../debug_unit/
SRC_LIB = ../lib/
#
# Quellen
#
LSCRIPT = kernel.lds
OBJ = start1.o main.o $(SRC_ISR)isr.o $(SRC_ISR)ivt.o $(SRC_DBGU)debug_unit.o $(SRC_LIB)memory.o
LINNERT = /home/mi/linnert/arm/bin

# Library export

export LD_LIBRARY_PATH=/usr/local/lib:/import/sage-7.4/local/lib/

# Konfiguration
#
CC = $(LINNERT)/arm-none-eabi-gcc
LD = $(LINNERT)/arm-none-eabi-ld
OBJCOPY = /home/mi/linnert/arm/bin/arm-none-eabi-objcopy

CFLAGS = -Wall -Wextra -ffreestanding -mcpu=arm920t -Og -g -std=c11
#LIBGCC := $(shell $(CC) -print-libgcc-file-name)

OUTPUT_DIR = ..

DEP = $(OBJ:.o=.d)
#
# Regeln
#
.PHONY: all 
all: kernel

-include $(DEP)

%.o: %.S
	$(CC) $(CFLAGS) -MMD -MP -o $@ -c $<

%.o: %.c                                          #-save-temps
	$(CC) $(CFLAGS) -MMD -MP -o $@ -c $<    

$(SRC_ISR)/%.o: $(SRC_ISR)/%.S
	$(CC) $(CFLAGS) -MMD -MP -o $@ -c $<

$(SRC_ISR)/%.o: $(SRC_ISR)/%.c
	$(CC) $(CFLAGS) -MMD -MP -o $@ -c $<

kernel: $(LSCRIPT) $(OBJ)
	$(LD) -T$(LSCRIPT) -o $(OUTPUT_DIR)//$@ $(OBJ) $(LIBGCC)

# kernel.bin: kernel
# 	$(OBJCOPY) -Obinary --set-section-flags .bss=contents,alloc,load,data $< $@

# kernel.img: kernel.bin
# 	mkimage -A arm -T standalone -C none -a 0x20000000 -d $< $@

.PHONY: install
install: kernel.img
	arm-install-image $<

.PHONY: clean
clean:
	rm -f $(OUTPUT_DIR)/kernel kernel.bin kernel.img
	rm -f $(OBJ)
	rm -f $(DEP)
	rm -f  $(SRC_ISR)$(OBJ)
	rm -f  $(SRC_ISR)$(DEP)
	rm -f  $(SRC_DBGU)$(OBJ)
	rm -f  $(SRC_DBGU)$(DEP)
	rm -f  $(SRC_LIB)$(OBJ)
	rm -f  $(SRC_LIB)$(DEP)

.PHONY: clean_selected
clean_selected:
	rm -f kernel.bin kernel.img
	rm -f $(OBJ)
	rm -f $(DEP)
	rm -f  $(SRC_ISR)$(OBJ)
	rm -f  $(SRC_ISR)$(DEP)
	rm -f  $(SRC_DBGU)$(OBJ)
	rm -f  $(SRC_DBGU)$(DEP)
	rm -f  $(SRC_LIB)$(OBJ)
	rm -f  $(SRC_LIB)$(DEP)

.PHONY: run run-debug debugger
run: kernel
	$(LINNERT)/qemu-bsprak -kernel ../kernel

run-debug: kernel
	$(LINNERT)/qemu-bsprak -S -s -kernel ../kernel

debugger: kernel
	$(LINNERT)/arm-none-eabi-gdb ../kernel

.PHONY: clean_kernel_run
clean_kernel_run: clean kernel run