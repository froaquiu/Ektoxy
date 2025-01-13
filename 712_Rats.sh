#!/bin/bash

clear

# Função para imprimir texto em cores do arco-íris
function rainbow_text {
    # Definir as cores do arco-íris
    COLORS=(
        '\033[0;31m'  # Vermelho
        '\033[0;33m'  # Laranja
        '\033[0;32m'  # Verde
        '\033[0;36m'  # Ciano
        '\033[0;34m'  # Azul
        '\033[0;35m'  # Roxo
    )
    NC='\033[0m' # Resetar a cor

    # Texto a ser colorido
    TEXT="$1"
    TEXT_LENGTH=${#TEXT}

    # Loop sobre o texto e aplicar as cores
    for ((i=0; i<TEXT_LENGTH; i++)); do
        COLOR=${COLORS[$((i % ${#COLORS[@]}))]}
        echo -ne "${COLOR}${TEXT:$i:1}${NC}"
    done
    echo ""  # Nova linha no final
}

# Arte ASCII antiga (original)
rainbow_text "
               _                       __
              /   \\                  /      \\
             '      \\              /          \\
            |       |Oo          o|            |
            \`    \\  |OOOo......oOO|   /        |
             \`    \\\\OOOOOOOOOOOOOOO\\//        /
               \\ _o\\OOOOOOOOOOOOOOOO//. ___ /
           ______OOOOOOOOOOOOOOOOOOOOOOOo.___
            --- OO'* \`OOOOOOOOOO'*  \`OOOOO--
                OO.   OOOOOOOOO'    .OOOOO o
                \`OOOooOOOOOOOOOooooOOOOOO'OOOo
              .OO "OOOOOOOOOOOOOOOOOOOO"OOOOOOOo
          __ OOOOOO\`OOOOOOOOOOOOOOOO’OOOOOOOOOOOOo
         ___OOOOOOOO_'OOOOOOOOOOO'_OOOOOOOOOOOOOOOO
           OOOOO^OOOO0\`(____)/'OOOOOOOOOOOOO^OOOOOO
           OOOOO OO000/00||00\\000000OOOOOOOO OOOOOO
           OOOOO O0000000000000000 ppppoooooOOOOOO
           \`OOOOO 0000000000000000 QQQQ ’OOOOOOO'
            o’OOOO 000000000000000oooooOOoooooooO'
            OOo’OOOO.00000000000000000000OOOOOOOO'
           OOOOOO QQQQ 0000000000000000000OOOOOOO
          OOOOOO00eeee00000000000000000000OOOOOOOO.
         OOOOOOOO000000000000000000000000OOOOOOOOOO
         OOOOOOOOO00000000000000000000000OOOOOOOOOO
         \`OOOOOOOOO000000000000000000000OOOOOOOOOOO
           'OOOOOOOO0000000000000000000OOOOOOOOOOO'
             'OOOOOOO00000000000000000OOOOOOOOOO'
  .ooooOOOOOOOo’OOOOOOO000000000000OOOOOOOOOO0'
.OOO''''''''''.oOOOOOOOOOOOOOOOOOOOOOOOOOOOOo
OOO         QQQQO"'                     \`QQQQ
OOO
\`OOo.
  \'OOOOOOOOOOOOoooooooo....
"

# Nova arte ASCII do título
rainbow_text "
8888888888  d888    .d8888b.       8888888b.                                 888
      d88P d8888   d88P  Y88b      888   Y88b                                888
     d88P    888          888      888    888                                888
    d88P     888        .d88P      888   d88P .d88b.  88888b.d88b.   .d88b.  888888 .d88b.        8888b.   .d8888b .d88b.  .d8888b  .d8888b
 88888888    888    .od888P"       8888888P" d8P  Y8b 888 "888 "88b d88""88b 888   d8P  Y8b          "88b d88P"   d8P  Y8b 88K      88K
  d88P       888   d88P"           888 T88b  88888888 888  888  888 888  888 888   88888888      .d888888 888     88888888 "Y8888b. "Y8888b.
 d88P        888   888"            888  T88b Y8b.     888  888  888 Y88..88P Y88b. Y8b.          888  888 Y88b.   Y8b.          X88      X88
d88P       8888888 888888888       888   T88b "Y8888  888  888  888  "Y88P"   "Y888 "Y8888       "Y888888  "Y8888P "Y8888   88888P'  88888P'

           88888888888               d8b
               888                   Y8P
               888
               888  888d888 .d88b.  8888  8888b.  88888b.
               888  888P"  d88""88b "888     "88b 888 "88b
               888  888    888  888  888 .d888888 888  888
               888  888    Y88..88P  888 888  888 888  888
               888  888     "Y88P"   888 "Y888888 888  888
                                     888
                                    d88P
                                  888P"
"

# Separador colorido em arco-íris
rainbow_text "================================================================================"

# Menu de opções em russo
rainbow_text "Выберите устройство для инъекции трояна:"
rainbow_text "1. Внедрить троян на Android"
rainbow_text "2. Внедрить троян на iOS"
rainbow_text "3. Внедрить троян на другие устройства"
echo -n "Введите номер: "
read OPTION

# Validar entrada do usuário
case $OPTION in
    1)
        rainbow_text "Вы выбрали: Внедрить троян на Android"
        # Aqui você pode adicionar comandos específicos para Android
        ;;
    2)
        rainbow_text "Вы выбрали: Внедрить троян на iOS"
        # Aqui você pode adicionar comandos específicos para iOS
        ;;
    3)
        rainbow_text "Вы выбрали: Внедрить троян на другие устройства"
        # Aqui você pode adicionar comandos específicos para outros dispositivos
        ;;
    *)
        rainbow_text "Ошибка: Неверный выбор. Попробуйте снова."
        exit 1
        ;;
esac

# Placeholder para executar "rats"
rainbow_text "Запуск программы 'rats'..."
rats "$@"

# Verificar sucesso ou falha
if [ $? -eq 0 ]; then
    rainbow_text "Инъекция успешно выполнена!"
else
    rainbow_text "Произошла ошибка при выполнении инъекции."
    exit 1
fi
