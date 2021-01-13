#!/bin/bash

# Genera un backup lógico en caliente de todas las bbdd
# mandando cada copia de seguridad comprimida por correo.

#tamaño máximo para envio de emails en MG
tam_max_email=10

if [ $# -ne 5]; 
then
	echo "Error, el número de parámetros debería ser 5 y es "$#
	echo "Uso: BackupLCC.sh usuario password host destino email"
	exit 1
else
    # preparamos las variables
	usuario=$1
	password=$2
	host=$3
	destino=$4
	email=$5
	fecha=`date + "%d%m%Y"`
	
	if [ ! -d $destino];
	then
		echo "El directorio destino no existe."
		exit 1
	else
		#obtener la lista de bbdd
		# -Bse significa "ejecución silenciosa de bash"
		for bbdd in `mysql -u $usuario -p $password -h $host -Bse 'show databases'`
		do
			if [ $bbdd = "information_schema" ]; then
				echo "saltando catálogo ... "
			else
				fichero="$destino/${bbdd}_${fecha}_${host}.gz"
				echo "Realizando backup de $bbdd en $fichero"
				mysqldump -u $usuario -h $host -p $password $bbdd |gzip -9 > $fichero
				
				#se envía por correo si el tamaño no es superior al definido
				tam_actual=`ls -l $fichero | awk {'print $5'}`
				tam_actual=`expr $tam_actual /1024 /1024`  #en megas
				if [ $tam_actual -lt $tam_max_email ]; then
					echo "Enviando backup de $bbdd a $email"
					uuencode $fichero $fichero | mail -s "Backup $bbdd $fecha" $email
				fi
			fi
		done	
	fi
fi
exit 0