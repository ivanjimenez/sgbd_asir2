#!/bin/bash

# variables a personalizar
user=root
passwd=root

# procesamos los parámetros
while [ $1 ]; do
   param=${1%=*}   # obtenemos el parámetro
   valor=${1#*=}   # obtenemos el valor del parámetro

   if [ $param = "--basedatos" ]; then
	basedatos=$valor
   fi

   shift
done

# formación de la query administrativa
query="select concat('ALTER TABLE ', table_schema,'.',table_name,' engine=InnoDB;')"
query="$query from information_schema.tables where engine='MYISAM'"

# Si se seleccionó una base de datos en concreto, se agrega el filtro
if [ -z $basedatos ]; then
   query="$query and table_schema not in ('information_schema','mysql');"
else
   query="$query and table_schema='$basedatos'"
fi

# La salida del 1er comando mysql (múltiples queries) se encadena con otro mysql
echo $query|mysql -u $user -p$passwd -s <consulta.sql |mysql -u $user -p$passwd -vvv
