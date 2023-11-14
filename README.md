Übung 1 ist unter dem tag "uebung01" zu finden 

# How to use:
in ./make_kernel:

 **make kernel**	-- Baut den Kernel.

 **make clean**	-- Löscht alle erzeugten Dateien.

 **make clean_selected**   --Löscht alle dateien, bis auf kernel

 **make run**   -- Führt qemu aus.

 **make clean_kernel_run**    -- Führt clean, kernel und run hintereinander aus.

Beenden:

Strg + A und dann X

# Changes:
- Makefile sollte den Library export jetzt auch machen
- Modularisierung 
- printf um %d erweitert (Positiv und Negativ)
- in DBGU funktionen int_to_decimal und printBinaryDBGU hinzugefügt
- in Time sleep funktion ist experimentell, funktioniert zwar, aber nicht akkurat an den eingegebenen Zeitwert (Warnings von sleep() ignorieren)
