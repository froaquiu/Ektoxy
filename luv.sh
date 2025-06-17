import os
import time
import shutil
import subprocess

def clear():
    os.system('clear' if os.name == 'posix' else 'cls')

def center_text(text):
    terminal_width = shutil.get_terminal_size().columns
    lines = text.split('\n')
    centered_lines = []
    for line in lines:
        stripped_line = line.rstrip('\n')
        padding = max((terminal_width - len(stripped_line)) // 2, 0)
        centered_lines.append(' ' * padding + stripped_line)
    return '\n'.join(centered_lines)

heart1 = r"""
⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠤⢥⠤⠀⠀⠀⠀⠀⠀⠀⢀⣠⡞⠳⣄⠀⠀⠀⠀⠀⠀⢀⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⠀⠀⠀⠀⠀⠀⠤⣶⣛⠉⠀⠀⢈⡳⠖⠀⠀⠀⠀⠘⠚⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡀⣰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⠤⠀⣧⠇⠀⠐⠦⢤⣀⠀⠀⠀⠀⢀⣤⠖⠒⠛⠛⠓⠂⠀⠶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⡶⠋⢀⡀⠀⠀⢻⠀⠀⠀⠤⡀⠈⠳⣄⣀⡴⠋⢀⠔⠈⠉⢉⣱⠀⢀⠤⡄⠈⠳⣤⠠⠤⠦⢤⡀⠀
⠀⠀⠀⠀⠀⣰⠋⢀⡔⠁⣸⠀⠀⠈⠀⠀⠀⠀⠘⢂⠀⠘⠋⠀⠐⠇⠰⠂⠉⠁⠀⠀⠈⠉⠀⠀⢠⠘⣧⠀⠀⠀⢻⡆
⠀⠀⠀⠀⠀⡟⠀⡼⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⢸⡄⠀⠀⣼⠇
⠀⠀⠀⠀⠸⡇⠀⠣⣀⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠄⣸⠀⢀⣼⠋⠀
⠀⠀⠀⠀⠀⣷⠀⢀⡄⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢀⣯⡾⠛⠀⠀⠀
⠀⠀⠀⠀⠀⠹⣷⠀⠑⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⢀⣠⢷⡟⠁⠀⠀⠀⠀
⠀⠀⠀⠀⡇⠀⠹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢱⡀⠀⠀⠉⢰⡏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠉⠁⠆⠉⠀⢙⣷⣄⠰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠶⣚⠁⠀⢙⡶⢃⡴⠋⠀⢀⠀⠀⠀⠀⠀⠀
⠀⣠⠄⠀⠀⢀⣴⠋⠀⠙⢦⡙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⠀⠀⠀⠀⠈⠳⡀⡜⡠⠊⠀⠀⣀⡘⣁⣀⠀⠀⠀⠀
⠀⠐⠁⠀⢀⡏⡏⠀⠀⠀⠀⠙⠶⣌⠓⠄⣀⠀⠀⠀⠀⡀⠼⣀⣀⠀⠀⠀⠀⠀⣷⠁⠀⠀⠀⠀⠀⠸⠇⠀⠀⠀⠀⠀
⠸⣁⡇⠀⠸⡇⠣⣀⠀⠀⠀⠀⠀⠈⠻⣦⣉⣄⡤⠔⠂⠀⠸⠀⠀⠀⠀⢀⡴⠒⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠙⠶⢤⣭⣴⣦⣶⡾⠾⠟⠛⠙⢷⣄⡀⠀⠀⠀⠀⢀⡤⠞⠉⠀⠀⠀⢀⣠⣎⡁⢲⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡒⡂⠀⠈⠛⠲⣄⡴⠞⠁⠀⠀⠀⠀⠀⠀⠨⡌⢪⡿⠚⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠉⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠰⣉⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"""

heart2 = r"""
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡶⠶⢦⣄⠀⠀⠀⠀⠀⣴⠟⠛⢧⣠⣶⣿⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⡟⠦⠌⠛⠉⠉⠉⢹⠇⢠⣶⣼⣷⣞⢙⣧⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣤⠃⠀⠀⠀⠀⠀⠀⣿⠀⠈⢻⡃⠀⢸⡿⡄⠈⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠘⠷⠖⠛⠛⠛⢿⡗⢋⣴⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⢻⡀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡶⠾⣷⠆⠀⠀⣤⡀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡀⠀⠐⢺⡟⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⢿⡦⠀⠀⠛⠃⠀⠀⢠⢶⣄⠀⠀⠈⠛⠀⠀⠀⣺⠓⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣼⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡿⣖⡀⣀⣀⡀⠀⠈⠉⠉⠀⠀⣀⣀⣀⠀⣲⣯⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠶⡆
⢻⡈⠻⣦⣀⣀⣀⣀⣀⠀⠀⠀⠁⣴⠟⠉⠁⠀⠉⠛⢦⡀⢀⡴⠛⠉⠁⠈⠙⠻⣄⠀⠁⣀⣠⣤⣤⣤⣤⡤⠖⠋⣸⠇
⡿⠳⣤⣀⡀⠀⠀⠉⠉⠉⠳⢦⣼⠃⠀⠀⠀⠀⠀⠀⠀⠿⠋⠀⠀⠀⠀⠀⠀⠀⠹⣦⡞⠉⠀⠀⠀⠀⠀⢀⣠⠶⢻⡆
⠻⣦⣀⠀⠀⠀⡴⠶⢦⡀⠀⠈⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⡴⠚⠳⡄⠈⢉⣀⣠⡾⠁
⠀⠸⣍⣉⣁⡀⣇⠀⠀⠑⠀⢠⡿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢷⡀⠀⠓⠀⢀⡇⢤⣈⣭⠿⠁⠀
⠀⠀⠀⠙⠷⠤⠿⠶⠦⠶⠞⠋⠘⢻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠃⠈⠻⠦⠴⠖⠻⠶⠶⠛⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠻⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠶⣄⡀⢀⣤⠶⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀MINHA IMUNDA NOJENTA IMUNDA IMUNDA IMUNDA 
"""

text = "Assing + Evy"

def figlet_text(text):
    # Usa o figlet do sistema para criar texto ASCII grande
    try:
        output = subprocess.check_output(['figlet', text], text=True)
    except Exception as e:
        # fallback simples se não tiver figlet instalado
        output = text
    return output

try:
    while True:
        clear()
        output_heart1 = center_text(heart1)
        output_text = center_text(figlet_text(text))
        full_output = output_heart1 + "\n\n" + output_text + "\n"
        proc = subprocess.Popen(['lolcat'], stdin=subprocess.PIPE)
        proc.communicate(full_output.encode('utf-8'))
        time.sleep(1)

        clear()
        output_heart2 = center_text(heart2)
        full_output = output_heart2 + "\n\n" + output_text + "\n"
        proc = subprocess.Popen(['lolcat'], stdin=subprocess.PIPE)
        proc.communicate(full_output.encode('utf-8'))
        time.sleep(1)

except KeyboardInterrupt:
    clear()
    print("Encerrado pelo usuário.")
