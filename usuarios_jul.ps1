$usuarios=Import-Csv -Path c:\usuarios.csv
	foreach  ($i in $usuarios)
	{
		$clave=ConvertTo-SecureString $i.contra -AsPlainText -Force
		New-LocalUser $i.nombre -Password $clave -AccountNeverExpires -PassNeverExpires
		Add-LocalGroupMember -Group usuarios -Member $i.nombre
        break
	}

