#!/bin/bash
# DESCRIPTION pedir numero al usuario y ver si es mayor, menor o igual a 4000
#AUTHOR Marta Bastida
#Pedimos al usuario que introduzca un numero por pantalla
read -p "Escribe un numero: " numero
#miramos si es mayor de 4000
if [ $numero -gt 4000 ]
then 
	echo El número es mayor de 4000
#miramos si es menor de 4000
elif [ $numero -lt 4000 ]
then 
	echo El número es menor de 4000
#miramos si es igual a 4000
else
	echo El número es igual a 4000
fi
#Terminamos sin errores
exit 0

