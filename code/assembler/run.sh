dosbox -c "mount d: ./ -freesize 1024" -c "d:" -c "COMPILE.BAT $1" && rm $(echo $1 | tr '[:lower:]' '[:upper:]').*