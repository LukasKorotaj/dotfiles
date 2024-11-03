# this is a theme generator
# RADIIIIIIIIII!!!!!! 
from sys import argv
import shlex
script, theme = argv

# import os
# home = os.path.expanduser("~")

import subprocess

# with open(f'{home}/.scripts/wal_executer.sh', 'r', encoding='utf-8') as file:
    #data = file.readlines()

# maknuo sam alpha cist zato sto mi vise ne treba i confronta se sa urxvt-om
alpha = int(input("alpha, (0 - 100): "))# ljut je ako koristim float() umjesto int()

saturation = float(input("saturation, (0.0 - 1.0): "))

# change = "wal -a \"{}\" --saturate {} -i {} -n\n"

# data[1] = change.format(alpha, saturation, image)

# process = "-a \"{}\" --saturate {} -i {} -n\n".format(alpha, saturation, image)

# with open(f'{home}/.scripts/wal_executer.sh', 'w', encoding='utf-8') as file:
        #file.writelines(data)

# cmd with alpha value
cmd = shlex.split(f'wal -a {alpha} --saturate {saturation} --theme {theme} -n')
# cmd = shlex.split(f'wal --saturate {saturation} -i {image} -n')

subprocess.run(cmd)
