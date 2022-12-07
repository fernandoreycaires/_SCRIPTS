#!/bin/bash

echo "=================================="
echo "Atualizando repositorio"
echo "=================================="
echo ""

apt update

echo ""
echo "=================================="
echo "Instalando a ferramenta mariadb-backup"
echo "=================================="
echo ""

apt install mariadb-backup -y

echo ""
echo "=================================="
echo "Criando diretorio para salvar o backup"
echo "=================================="
echo ""
# variavel para diretorio onde backup será enviado, 
# se quiser alterar o local onde será enviado os backup, 
# altere aqui
BACKUPDIR="/tmp/BKP_MariaDB"

# Se diretório não existe, crie.
if [ ! -d "$BACKUPDIR" ]; then
    mkdir "$BACKUPDIR"
fi

echo ""
echo "Criado com sucesso."
echo ""
echo "=================================="
echo "Agora será executado o backup para dentro de $BACKUPDIR"
echo "=================================="
echo ""

#aqui busca a data e hora para adcionar no arquivo e armazena em uma variavel
DIRETORIO=backup_mariadb_$(date +"%Y-%m-%d_%H_%M")
echo "Nome do sub-diretório : ""$DIRETORIO"
#aqui ele cria um diretorio com a data e a hora, dentro do diretorio principal dos backups
mkdir /tmp/BKP_MariaDB/"$DIRETORIO"

#aqui é executado o camando de backup e direcionado para o doretorio recem criado
mariabackup --backup --target-dir /tmp/BKP_MariaDB/"$DIRETORIO" -u root

echo ""
echo "=================================="
echo "Backup concluido"
echo "localizado em ""$BACKUPDIR""/"""$DIRETORIO""
echo "=================================="