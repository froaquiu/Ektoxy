#!/bin/bash

# Limpa o terminal
clear

# Verifica se o lolcat está instalado
if ! command -v lolcat &> /dev/null; then
    echo "Por favor, instale o lolcat para executar este script."
    exit 1
fi

if ! command -v figlet &> /dev/null; then
    echo "Por favor, instale o figlet para executar este script."
    exit 1
fi

function second_page {
    clear
    echo "Made by Assing" | lolcat
    echo "O terror do 712" | lolcat
    echo "Pressione qualquer tecla para voltar..."
    read -n 1 -s
}

function display_art {

    # Título "BULLDOZER" com lolcat
    figlet "712 Remote Acess
               Trojan" | lolcat
}

display_art

# Separador colorido em arco-íris
echo "================================================================================" | lolcat

# Menu de opções em russo
echo "Выберите устройство для инъекции трояна:" | lolcat
echo "1. Внедрить троян на Android" | lolcat
echo "2. Внедрить троян на iOS" | lolcat
echo "3. Внедрить троян на другие устройства" | lolcat
echo -n "Введите номер: " | lolcat
read OPTION

# Validar entrada do usuário
case $OPTION in
    1)
        echo "Вы выбрали: Внедрить троян на Android" | lolcat
        ;;
    2)
        echo "Вы выбрали: Внедрить троян на iOS" | lolcat
        ;;
    3)
        echo "Вы выбрали: Внедрить троян на другие устройства" | lolcat
        ;;
    *)
        echo "Ошибка: Неверный выбор. Попробуйте снова." | lolcat
        exit 1
        ;;
esac
