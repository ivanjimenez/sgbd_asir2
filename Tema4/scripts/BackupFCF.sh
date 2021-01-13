#!/bin/bash
##################################################################################
# Genera un backup físico en frío de todas las bbdd:
# - para la base de datos
# - agrupa y comprime todos los ficheros y directorios del directorio de datos
# - lanza un nuevo arranque de la base de datos
# - envía por correo la copia de seguridad comprimida

# El script se invoca: BackupFCF.sh --destino=ruta --email=correo       
# destino es obligatorio; email es opcional
##################################################################################

#variables útiles para configurar el script
servicio="mysqld"		# servicio a parar/arrancar
data_dir="/var/lib/mysql/datos"	# directorio donde están los ficheros de datos

# el script debe ser ejecutado por root
usuario='whoami'
if [ $usuario != "root" ]; then
then
	echo "Debes ser root para ejecutar este script"
	exit 1
fi

# procesamos los parámetros
while [ $1 ]; do
	param=${1%=*} 	# obtenemos el parámetro
	valor=${1#*=} 	# obtenemos el valor del parámetro

	if [ $param = "--email" ]; then
	   email=$valor
	fi

	if [ $param = "--destino" ]; then
	   destino=$valor
	fi

	shift # rotamos
done

# si no se indicó el destino --> salir
if [ -z $destino ]; then
   echo "USO: BackupFCF.sh --destino=ruta --email=correo "
   exit 1
fi

touch $destino
if [ $? -ne 0 ]; then
   echo "El destino no es válido"
   exit 1
fi

# paramos el gestor de base de datos
echo "Parando el demonio del gestor de la bd"
service $servicio stop

# guardamos los ficheros del directorio datadir
echo "Comprimiendo ..."
tar -cvf $destino $datadir

# arrancamos la base de datos
echo "Reiniciando el demonio del gestor de la bd"
service $servicio start

# enviando email ...
if [ $email != "" ]; then
   fecha=$(date +%Y-%m-%d)
   tamano=$(stat -c %s $destino)
   if [ $tamano -lt 10485760 ]; then  # máximo 10M
      uuencode $destino $destino|mail -s "Backup frío, físico del $fecha" $email
   else
      echo "El archivo es demasiado grande para el correo"
   fi
fi

exit 0
