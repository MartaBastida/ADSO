[int]$num1 = Read-Host 'Dime un numero'
[int]$num2 = Read-Host 'Dime otra numero'
[int]$nummax = Read-Host 'Dime el numero maximo'
[int]$numtemp = 0

if($num1 -eq 0) {
           Write-host 'Ninguno de los dos numeros pueden ser igual a 0'
} elseif ($num2 -eq 0){
    Write-host 'Ninguno de los dos numeros pueden ser igual a 0'
} elseif ($num1 -gt $nummax){
    Write-host 'Ninguno de los dos numeros pueden ser mayor que el numero maximo'
} elseif ($num2 -gt $nummax){
    Write-host 'Ninguno de los dos numeros pueden ser mayor que el numero maximo'
} else {
if ($num1 -lt 0){
    $num1=$num1*(-1)
}
if ($num2 -lt 0){
    $num2=$num2*(-1)
}
    if($num1 -gt $num2) {
    $numtemp = $num1
    $num1 = $num2
    $num2 = $numtemp
}
Write-host $num1
Write-host $num2
[int]$num3 = $num2
[int]$contador = 0
     while ($contador -lt $nummax) {
           $num3=$num1+$num2
           $num1 = $num2
           $num2 = $num3
           $contador = $contador + 1
           Write-host $num3

     }
}
