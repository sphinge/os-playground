#
# Kurzanleitung
# =============
#
# make build	-- Baut den Kernel.
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
# make clean_build_run    -- Führt clean, build und run hintereinander aus.
#
# make clean_run    -- Führt clean, build, clean_selected und run hintereinander aus.    >>Empfohlen<<
#

SRC_DRIVER = driver/
SRC_SYSTEM = system/
SRC_LIB = lib/

LINNERT = /home/mi/linnert/arm/bin
#
# Quellen
#
LSCRIPT = kernel.lds
OBJ = $(SRC_SYSTEM)entry.o $(SRC_SYSTEM)start.o 
OBJ += $(SRC_SYSTEM)isr.o $(SRC_SYSTEM)ivt.o 
OBJ += $(SRC_SYSTEM)stack.o $(SRC_SYSTEM)cpu.o
OBJ += $(SRC_SYSTEM)scheduler.o $(SRC_SYSTEM)tcb.o
OBJ += $(SRC_DRIVER)debug_unit.o $(SRC_DRIVER)time.o $(SRC_DRIVER)aic.o
OBJ += $(SRC_LIB)memory.o $(SRC_LIB)util.o $(SRC_LIB)print.o $(SRC_LIB)receive.o
OBJ += $(SRC_LIB)debug.o

# Library export
export LD_LIBRARY_PATH=/usr/local/lib:/import/sage-7.4/local/lib/

# Konfiguration
#
CC = $(LINNERT)/arm-none-eabi-gcc
LD = $(LINNERT)/arm-none-eabi-ld
OBJCOPY = /home/mi/linnert/arm/bin/arm-none-eabi-objcopy

CFLAGS = -Wall -Wextra -ffreestanding -mcpu=arm920t -Og -g -std=c11
CPPFLAGS = -Iinclude
#LIBGCC := $(shell $(CC) -print-libgcc-file-name)

DEP = $(OBJ:.o=.d)
#
# Regeln
#
.PHONY: build 
build: kernel

-include $(DEP)

%.o: %.S
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -o $@ -c $< 

%.o: %.c                                          #-save-temps
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -o $@ -c $<    
kernel: $(LSCRIPT) $(OBJ)
	$(LD) -T$(LSCRIPT) -o $@ $(OBJ) $(LIBGCC)

# kernel.bin: kernel
# 	$(OBJCOPY) -Obinary --set-section-flags .bss=contents,alloc,load,data $< $@

# kernel.img: kernel.bin
# 	mkimage -A arm -T standalone -C none -a 0x20000000 -d $< $@

.PHONY: install
install: kernel.img
	arm-install-image $<

.PHONY: clean
clean:
	rm -f kernel kernel.bin kernel.img
	rm -f $(OBJ)
	rm -f $(DEP)

.PHONY: clean_selected
clean_selected:
	rm -f kernel.bin kernel.img
	rm -f $(OBJ)
	rm -f $(DEP)

.PHONY: run run-debug debugger
run: kernel
	$(LINNERT)/qemu-bsprak -kernel kernel

run-debug: kernel #clean_selected 
	$(LINNERT)/qemu-bsprak -S -s -kernel kernel

debugger: kernel
	$(LINNERT)/arm-none-eabi-gdb kernel

.PHONY: clean_build_run
clean_build_run: clean build run

.PHONY: clean_run
clean_run: clean build clean_selected run 