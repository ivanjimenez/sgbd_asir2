#redireccion de entrada
mysql -u usuario -ppassword < script.sql

#redireccion de entrada y de salida
mysql -u root -ppassword < scriptIN.sql > resultado.txt

#redireccion de entrada con EOF
mysql -u root -ppassword <<EOF
   USE employees;
   SELECT count(*) from employees;
EOF

#filtrar las líneas por una palabra
ps -ef|grep mysqld

#imprimir los ficheros del directorio actual mayores de 10M
find . -size 10M -print

#borrar los ficheros con extensión log
find . -name '*.log' -delete

#listar todos los directorios de /direc
find /direc -type -d -ls

#borrar ficheros más antiguos de 30 días
find /direc/* -mtime +30 -exec rm {} \;


############################################################
# Sentencias condicionales

if [ condicion ]
then
    inst1
    inst2
fi

#---------------------
if [ condicion ]
then 
    inst1
    inst2
else
    inst1
    inst2
fi  

#---------------------
if [ condicion1 ]
then 
    inst1
    inst2
elif [ condicion2 ]
then 
    inst1
    inst2
else
    inst1
    inst2
fi 

#---------------------
case $var1 in
   valor1)
   	inst1
 	inst2
	;;
   valor2)
   	inst1
 	inst2
	;;
   *)
   	inst1
 	inst2
	;;
esac

#comprobar si un número es menor que otro
if ["$x" -lg "$y"]; then
	hacer_algo;
fi

#comprobar si existe un directorio
if [-d "$directorio"]; then
	echo "El directorio $directorio existe";
fi


#comprobar si no existe un fichero
if [! -f "$fichero"]; then
	echo "El fichero existe";
fi

#comprobar si el param1 es igual a "-copia"
if ["$1" = "-copia"]; then
	echo "Lo son";
fi



############################################################
# Funciones

function doblalo(){
	echo $(expr $1 \* 2)	
}

doblalo 33

