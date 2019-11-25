#!/bin/bash
# DESCRIPTION creacion archivo ldif con variables
#AUTHOR Marta Bastida
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
			if [ -f /home/si2/Documentos/git_adso/ADSO/script8.sh ];
			then
				echo "El archivo ya existe."
				exit 0
			else
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
			fi
			;;
		*)	
			echo "Elige un número válido"
			;;
	esac
done

