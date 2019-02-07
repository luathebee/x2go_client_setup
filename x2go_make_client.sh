#!/bin/bash

## configura cliente X2go

#verificação de root
if [ "$EUID" -ne 0 ]
  then echo "Executar como administrador"
  exit
fi

echo "----------------------------------"
echo "-----------A V I S O--------------"
echo "----------------------------------"
echo " Esse script irá sobre escrever o arquivo krb5.conf"
echo " Tem certeza que deseja continuar? [y]"
read continuar
if [continuar == "y"] 
	then echo "Finalizando"
	exit
fi



#instala x2go client from ppa
echo "Instlando X2Go"
sudo apt-add-repository -y ppa:x2go/stable
apt-get update
apt-get install -y x2goclient 
echo "Instalado gg ez"

sudo apt-get install krb5-user
