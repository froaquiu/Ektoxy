#!/bin/bash

# Verifica se chafa está instalado
if ! command -v chafa &> /dev/null
then
    echo "Chafa não está instalado. Instale com: sudo apt install chafa"
    exit
fi

# Verifica se figlet está instalado
if ! command -v figlet &> /dev/null
then
    echo "Figlet não está instalado. Instale com: sudo apt install figlet"
    exit
fi

# Função para mostrar a arte final + mensagem
show_ascii() {
echo -e "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡾⢏⠉⣷⠀⠀⠀⠀⠀⢀⣀⣀⣀⣶⣆⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣠⣤⣤⣴⣶⣟⣡⣤⣬⣧⣽⣆⣠⡴⠖⠛⠉⠉⠁⠀⠀⠀⠀⠉⠉⠙⠓⠶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠶⠛⠉⠉⠀⠀⠈⠈⣿⡏⢡⠤⢐⣶⡦⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢋⣉⣉⣉⡙⠓⣶⠄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠞⠫⠀⠀⠀⠀⠀⠀⠀⠀⢤⡏⣷⠈⣆⡺⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⠀⣰⢉⡿⠀
⠀⠀⠀⠀⠀⠀⠀⣰⢟⠅⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠸⣼⣧⡈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⠃⣼⠁⠀
⠀⠀⠀⠀⠀⣀⡼⡣⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢾⡃⠀⠀
⠀⢀⣠⠶⠛⠉⠨⠕⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⠀⠀
⢰⣿⢁⠄⠀⢠⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⣿⠀⠀⠀⠀⠀⢀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀
⠈⠻⣦⣀⢂⡍⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡇⠂⠀⠀⠀⠀⠹⣿⡟⠉⠀⣀⣠⡀⣀⠀⠀⢸⣿⣶⠶⠀⠀⠀⠀⠀⠀⠀⢰⠀⣿⠀⠀
⠀⠀⠀⠉⢿⣿⠆⠀⠀⠀⠆⢀⣿⡶⠀⠀⢀⣿⣸⠶⠿⠉⣿⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠉⡏⣿⠇⠀⠀⠀⢿⠇⠀⠀⠀⠀⠀⠀⠀⠀⡇⢀⡇⠀⠀
⠀⠀⠀⠀⠀⣿⡀⠀⠀⠀⠀⢾⣿⡿⠀⠀⢚⣽⡉⠀⠁⠀⢺⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣷⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠞⠀⣼⠃⠀⠀
⠀⠀⠀⠀⠀⠨⣷⡀⠀⡆⠀⠂⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣻⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠋⢀⡼⠃⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠸⣷⢀⠐⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢎⡿⠦⢤⣀⣀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢤⠤⣊⣁⣠⠴⠋⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠹⣦⠐⠀⠀⠀⠀⠀⠀⠀⠀⠂⢤⠀⠀⠀⠀⠘⢷⣀⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⡛⢻⡉⠉⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠶⣤⣄⣀⣠⣤⣤⡶⠾⠻⡀⠀⠀⠀⠀⠀⠉⠛⠲⠶⣤⣤⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢎⠻⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⡀⠀⡿⡠⠀⠀⠀⠀⠀⢸⡄⢀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡎⠙⣦⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠃⣼⠣⠃⠀⠀⠀⠀⠀⢸⡇⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢃⣘⣻⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣘⣧⣤⠾⡱⠀⠀⠀⠀⠀⠀⠀⡜⢀⣄⣷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⢸⡉⠙⢶⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡏⠉⠈⠉⠉⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠾⠀⢸⠿⡆⠀⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⢯⣆⣀⣀⣀⣀⣀⣀⣀⣀⣀⣂⣀⣌⣷⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣃⣤⠾⠋⢠⡇⡀⣿⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠈⠀⠀⠉⠉⠉⠁⠁⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠉⠉⠀⠀⠀⠈⠛⠟⠁⠀⠀⠀⠀
" | lolcat

figlet -f Hellcat "EU TE AMO EVELLYN" | lolcat
}

# Frames do coração (simples)
heart="❤"

# Obter tamanho do terminal
cols=$(tput cols)
lines=$(tput lines)

# Número de corações na tela
num_hearts=7

# Gerar posições iniciais aleatórias
declare -a x
declare -a y
declare -a dx
declare -a dy

for ((i=0;i<num_hearts;i++)); do
  x[i]=$((RANDOM % cols))
  y[i]=$((RANDOM % lines))
  dx[i]=$(( (RANDOM % 3) - 1 )) # movimento horizontal -1,0,1
  dy[i]=$(( (RANDOM % 3) - 1 )) # movimento vertical -1,0,1
done

# Loop principal (corações girando/flutuando)
loops=5
for ((l=0;l<loops;l++)); do
  for ((t=0;t<20;t++)); do
    clear
    # Mostrar imagem
    chafa logo.jpg
    # Mostrar corações
    for ((i=0;i<num_hearts;i++)); do
      tput cup ${y[i]} ${x[i]}
      echo -e "$heart" | lolcat -a -d 1
      # Atualizar posição
      x[i]=$((x[i]+dx[i]))
      y[i]=$((y[i]+dy[i]))
      # Inverter direção se bater na borda
      (( x[i]<=0 || x[i]>=cols )) && dx[i]=$(( -dx[i] ))
      (( y[i]<=0 || y[i]>=lines )) && dy[i]=$(( -dy[i] ))
    done
    sleep 0.2
  done
done

# Exibe arte + mensagem final
clear
show_ascii
