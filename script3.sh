#!/bin/bash
# DESCRIPTION Hola mundo
#AUTHOR Marta Bastida
$num1=4
$num2=6
let num3 #tambien puedo crear variables con let
echo $num1 + $num2
echo num1 + num2
((num3=num1+num2)) #las operaciones aritméticas van con (())
echo $num3
exit 0 #Termina sin fallos. Esta línea no se ejecuta
