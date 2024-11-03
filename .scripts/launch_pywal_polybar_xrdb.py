import subprocess, shlex, time

import os
home = os.path.expanduser("~")

execute_wal = shlex.split('wal -nsR')
subprocess.run(execute_wal)

time.sleep(1.0)

execute_polybar = shlex.split(f'bash -i -c {home}/.config/polybar/launch.sh')
subprocess.run(execute_polybar)

time.sleep(0.5)

execute_xrdb = shlex.split(f'xrdb {home}/.config/.Xresources.dracula')
subprocess.run(execute_xrdb)



