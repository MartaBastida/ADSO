$prof = "c:\Profesores\"
    for($b=1; $b -lt 21; $b++){
        $profesor = "Profesor$b"
        $profe = "Prof$b"
        Rename-Item -Path C:\Profesores\$profesor -NewName C:\Profesores\$profe -Force
    }



