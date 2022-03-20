#!/bin/bash

#Desarrollar un script que reciba como parámetros la ruta de un directorio y un número entero N de horas, y liste todos los ficheros 
#que se encuentren dentro de dicho directorio que hayan sido modificados en las N horas anteriores.

if [ $# != 2 ]
then
    echo "Argumentos incorrectos. Uso: ./ejercicio5.sh <ruta_directorio> <num_horas>"
elif [ -d $1 ]
then
    nHoras=$(($2 * 60))
    for i in $(ls $1)
    do
        echo "$(find $1$i -type f -mmin -$nHoras)"
    done
else
    echo "El directorio insertado no existe"
fi