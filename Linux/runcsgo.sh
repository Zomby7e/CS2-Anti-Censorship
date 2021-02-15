#!/bin/bash

# A simple script for CS:GO on GNU/Linux.
# Auther: Zomby7e

# CSGO installation path,change it if you need.
PATH_CSGO="/home/$USER/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/"

# Determine if the game is installed correctly.
if [ ! -f "${PATH_CSGO}csgo_linux64" ]
then
    echo 'Game has not been installed correctly.(Or this script did not find the game path)'
    exit 1
fi

# Rename the files to invalidate (Command: a)
renameAll(){
    find "${PATH_CSGO}csgo/" -name "pakxv_*.vpk" -exec mv {} {}.bak \;
}

# Restore the original name of the file (Command: A)
restoreAll(){
    find "${PATH_CSGO}csgo/" -name "pakxv_*.vpk.bak" -print0 | while read -r -d '' RE_FILE
    do
        mv "$RE_FILE" "${RE_FILE::-4}"
    done
}

# Launch the worldwide CSGO (Command: w)
worldwide(){
    clear
    steam 'steam://rungameid/730//-worldwide -novid -tickrate 128' > /dev/null
    echo 'Good Luck & have fun!'
    exit 0
}

# Launch the perfectworld CSGO (Command: p)
perfectworld(){
    renameAll
    steam 'steam://rungameid/730//-perfectworld -novid -tickrate 128' > /dev/null
    for COUNTDOWN in {20..0}
    do
        clear
        echo 'Good Luck & have fun!'
        echo "Please ignore this countdown: ${COUNTDOWN}"
        sleep 1
    done
    restoreAll
    clear
    echo 'Good Luck & have fun!'
    exit 0
}

# Download  the configure file(s) for CSGO (Command: c)
configureFile(){
    # Change the link to the link of your own configure file.
    wget "https://raw.githubusercontent.com/Zomby7e/csgo_config_cn/master/cfg_files/autoexec.cfg" -O "${PATH_CSGO}csgo/cfg/autoexec.cfg"
}

# Print the help contents (Command: h)
help(){
less << EOF
Synopsis

    1. This script can help you avoid the trouble of modifying the configuration files and launch the CSGO quickly.
    2. In the TUI (terminal user interface), simply type a letter and press Enter to use the function.
    3. You can also use this tool in the CLI (command line interface), like this:
    $ ./runcsgo.sh w

Parameter

    w - Launch the "worldwide" version of CS:GO.
    p - Launch the "perfectworld" version of CS:GO.
    a - Rename related files to prevent blood from turning black.(Perfect World server only)
    A - Restore all files to their original names.(Perfect World server only)
    c - Download your CS:GO configuration file to the game folder.
    h - Display help information.
    q - quit

FAQ

    Q: Why the "w" or "p" command of this tool does not work?
    A: The game parameters set by the Steam client are still valid, you need to delete them.

    Q: Why is there a countdown after starting the Perfect World version?
    A: After about 20 seconds, the game will start completely. Restore the original names of all files so that it does not cause game update errors.

What I want to say

    1.This tool was written for mainland Chinese:
    "Perfect World" uses several patch files (vpk files) in the game to make the game comply with the cultural review of the Chinese mainland government. Simply renaming them will invalidate them, but after the game is updated, the game will have serious bugs.
    If you use this tool to start Perfect World CS:GO, this tool invalidates the "Black Blood" patch, starts the game, and restores the patch after the 20 second countdown.

    2.You may need to change the configureFile() function and the PATH_CSGO variable.

    3.`echo "Good luck and have fun, ${USER}!"`

(Pree "q" to quit)
EOF
}

# If the first parameter exists, disable TUI
[ ! -z $1 ] && TASK="q"

# CLI flow control statements.
case $1 in
    w)
        worldwide;;
    p)
        perfectworld;;
    a)
        renameAll;;
    A)
        restoreAll;;
    c)
        configureFile;;
    h)
        help;;
    *)
        ;;
esac
# The end of CLI flow control statements.

# Main menu(TUI)
while [ "$TASK" != "q" ]
do

clear
echo "A simple tool for CS:GO"
echo ""
echo "Enter \"h\" for help"
echo ""
read -p "λ " TASK

case $TASK in
    w)
        worldwide;;
    p)
        perfectworld;;
    a)
        renameAll;;
    A)
        restoreAll;;
    c)
        configureFile;;
    h)
        help;;
    q)
        clear
        exit 0;;
    *)
        ;;
esac

done
# The end of main menu(TUI)