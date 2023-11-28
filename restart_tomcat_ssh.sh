#!/bin/bash

# Servidores de destino
SERVIDORES=("ip_01" "ip_02" "ip_03" "ip_04")

# Nome de usuário SSH
# USUARIO_SSH="usuario"
echo "Insira o usuario: "
read USUARIO_SSH
# Senha SSH
# SENHA_SSH="senha do usuario"
echo "Insira a senha: "
read SENHA_SSH

# echo "Usuario: ${USUARIO_SSH}" 
# echo "Senha: ${SENHA_SSH}" 

# Porta SSH
PORTA_SSH="1044"

# Comando para parar o Tomcat
STOP_CMD="/usr/local/apache-tomcat/bin/catalina.sh stop"

# Comando para iniciar o Tomcat
START_CMD="/usr/local/apache-tomcat/bin/catalina.sh start"

# Iterar sobre os servidores
for SERVIDOR in "${SERVIDORES[@]}"; do
    echo "Parando o Tomcat em ${SERVIDOR}..."
    sshpass -p "${SENHA_SSH}" ssh -o StrictHostKeyChecking=no -l ${USUARIO_SSH} -p ${PORTA_SSH} ${SERVIDOR} "${STOP_CMD}"

    # Verificar se o comando de parada foi bem-sucedido
    if [ $? -eq 0 ]; then
        echo "Tomcat parado com sucesso em ${SERVIDOR}. Iniciando agora..."
        sshpass -p "${SENHA_SSH}" ssh -o StrictHostKeyChecking=no -l ${USUARIO_SSH} -p ${PORTA_SSH} ${SERVIDOR} "${START_CMD}"
    else
        echo "Erro ao parar o Tomcat em ${SERVIDOR}. Verifique o servidor."
    fi
done

