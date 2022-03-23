#!/bin/bash

#Desarrollar un script que reciba 3 argumentos: ruta, número de subdirectorios y longitud de los nombres de los ficheros
#Se creará un directorio principal en la ruta indicada, el nº indicado de subdirectorios con ficheros: .sh .html .key .txt
#Todo con nombres aleatorios

function getRandomName() {
    tr -dc A-Za-z0-9 < /dev/urandom | head -c $1
}

if [ $# != 3 ]
then
    echo "ERROR, número de argumentos incorrecto."
elif [ -d $1 ]
then
    echo "El directorio ya existe. ¿Desea eliminarlo? (s/n)"
    read response
    if [ $response == "s" ]
    then
        rm -r $1
        echo "Directorio eliminado."
        echo "Creando nuevo directorio..."
        mkdir $1
        for i in $(seq $2)
        do
            subName="$(getRandomName "$3")"
            mkdir $1/$subName
            for i in .sh .html .key .txt
            do
                fileName="$(getRandomName "$3")"
                touch $1/$subName/$fileName$i
            done
        done
        echo "Nuevo directorio creado"
    fi
else
    mkdir $1
    for i in $(seq $2)
    do
        subName="$(getRandomName "$3")"
        mkdir $1/$subName
        for i in .sh .html .key .txt
        do
            fileName="$(getRandomName "$3")"
            touch $1/$subName/$fileName$i
        done
    done
    echo "Directorio creado correctamente"
fi