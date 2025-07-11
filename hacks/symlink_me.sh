#!/bin/bash 

homeDir=$(realpath ~)
configDirPath="${homeDir}/.config"
srcDir="${homeDir}/src/dotfiles"

directoriesToCreateIfMissing=( "${configDirPath}/wezterm" )

for directory in "${directoriesToCreateIfMissing[@]}"
do
	mkdir -p "${directory}"
done





