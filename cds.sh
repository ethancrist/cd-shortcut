#!/bin/bash

KEYFILE=~/.keys.cds

# Perform shortcut
shortcut() {
    if keyExists $1; then
        while read line
        do
            key=${line%% *}
            dir=${line##* }
            if [ "$1" == "$key" ]; then
                # Dir found
                echo "Shorcutting to $dir";
                cd "$dir";
                ls
            fi
        done<$KEYFILE
    else
        echo "The key '$1' doesn't exist."
        echo "Use 'cds <key> <dir>' to add it."
    fi
}

# Essentials
keyExists() {
    while read line
    do
        key=${line%% *}
        if [ "$1" == "$key" ]; then
            # Key exists
            return 0 
        fi
    done<$KEYFILE
    return 1
}

# Key management
add() {
    if keyExists $1; then
        echo "prompt user"
    else
        echo "$1 $2" >> $KEYFILE
        echo "Key registered. Try it now: 'cds $1'"
    fi
}
remove() {
    if keyExists $1; then
        sed -i "/^$1/d" $KEYFILE
        list
        echo "Key removed."
    else
        list
        echo "The key '$1' does not exist."
    fi
}
list() {
    echo ""
    echo "[cd-shortcuts]"
    echo "-----------------------"
    cat $KEYFILE
    echo "-----------------------"
    echo "[end of list reached]"
    echo ""
}


if [ "$1" == "-add" ] && [ -n "$2" ] && [ -n "$3" ]; then
    add "$2" "$3";
elif [ "$1" == "-rm" ] && [ "$2" != "" ]; then
    remove "$2";
elif [ "$1" == "ls" ] || [ "$1" == "l" ] || [ "$1" == "list" ]; then
    list
elif [ -n "$1" ]; then
    shortcut "$1"
else
    echo "Command list"
    echo "      Use shortcut:           cds <key>"
    echo "      Add new shortcut:       cds -add <key> <dir>"
    echo "      Remove a shortcut:      cds -rm <key>"
    echo "      List shortcuts:         cds ls"
fi;
