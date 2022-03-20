#!/bin/bash

#Desarrolla un script que permita listar todos los ficheros de un directorio sin mostrar los sub-directorios pero incluyendo 
#los ficheros que estos puedan contener. El nombre del fichero deberá mostrar sin su ruta, solo incluyendo el nombre. 
#Además, se deberá añadir un número que indicará el orden de cada fichero y también otro número que indicará el número de caracteres del mismo

if [ $# != 1 ]
then
    echo "ERROR, número de argumentos incorrecto."
elif [ -d $1 ]
then
    nFile=$((1))
    for i in $(ls $1)
    do
        for j in $(ls $1$i)
        do
            echo -e "$nFile \t $j \t ${#j}"
            nFile=$(($nFile + 1))
        done
    done
else
    echo "El directorio insertado no existe"
fi