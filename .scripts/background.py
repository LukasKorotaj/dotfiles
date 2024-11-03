# feh picture chooser (actually works)
from sys import argv
script, picture = argv

import os
home = os.path.expanduser("~")

import subprocess, shlex, time

script_dir = f'{home}/.config/.scripts/background.sh'

scaling = input("Do you want to scale the wallpaper (y/n) ")

if scaling == "y":
    with open(f'{script_dir}', 'r', encoding='utf-8') as file:
        data = file.readlines()
    
    data[1] = f"feh --bg-scale {picture}\n"
    
    with open(f'{script_dir}', 'w', encoding='utf-8') as file:
        file.writelines(data)

elif scaling == "n":

    with open(f'{script_dir}', 'r', encoding='utf-8') as file:
        data = file.readlines()
    
    data[1] = f"feh --bg-max {picture}\n"
    
    with open(f'{script_dir}', 'w', encoding='utf-8') as file:
        file.writelines(data)

i3_restart = shlex.split('i3-msg restart')
subprocess.run(i3_restart)

time.sleep(1.0)# time sleep je zesci ghetto

polybar_launch = shlex.split(f'bash -i -c {home}/.config/polybar/launch.sh')
subprocess.run(polybar_launch)
