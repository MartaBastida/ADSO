#Comprobamos si ya están creados los archivos
if(Test-Path c:\Alumnos and Test-Path c:\Profesores and Test-Path c:\Comun){
    #Borramos los archivos en caso de que ya existan
    Remove-Item -Path C:\Alumnos -Force -Recurse
    Remove-Item -Path C:\Profesores -Force -Recurse
    Remove-Item -Path C:\Comun -Force -Recurse
}else{
    # Creamos la estructura de directorios
    New-Item -ItemType "directory" -Path "c:\Alumnos", "c:\Profesores", "c:\Comun"
    New-Item -ItemType "file" -Path "c:\Comun\Normas.txt", "c:\Comun\Evaluaciones.txt"
    for($a=1; $a -lt 201; $a++){
        $alumno = "Alumno$a"
        mkdir c:\Alumnos\$alumno
    }
    for($b=1; $b -lt 21; $b++){
        $profesor = "Profesor$b"
        mkdir c:\Profesores\$profesor
    }
}