#!/bin/bash

# Limpa a tela
clear

# Define cores
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

# Arte ASCII da aranha
echo -e "${RED}          (\n\
           )\n\
          (\n\
     /\  .-\"\"\"-.\n\
    //\\/  ,,,  \\\\\n\
    |/\| ,;;;;;, |\n\
    //\\\;-\"\"\"-;///\n\
   //  \\/   .   \\/\n\
  (| ,-_| \\ | / |_-, )\n\
    //\`__\\.-.-./__\`\\\\\n\
   // /.-(() ())-.\ \\\\\n\
  (\\ |)           (| /)\n\
   \` (|           |) \`\n\
     \\)           (/ ${NC}"

# Texto grande "712"
echo -e "${RED}$(figlet -f slant 712)${NC}"

# Divisão
echo -e "${RED}==============================${NC}"

# Texto grande "ektoxy"
echo -e "${RED}$(figlet -f slant ektoxy)${NC}"

# Segunda divisão
echo -e "${RED}==============================${NC}"

# Mensagens adicionais
echo -e "${RED}Bem-vindo ao Meu Programa!${NC}"
echo -e "${RED}Escolha uma opção:${NC}"
echo "1. Brute force"
echo "2. Sql injection"
echo "3. Sair"

read opcao
