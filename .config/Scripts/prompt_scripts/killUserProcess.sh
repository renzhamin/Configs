#!/bin/sh
procs -a ${USER} -i VmRss --sortd UsageMem | dmenu -i -l 20 -p "Kill Process : "| awk '{ print $1 }' | xargs kill
