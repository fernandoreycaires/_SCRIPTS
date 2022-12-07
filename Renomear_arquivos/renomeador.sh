#!/bin/bash

# Exemplo de loop
#for i in 1 2 3 4 5;
#do
#	echo "counter: $i"
#	echo "-------"
#
#done

############################################
#  RENOMEAR ARUQIVOS EM MASSA
############################################

i=1;

for arquivo in renomear/*; #o * funciona como um ls 
 do

  echo "$i" - "$arquivo";
  cp "$arquivo" renomeado/Uma_Familia_da_Pesada_S05E"$i".mkv;

  i=$(($i+1));
done

############################################
#  LISTAR E INSERIR NOME EM UM ARQUIVO
############################################

i=0;

for arquivo in renomear/*; #o * funciona como um ls 
 do

  echo "$i" - "$arquivo";
  echo "$i" - "$arquivo" >> ARQUIVOS.TXT

  i=$(($i+1));
done

