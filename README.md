Übung 1 ist unter dem tag "uebung01" zu finden 

Übung 2 ist unter dem tag "uebung02" zu finden 

Übung 3 ist unter dem tag "uebung03" zu finden 

Übung 4 ist unter dem tag "uebung04" zu finden

Übung 5 ist unter dem tag "uebung05" zu finden

# How to use:

 **make build**	-- Baut den Kernel.

 **make clean**	-- Löscht alle erzeugten Dateien.

 **make clean_selected**   --Löscht alle dateien, bis auf kernel

 **make run**   -- Führt qemu aus.

 **make run-debug**   -- Führt qemu aus, wartet auf GDB.

 **make debugger**   -- Führt GDB aus.

 **make clean_build_run**    -- Führt clean, build und run hintereinander aus.
 
 __make clean_run__    -- Führt clean, build, clean_selected und run hintereinander aus.    **>>Empfohlen<<**
#

## Beenden:

Strg + A und dann X

# Changes:
- receive_DBGU Funktional
- entfernen von printBinaryDBGU
- änderung des zwecks von print_DBGU weil es durch printfn ersetzt wurde
- ivt und isr "Handler" hinzugefügt (teils funktional)
- in Time sleep funktion ist experimentell, funktioniert zwar, aber nicht akkurat an den eingegebenen Zeitwert (Warnings von sleep() ignorieren)
