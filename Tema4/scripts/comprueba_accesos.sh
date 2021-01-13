#!/bin/bash

# variables a personalizar
mycnf="/etc/my.cnf"

# procesamos los parámetros
while [ $1 ]; do
   param=${1%=*}   # obtenemos el parámetro
   valor=${1#*=}   # obtenemos el valor del parámetro

   if [ $param = "--fecha" ]; then
	fecha=$valor
   fi

   shift
done

# si no se indicó el destino --> salir
if [ -z $destino ]; then
   echo "USO: comrpueba_accesos.sh --fecha=dia "
   echo "El formato del día ha de ser yymmdd"
   exit 1
fi

# se comprueba si el general_log=1
log='cat $mycnf | grep "general_log[= ]"'
log=${log#*=}
if [ "$log" -eq 1 ]; then
   echo "Log activado ...OK"
else
   echo "El log general no está activado en el servidor"
   exit 1
fi

# se comprueba si existe el fichero de log
logfile='cat $mycnf | grep "general_log_file"'
echo "procesando el fichero $logfile ..."
logfile=${logfile#*=}

if [ -f $logfile ]; then
   # COMPROBAR INTENTOS DE CONEXIÓN
   # se filtra por fecha y acceso denegado
   n='cat $logfile | grep $fecha | grep "Access denied" | wc -l'
   echo "......................................................."
   echo "Número total de conexiones permitidas $n"
   echo "......................................................."
   cat $logfile | grep $fecha | grep "Connect" | grep -v "Access denied"
else
   echo "No encuentro el fichero de log $logfile"
   exit 1
fi

exit 0


