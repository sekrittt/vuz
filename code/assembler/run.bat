cls
dosbox -c "keyb ru 866" -c "mount d: . -freesize 8192" -c "d:" -c "COMPILE.BAT %1"
del %1.OBJ
del %1.MAP
del %1.EXE