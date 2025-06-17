import os
import time
import subprocess

def clear():
    os.system('clear' if os.name == 'posix' else 'cls')

def figlet_text(text):
    result = subprocess.run(['figlet', '-c', text], stdout=subprocess.PIPE)
    return result.stdout.decode()

# Coração base
heart1 = r"""⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠤⢥⠤⠀⠀⠀⠀⠀⠀⠀⢀⣠⡞⠳⣄⠀⠀⠀⠀⠀⠀⢀⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⠀⠀⠀⠀⠀⠀⠤⣶⣛⠉⠀⠀⢈⡳⠖⠀⠀⠀⠀⠘⠚⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡀⣰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⠤⠀⣧⠇⠀⠐⠦⢤⣀⠀⠀⠀⠀⢀⣤⠖⠒⠛⠛⠓⠂⠀⠶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⡶⠋⢀⡀⠀⠀⢻⠀⠀⠀⠤⡀⠈⠳⣄⣀⡴⠋⢀⠔⠈⠉⢉⣱⠀⢀⠤⡄⠈⠳⣤⠠⠤⠦⢤⡀⠀
⠀⠀⠀⠀⠀⣰⠋⢀⡔⠁⣸⠀⠀⠈⠀⠀⠀⠀⠘⢂⠀⠘⠋⠀⠐⠇⠰⠂⠉⠁⠀⠀⠈⠉⠀⠀⢠⠘⣧⠀⠀⠀⢻⡆
⠀⠀⠀⠀⠀⡟⠀⡼⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⢸⡄⠀⠀⣼⠇
⠀⠀⠀⠀⠸⡇⠀⠣⣀⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠄⣸⠀⢀⣼⠋⠀
⠀⠀⠀⠀⠀⣷⠀⢀⡄⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢀⣯⡾⠛⠀⠀⠀
⠀⠀⠀⠀⠀⠹⣷⠀⠑⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⢀⣠⢷⡟⠁⠀⠀⠀⠀⠀
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

# Versão pulsante (só trocando levemente)
heart2 = heart1.replace("⢀", "⢀⢀").replace("⠤", "⠤⠤").replace("⡄", "⡄⡄").replace("⠀", "  ")

def main():
    try:
        while True:
            clear()
            print(figlet_text("Assing + Evy") + "\n")
            print(heart1)
            print(figlet_text("true love"))
            time.sleep(0.6)

            clear()
            print(figlet_text("Assing + Evy") + "\n")
            print(heart2)
            print(figlet_text("true love"))
            time.sleep(0.6)
    except KeyboardInterrupt:
        clear()
        print("Fim do amor. 💔")

if __name__ == "__main__":
    main()
