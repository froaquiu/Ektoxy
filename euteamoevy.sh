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

# Função para mostrar arte final + mensagem
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

# Coração em ASCII art
heart_ascii=("  **   **  "
             " ****** **** "
             "***********"
             " ********* "
             "  *******  "
             "   *****   "
             "    ***    "
             "     *     ")

# Tamanho do terminal
cols=$(tput cols)
lines=$(tput lines)

# Número de corações
num_hearts=4

# Inicializa posições aleatórias
declare -a x
declare -a y
declare -a dx
declare -a dy

for ((i=0;i<num_hearts;i++)); do
  x[i]=$((RANDOM % (cols-10))) # largura do coração ~10
  y[i]=$((RANDOM % (lines-8))) # altura do coração ~8
  dx[i]=$(( (RANDOM % 3) - 1 ))
  dy[i]=$(( (RANDOM % 3) - 1 ))
done

# Loop da animação
loops=5
for ((l=0;l<loops;l++)); do
  for ((t=0;t<20;t++)); do
    clear
    # Mostrar imagem
    chafa logo.jpg
    # Mostrar corações
    for ((i=0;i<num_hearts;i++)); do
      for ((k=0;k<${#heart_ascii[@]};k++)); do
        row=$((y[i]+k))
        col=$((x[i]))
        # Não ultrapassar borda inferior
        if [ $row -lt $lines ]; then
          tput cup $row $col
          echo -e "${heart_ascii[k]}" | lolcat -a -d 1
        fi
      done
      # Atualizar posição
      x[i]=$((x[i]+dx[i]))
      y[i]=$((y[i]+dy[i]))
      # Inverter direção se bater na borda
      (( x[i]<=0 || x[i]>=cols-10 )) && dx[i]=$(( -dx[i] ))
      (( y[i]<=0 || y[i]>=lines-8 )) && dy[i]=$(( -dy[i] ))
    done
    sleep 0.3
  done
done

# Mostra arte final
clear
show_ascii
