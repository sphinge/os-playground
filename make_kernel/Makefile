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
# make clean_kernel_run    -- Führt clean, kernel und run hintereinander aus.
#


#
# Quellen
#
LSCRIPT = kernel.lds
OBJ = start1.o main.o 
LINNERT = /home/mi/linnert/arm/bin

# Library export

export LD_LIBRARY_PATH=/usr/local/lib:/import/sage-7.4/local/lib/

# Konfiguration
#
CC = $(LINNERT)/arm-none-eabi-gcc
LD = $(LINNERT)/arm-none-eabi-ld
OBJCOPY = /home/mi/linnert/arm/bin/arm-none-eabi-objcopy

CFLAGS = -Wall -Wextra -ffreestanding -mcpu=arm920t -O2 -std=c11
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

%.o: %.c
	$(CC) $(CFLAGS) -MMD -MP -o $@ -c $<

kernel: $(LSCRIPT) $(OBJ)
	$(LD) -T$(LSCRIPT) -o $(OUTPUT_DIR)//$@ $(OBJ) $(LIBGCC)

kernel.bin: kernel
	$(OBJCOPY) -Obinary --set-section-flags .bss=contents,alloc,load,data $< $@

kernel.img: kernel.bin
	mkimage -A arm -T standalone -C none -a 0x20000000 -d $< $@

.PHONY: install
install: kernel.img
	arm-install-image $<

.PHONY: clean
clean:
	rm -f $(OUTPUT_DIR)/kernel kernel.bin kernel.img
	rm -f $(OBJ)	
	rm -f $(DEP)

.PHONY: clean_selected
clean_selected:
	rm -f kernel.bin kernel.img
	rm -f $(OBJ)
	rm -f $(DEP)

.PHONY: run
run:
	$(LINNERT)/qemu-bsprak -kernel ../kernel

.PHONY: clean_kernel_run
clean_kernel_run: clean kernel run