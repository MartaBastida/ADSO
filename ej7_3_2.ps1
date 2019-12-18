# Creamos la estructura de directorios
New-Item -ItemType "directory" -Path "c:\Ejercicio3" -Force
New-Item -ItemType "directory" -Path "c:\Ejercicio3\Musica", "c:\Ejercicio3\Documentos" -Force
New-Item -ItemType "file" -Path "c:\Ejercicio3\Musica\discos.txt", "c:\Ejercicio3\Musica\grupos.doc" -Force
New-Item -ItemType "directory" -Path "c:\Ejercicio3\Documentos\Personal", "c:\Ejercicio3\Documentos\Trabajo" -Force
New-Item -ItemType "file" -Path "c:\Ejercicio3\Documentos\Personal\apuntes.txt", "c:\Ejercicio3\Documentos\Personal\proyecto.doc", "c:\Ejercicio3\Documentos\Personal\viaje.jpg" -Force
New-Item -ItemType "file" -Path "c:\Ejercicio3\Documentos\Trabajo\anuncio.txt" -Force