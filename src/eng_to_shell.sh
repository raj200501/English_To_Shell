#!/bin/bash

translate_command() {
    local description="$1"
    local command=""

    case "$description" in
        "list files")
            command="ls"
            ;;
        "change directory to "*)
            command="cd ${description#change directory to }"
            ;;
        "show current directory")
            command="pwd"
            ;;
        "remove file "*)
            command="rm ${description#remove file }"
            ;;
        "remove directory "*)
            command="rmdir ${description#remove directory }"
            ;;
        "create directory "*)
            command="mkdir ${description#create directory }"
            ;;
        "move file "*)
            command="mv ${description#move file }"
            ;;
        "copy file "*)
            command="cp ${description#copy file }"
            ;;
        "show file content "*)
            command="cat ${description#show file content }"
            ;;
        "find file "*)
            command="find . -name ${description#find file }"
            ;;
        "show disk usage")
            command="du -h"
            ;;
        "show system processes")
            command="ps aux"
            ;;
        "kill process "*)
            command="kill ${description#kill process }"
            ;;
        "download file "*)
            command="wget ${description#download file }"
            ;;
        "search for "*)
            command="grep ${description#search for }"
            ;;
        "archive files "*)
            command="tar -cvf ${description#archive files }"
            ;;
        "extract archive "*)
            command="tar -xvf ${description#extract archive }"
            ;;
        "check disk space")
            command="df -h"
            ;;
        "current date and time")
            command="date"
            ;;
        *)
            command="echo 'Unknown command'"
            ;;
    esac

    echo "$command"
}

execute_command() {
    local command="$1"
    eval "$command"
}

if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 '<command_description>'"
    exit 1
fi

command=$(translate_command "$1")
execute_command "$command"
