Übung 1 ist unter dem tag "uebung01" zu finden \n
Übung 2 ist unter dem tag "uebung02" zu finden 

# How to use:
## in ./make_kernel:

 **make kernel**	-- Baut den Kernel.

 **make clean**	-- Löscht alle erzeugten Dateien.

 **make clean_selected**   --Löscht alle dateien, bis auf kernel

 **make run**   -- Führt qemu aus.

 **make run-debug**   -- Führt qemu aus, wartet auf GDB.

 **make debugger**   -- Führt GDB aus.

 **make clean_kernel_run**    -- Führt clean, kernel und run hintereinander aus.

## Beenden:

Strg + A und dann X

# Changes:
- printf um %b (binary) erweitert 
- ivt und isr "Handler" hinzugefügt (teils funktional)
- in Time sleep funktion ist experimentell, funktioniert zwar, aber nicht akkurat an den eingegebenen Zeitwert (Warnings von sleep() ignorieren)
