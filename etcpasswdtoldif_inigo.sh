#!/bin/bash
# un script para poder leer entradas
# un archivo temporal donde guardar lo que vamos leyendo
while :
do
fun_ou(){
OUTPUT="/tmp/input.txt"
dialog --title "La ou de usuario LDAP" \
--backtitle "Parseador de CSV a LDIP" \
--inputbox "Indica la ou del usuario LDAP" 8 60 2>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
	0) ou=$name ;;
	1) echo "Cancel pressed." ;;
	255) echo "[ESC] key pressed." ;;
esac
rm /tmp/input.txt
}
fun_servidor(){
OUTPUT="/tmp/input.txt"
dialog --title "El nombre del servidor LDAP" \
--backtitle "Parseador de CSV a LDIP" \
--inputbox "Indica el nombre del servidor LDAP" 8 60 2>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) servidor=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
rm /tmp/input.txt
}
fun_extension(){
OUTPUT="/tmp/input.txt"
dialog --title "La extension del servidor LDAP" \
--backtitle "Parseador de CSV a LDIP" \
--inputbox "Indica la extension del servidor LDAP" 8 60 2>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) extension=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
rm /tmp/input.txt
}
fun_origencsv(){
OUTPUT="/tmp/input.txt"
dialog --title "Origen csv servidor LDAP" \
--backtitle "Parseador de CSV a LDIP" \
--inputbox "Indica el nombre del fichero csv del servidor LDAP" 8 60 2>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) origencsv=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
rm /tmp/input.txt
}
fun_ldif(){
rm usuarios.txt
touch usuarios.txt
( userlist= cat $origencsv | awk -F: '{print $1}'
for usuario in $userlist
do
echo $usuario
done) > usuarios.txt
uidnum=1000
while IFS=, read col1
do
frasedn='dn: uid='${col1}',ou='$ou",dc="$servidor",dc="$extension
fraseoc1="objectClass: inetOrgPerson"
fraseoc2="objectCLass: posixAccount"
fraseuid="uid: ${col1}"
frasesn="sn: ${col1}"
frasecn="cn: ${col1}"
uidnum=$((uidnum+1))
fraseuidnum="uidNumber: $uidnum"
frasehome="homeDirectory: /home/$servidor/${col1}"
frasepass="userPassword: ${col1}"
fraselogshell="loginShell: /bin/bash"

echo $frasedn >> ldif.ldif
echo $fraseoc1 >> ldif.ldif
echo $fraseoc2 >> ldif.ldif
echo $fraseuid >> ldif.ldif
echo $frasesn >> ldif.ldif
echo $frasecn >> ldif.ldif
echo $fraseuidnum >> ldif.ldif
echo $frasehome >> ldif.ldif
echo $frasepass >> ldif.ldif
echo $fraselogshell >> ldif.ldif
echo $fraseinexistente >> ldif.ldif 
done < usuarios.txt

}
#--------------------------INICIO SCRIPT---------------------------------------
OUTPUT="/tmp/input.txt"

# Dibuja el InputBox
dialog --menu "Elige entre las opciones dn: ou=$ou,dc=$servidor,dc=$extension,origencsv=$origencsv" 0 0 0 UnidadOrganizativa "Indica el nombre del admin OpenLDAP" Servidor "Indica el nombre del servidor" Extension "Indica la extensión del servidor" Origencsv "Indica el nombre del fichero CSV a leer" Ldif "Generar archivo ldif" Salir "Salir del script" 2>temp

if [ "$?" = "0" ]
then
        _return=$(cat temp)
 
        # Nombre is selected
        if [ "$_return" = "UnidadOrganizativa" ]
        then
                fun_ou
        fi
 
         # Servidor is selected
        if [ "$_return" = "Servidor" ]
        then
		fun_servidor
        fi
 
         # Extension is selected
        if [ "$_return" = "Extension" ]
        then
		fun_extension
        fi
	# Origencsv is selected
        if [ "$_return" = "Origencsv" ]
        then
                fun_origencsv
        fi
        # Generar archivo ldif is selected
        if [ "$_return" = "Ldif" ]
        then
                fun_ldif
        fi
        # Salir is selected
        if [ "$_return" = "Salir" ]
        then
                exit 0
        fi
 
# Cancel is pressed
else
        echo "Cancel is pressed"
fi

#Entra en el cae
case $response in
	1) exit 0 ;;
	255) exit 0 ;;
esac

#borrar archivo temporal
rm /tmp/input.txt
done