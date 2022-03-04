#!/bin/bash

system_links=("/dev/log" "/dev/initctl" "/dev/rtc" "/dev/stderr" "/dev/stdout" "/dev/stdin" "/dev/fd" "/dev/core")

symlinks=($(find /dev/ -maxdepth 1 -type l)) 
for sl in ${symlinks[*]}
do
	if [[ ! " ${system_links[*]} " =~ " $sl " ]];
       	then
		echo $sl "->" $(readlink -f $sl)
	fi
done

