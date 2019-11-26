#!/bin/bash
# DESCRIPTION creacion archivo temporar donde guardar lo que vamos leyendo
#AUTHOR Marta Bastida
OUTPUT="/tmp/input.txt"

dialog --title "El nombre del admin LDAP" \
--backtitle "Parseador de CSV a LDIP" \
--inputbox "Indica el nombre del admin LDAP (suele ser admin)" 8 60 2>$OUTPUT

response=$?

name=$(<$OUTPUT)

case $response in
0) echo "Hola $name" ;;
1) echo "Cancel pressed." ;;
255) echo "[ESC] key pressed."
esac

rm /tmp/input.txt
