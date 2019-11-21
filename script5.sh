#!/bin/bash
# DESCRIPTION creacion archivo ldif con variables interaccion con usario
#AUTHOR Marta Bastida
read -p "Escribe el nombre del usuario:" uid
read -p "Escribe el nombre del grupo del usuario:" ou
read -p "Escribe el nombre del SLD:" dc1
read -p "Escribe el nombre del TLD:" dc2
echo dn:uid=$uid,ou=$ou,dc=$dc1,dc=$dc2 > salida2.ldif
echo objectClass=inetOrgPerson >> salida2.ldif
echo objectClass=posixAccount >> salida2.ldif
echo objectClass=shadowAccount >> salida2.ldif
echo cn=$uid >> salida2.ldif
echo sn=$uid >> salida2.ldif
echo uid=$uid >> salida2.ldif
echo uidNumber=300 >> salida2.ldif
echo gidNumber=300 >> salida2.ldif
echo userPassword=$uid >> salida2.ldif
echo homeDirectory= /home/$uid >> salida2.ldif
echo loginShell=/bin/bash >> salida2.ldif
echo gecos=$uid >> salida2.ldif
echo description= User account >> salida2.ldif
cat salida2.ldif
exit 0

