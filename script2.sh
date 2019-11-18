#!/bin/bash
# DESCRIPTION variables
#AUTHOR Marta Bastida
myvar="hola"
echo $myvar #accedo al contenido
echo "$myvar" #accedo al conetenido
echo '$myvar' #sale la palabra $myvar
echo \$myvar #sale la palabra $myvar
exit 0 #Termina sin fallos. Esta línea no se ejecuta
