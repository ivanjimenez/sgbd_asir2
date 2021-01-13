#!/bin/bash

# cálculo de expresiones
variable=`expr 1+2`

# mostrar mensajes informativos
echo "Esto es un mensaje con una variable $var"

# determinar el tipo de fichero
file fichero.txt

# eliminar la ruta y obtener el nombre del fichero
basename /usr/mysql51/bin/mysql

# obtener la ruta
dirname /usr/mysql51/bin/mysql

# contar el número de líneas de un fichero
wc -l fichero.txt

# obtener ruta actual
pwd

# leer una variable de teclado
read variable

# crear un fichero en blanco
touch fichero.txt

# copiar un fichero
cp origen destino

# mover/renombrar un fichero
mv origen destino

# borrar un fichero
rm fichero

# borrar un directorio y su contenido
rm -rf directorio

#######################################################################
# para obtener en una variable el resultado de ejecución de un comando
var=`comando`
echo $var

var=$(comando)
echo $var

#######################################################################
# operaciones con tiempos

time comando                            # tiempo de ejecución de un comando
fecha=`date +%Y-%m-%d`                  # fecha en formato yyyy-mm-dd
fecha=`date +%Y-%m-%d:%H:%M:%S`         # fecha en formato yyyy-mm-dd hh:mm:ss
T="$(date +%s)"                         # obtener timestamp en segundos

# diferencia respecto a un timestamp anterior
T="$(($(date +%s)-T))"
echo "Tiempo en segundos: $T"

#######################################################################
# cómo encadenar comandos

# se ejecuta comando1 y si va bien se ejecuta comando2
comando1 && comando2

# se ejecuta comando 1 y si va mal se ejecuta comando2
comando1 || comando2

# como mostrar si un script terminó bien o no
exit 0 #bien
exit 1 #mal cualquier valor diferente a 0

#######################################################################
# paso de parámetros a un script
# Si se ha ejecutado esto:     script.sh param1 param2

echo $0        # imprimir el nombre del script lanzado
echo $1	       # imprimir el primer parámetro
echo $#	       # imprimir el número total de parámetros
echo $*        # imprimir todos los parámetros

#######################################################################
# variables que se pueden consultar

echo $SHELL
echo $RANDOM   # un número aleatorio
echo $$        # el número de PID actual
echo $?        # el código de retorno del último comando
echo $!        # el PID del útlimo proceso ejecutado en background

