#Comprobamos si hay archivos dentro de la carpeta
$alum = "c:\Alumnos\*"
$existe_alumno = Test-Path $alum
#Si existen los archivos, los borramos
if($existe_alumno -eq $True){
    for($a=1; $a -lt 201; $a++){
        $alumno = "Alumno$a"
        Remove-Item -Path C:\Alumnos\$alumno -Force -Recurse
    }
}else{
    #Si no hay archivos, sacamos mensaje por pantalla que lo diga
    echo "Esta carpeta está vacía";
}


