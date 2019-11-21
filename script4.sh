#!/bin/bash
# DESCRIPTION creacion archivo ldif con variables
#AUTHOR Marta Bastida
uid=piloto1
ou=pilotos
dc1=korriban
dc2=sith
echo dn:uid=$uid,ou=$ou,dc=$dc1,dc=$dc2 > salida.ldif
echo objectClass=inetOrgPerson >> salida.ldif
echo objectClass=posixAccount >> salida.ldif
echo objectClass=shadowAccount >> salida.ldif
echo cn=$uid >> salida.ldif
echo sn=$uid >> salida.ldif
echo uid=$uid >> salida.ldif
echo uidNumber=300 >> salida.ldif
echo gidNumber=300 >> salida.ldif
echo userPassword=$uid >> salida.ldif
echo homeDirectory= /home/$uid >> salida.ldif
echo loginShell=/bin/bash >> salida.ldif
echo gecos=$uid >> salida.ldif
echo description= User account >> salida.ldif
cat salida.ldif
exit 0

