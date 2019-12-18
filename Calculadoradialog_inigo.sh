#!/bin/bash
# un script para poder leer entradas
# un archivo temporal donde guardar lo que vamos leyendo
operacion=""
num1=""
num2=""
while :
do
fun_num1(){
OUTPUT="/tmp/input.txt"
dialog --title "Numero1" \
--backtitle "Calculadora" \
--inputbox "Indica el Primer numero" 8 60 2>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) num1=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
rm /tmp/input.txt
}
fun_num2(){
OUTPUT="/tmp/input.txt"
dialog --title "Numero2" \
--backtitle "Calculadora" \
--inputbox "Indica el Segundo numero" 8 60 2>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) num2=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
rm /tmp/input.txt
}
fun_operacion(){
OUTPUT="/tmp/input.txt"
dialog --title "Operacion" \
--backtitle "Calculadora" \
--inputbox "Teclea '+' para sumar, '-' para restar, '*' para multiplicar '/' para dividir o '%' para sacar el modulo " 8 60 2>$OUTPUT
response=$?
name=$(<$OUTPUT)
case $response in
        0) operacion=$name ;;
        1) echo "Cancel pressed." ;;
        255) echo "[ESC] key pressed." ;;
esac
rm /tmp/input.txt
}
fun_ejecutar(){
if [ "$operacion" = "" ] || [ "$num1" = "" ] || [ "$num2" = "" ]
then
	echo "Rellena todos los campos"
	exit 0	
else
	resultado=$(($num1$operacion$num2)) 
fi
}

#--------------------------INICIO SCRIPT---------------------------------------
OUTPUT="/tmp/input.txt"
# Dibuja el InputBox
dialog --menu "Calculadora:,Numero1=$num1,Numero2=$num2,Operacion=$operacion,Resultado=$resultado" 0 0 0 Numero1 "Indica el primero numero" Numero2 "Indica el segundo numero" Operacion "Indica la operaciones" Ejecutar "Ejecutar Operacion"  Salir "Salir del script" 2>temp

if [ "$?" = "0" ]
then
        _return=$(cat temp)
 
        # Nombre is selected
        if [ "$_return" = "Numero1" ]
        then
                fun_num1
        fi
 
         # Servidor is selected
        if [ "$_return" = "Numero2" ]
        then
		fun_num2
        fi
 
         # Extension is selected
        if [ "$_return" = "Operacion" ]
        then
		fun_operacion
        fi
         # Extension is selected
        if [ "$_return" = "Ejecutar" ]
        then
                fun_ejecutar
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