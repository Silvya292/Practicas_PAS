#!/bin/bash

#Desarrolla un script que permita configurar los permisos de los ficheros y subdirectorios de una determinada carpeta de la siguiente forma:
##El directorio y todos los subdirectorios deberán tener todos los permisos para el usuario, lectura y ejecución para el grupo y ninguno para otros.
##Los archivos cuya extensión sea .sh deberán recibir permisos de ejecución para el usuario.
##Los ficheros con extensión .key deberán asegurarse, restringiendo los permisos de manera que sólo el usuario propietario pueda acceder a ellos.

if [ $# != 1 ]
then
    echo "ERROR, número de argumentos incorrecto."
elif [ -d $1 ]
then
    echo -e "Cambiando permisos de directorios...\n"
    chmod 750 $1
    chmod 750 $1/*
    echo $1
    for i in $(ls $1)
    do
        echo $1$i
    done
    echo -e "\nAñadiendo permisos de ejecución a scripts...\n"
    for i in $(ls $1)
    do
        chmod 100 $1$i/*.sh
        echo $1$i/*.sh
    done
    echo -e "\nRestringiendo permisos de ficheros de claves...\n"
    for i in $(ls $1)
    do
        chmod 700 $1$i/*.key
        echo $1$i/*.key
    done
else   
    echo "El directorio insertado no existe"
fi