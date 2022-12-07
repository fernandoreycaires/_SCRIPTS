#!/bin/bash

# exemplos https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
# Comando que busca a timestamp
# Neste caso com 
# %T hora hh:mm:ss também pode-se usar %H-%M para hora-minuto
# %d-%m-%y dia-mes-ano

date +"%T %d-%m-%y"
date +"%H-%M"

# Define a timestamp function para executar em um script corrido, com timestamps diferentes
timestamp() {
  date +"%T %m-%d-%y"
}

# do something...
timestamp # print timestamp
# do something else...
timestamp # print another timestamp
# continue...
