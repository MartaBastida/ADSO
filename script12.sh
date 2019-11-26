#!/bin/bash
# DESCRIPTION creacion archivo temporar donde guardar lo que vamos leyendo
#AUTHOR Marta Bastida
#crear archivo para guardar el menu
RESPONSE=menu.txt
#crear archivo para guardar el contenido que mostrar
OUTPUT=/tmp/input.txt

nombre_admin(){
	dialog --title "El nombre del admin LDAP" \
	--backtitle "Parseador de CSV a LDIP" \
	--inputbox "Indica el nombre del admin LDAP (suele ser admin)" 8 60 2>$OUTPUT
}
nombre_server(){
	dialog --title "El nombre del servidor" \
	--backtitle "Parseador de CSV a LDIP" \
	--inputbox "Indica el nombre del servidor" 8 60 2>$OUTPUT
}
extensión_server(){
	dialog --title "El nombre del admin LDAP" \
	--backtitle "Parseador de CSV a LDIP" \
	--inputbox "Indica la extensión del servidor" 8 60 2>$OUTPUT
}
nombre_csv(){
	dialog --title "El nombre del admin LDAP" \
	--backtitle "Parseador de CSV a LDIP" \
	--inputbox "Indica el nombre del fichero CSV a leer" 8 60 2>$OUTPUT
}

dialog --title "PROGRAMA -- PRINCIPAL" \
 --menu "Parseador de CSV a LDIP" 15 50 4 \ 
Nombre "Indica el nombre del admin OpenLdap" \
Servidor "Indica el nombre del servidor" \
Extension "Indica la extensión del servidor" \
Origencsv "Indica el nombre del fichero CSV a leer" \
Salir "Salir del script" 2>"${RESPONSE}"
menuitem=$(<"${RESPONSE}")
##Introducimos la opción elegida

case $menuitem in
Nombre) nombre_admin ;;
Servidor) nombre_server ;;
Extension) extension ;;
Origencsv) nombre_csv ;;
Salir) echo "Hasta nunqui"
esac
#rm /tmp/input.txt



