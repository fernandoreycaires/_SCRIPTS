#!/bin/bash

# Verifica se o número correto de argumentos foi fornecido
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <arquivo_de_entrada>"
    exit 1
fi

# Armazena o nome do arquivo de entrada
arquivo_entrada=$1

# Verifica se o arquivo de entrada existe
if [ ! -f "$arquivo_entrada" ]; then
    echo "O arquivo de entrada $arquivo_entrada não existe."
    exit 1
fi

# Cria um novo arquivo de saída
arquivo_saida="${arquivo_entrada}_modificado"
touch "$arquivo_saida"

# Adiciona "DENY" no início e ";" no final de cada linha
while IFS= read -r linha; do
    echo "DENY${linha};" >> "$arquivo_saida"
done < "$arquivo_entrada"

echo "Operação concluída. Resultado salvo em $arquivo_saida."

# De permição de execução no script
# chmod +x editar_linhas_arquivo_texto.sh
# Para executar
# ./editar_linhas_arquivo_texto.sh arquivo_de_texto.txt
