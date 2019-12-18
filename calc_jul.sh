# ! /bin/bash
# Calculadora Simples Shell Script Utilizando dialog#
# Autor: Ewerton Tiago Azevedo
# Data: 10-03-2010


tmp="/tmp/calc.tmp"

tmp2="/tmp/calc2.tmp"

function calcula() {

rm -rf $tmp

title= "Calculadora 1.0"

dialog --backtitle "$title" --infobox 'Escolha o Tipo de Operação:' 0 0

dialog --backtitle "$title" --radiolist 'Escolha o operador:' 0 0 0 'Soma' '+' 'On' 'Subtração' '-' 'off' 'Multiplicação' '*' 'off' 'Divisão' '/' 'off' 2> $tmp

op=$(cat $tmp | tail -n 1);

if [ $op = 'Soma' ]; then

dialog --inputbox 'Digite um número:' 0 0 2>$tmp

num1=$(cat $tmp |tail -n 1)

dialog --inputbox 'Digite mais um número:' 0 0 2>$tmp2

num2=$(cat $tmp2 |tail -n 1)


result=$((num1+num2))



dialog --infobox 'Resultado: '$result 0 0

sleep 3

dialog --infobox 'Você está Somando' 0 0

elif [ $op = 'Divisão' ]; then

rm -rf $tmp

rm -rf $tmp2

dialog --inputbox 'Digite um número:' 0 0 2>$tmp

num1=$(cat $tmp |tail -n 1)

dialog --inputbox 'Digite mais um número:' 0 0 2>$tmp2

num2=$(cat $tmp2 |tail -n 1)

sleep 1

result=$((num1/num2))

dialog --infobox  'Resultado: '$result 0 0

sleep 2

dialog --infobox 'Você está Dividindo' 0 0

else

echo "Existe Algum erro"

fi


}

calcula