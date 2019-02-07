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
echo " Esse script irá criar um backup e sobrescrever o arquivo krb5.conf"
echo " Tem certeza que deseja continuar? [y]"
read continuar
if [ $continuar = "y"] 
	then echo "Finalizando"
	exit
fi

#instala x2go client from ppa
echo "Instalando X2Go"
sudo apt-add-repository -y ppa:x2go/stable
apt-get update
apt-get install -y x2goclient 


## Instala e configurar Kerberos
echo "Instalando Kerberos User"
apt-get install krb5-user
if [ -f /etc/krb5.conf ]; then
    echo "Criando backup do krb5.conf existente"
    cp /etc/krb5.conf krb5.conf.old
fi
cp krb5.conf /etc/krb5.conf


