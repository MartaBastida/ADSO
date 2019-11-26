#!/bin/bash
# DESCRIPTION creacion archivo ldif con variables
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

while :
do
	echo "Rellena la frase"
        echo "Pulsa 1 para meter uid"
        echo "Pulsa 2 para meter ou"
        echo "Pulsa 3 para meter FLD"
        echo "Pulsa 4 para meter SLD"
        echo "Pulsa 0 para comprobar"
        read -p "Elige opción: " opcion
        case $opcion in

		1)
			read -p "Escribe el uid: " uid
			;;
		2)
			read -p "Escribe el ou: " ou
			;;
		3)
			read -p "Escribe el FLD: " fld
			;;
		4)
			read -p "Escribe el SLD: " sld
			;;
		0)	
			echo dn:uid=$uid,ou=$ou,dc=$fld,dc=$sld > salida3.ldif
			echo objectClass=inetOrgPerson >> salida3.ldif
			echo objectClass=posixAccount >> salida3.ldif
			echo objectClass=shadowAccount >> salida3.ldif
			echo cn=$uid >> salida3.ldif
			echo sn=$uid >> salida3.ldif
			echo uid=$uid >> salida3.ldif
			echo uidNumber=300 >> salida3.ldif
			echo gidNumber=300 >> salida3.ldif
			echo userPassword=$uid >> salida3.ldif
			echo homeDirectory= /home/$uid >> salida3.ldif
			echo loginShell=/bin/bash >> salida3.ldif
			echo gecos=$uid >> salida3.ldif
			echo description= User account >> salida3.ldif
			cat salida3.ldif
			exit 0
			;;
		*)	
			echo "Elige un número válido"
			;;
	esac
done

