#!/bin/bash
#ctrlsrv.sh
#JOEL SALVADOR MARCOS

mostra_serveis () { 

clear
local opcion
echo " Escoja una opcion "
echo "1. apache"
echo "2. cups"
echo "3. ssh"
echo "4. Salir"
echo -n "Seleccione una opcion [1 - 4]"

read opcion

cntrl_serveis $opcion
}

cntrl_serveis () {

case $1 in 
    1) 
        echo "Apache2";
        systemctl start apache2
        exit 2
        ;;
    2)
        echo "CUPS";
        systemctl start cups
        ;;
    3)
        echo "SSH";
        systemctl start ssh
        ;;
    4)
        echo "Has salido";
        ;;
    *) 
        echo "$opc Es una opcion invalida, selecciona el número 1, 2, 3 o 4";
        ;;

esac

}

clear
if (( EUID != 0 ))
then
  echo "Ejecutalo con root"
  exit 9
fi

mostra_serveis
