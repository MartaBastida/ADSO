#!/bin/bash
# DESCRIPTION pedir numero al usuario y elegir un caso dependido del que meta
#AUTHOR Marta Bastida
#abrimos bucle
while :
do
	echo "Si pulsas 1 sigo preguntando"
	echo "Si pulsas 2 termino"
	echo "Si pulsas 3 te cuento un chiste"
	read -p "Elige un numero [1, 2 o 3]" numero
	case $numero in 
		1)
			echo "Has elegido 1, vuelvo a preguntar"
			;;
		2)
			echo "Has elegido 2, termino"
			exit 0
			;;
		3)
			echo "Has elegido 3, te cuento un chiste"
			echo "¿Qué es un pez en un cine?"
			echo "Un mero espectador"
			;;
		*)
			echo "Error, tienes que elegir una opció"
			;;
	esac
done
