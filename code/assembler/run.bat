dosbox -c "mount d: . -freesize 1024" -c "d:" -c "COMPILE.BAT %1"
del %1.OBJ
del %1.MAP
del %1.EXE