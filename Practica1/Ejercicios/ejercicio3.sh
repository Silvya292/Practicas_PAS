#!/bin/bash

#Desarrolla un script que permita realizar una copia de seguridad de un determinado directorio y almacenarla en un fichero comprimido. 
#El programa deberá recibir dos argumentos:
##1. Directorio que se va a copiar.
##2. Directorio donde se almacenará la copia comprimida.
#El nombre del fichero de copia resultante deberá seguir el formato: nombredirectoriooriginal_AñoMesDia.tar.gz

if [ $# != 2 ]
then
    echo "Argumentos incorrectos. Uso: ./ejercicio3.sh <directorio_origen> <directorio_destino>."
elif [ -d $1 ]
then
    fecha=$(date +"%Y%m%d")
    nameZip=$1_$fecha.tar.gz
    if [ -d $2 ]
    then
        if [ -f $2/$nameZip ]
        then
            echo "Ya se ha realizado esta copia hoy ($2/$nameZip)"
        else
            tar -czf $nameZip $1/*
            mv $nameZip $2/
            echo -e "Copia realizada en $2/$nameZip"
        fi
    else
        echo -e "Creando directorio de destino..."
        mkdir $2
        tar -czf $nameZip $1/*
        mv $nameZip $2/
        echo "Copia realizada en $2/$nameZip"
    fi
else
    echo "El directorio insertado no existe"
fi

