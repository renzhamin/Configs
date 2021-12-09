procs --sortd UsageCpu | dmenu -i -l 20 -p "Kill Process : "| awk '{ print $1 }' | xargs kill
