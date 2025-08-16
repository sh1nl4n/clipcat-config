#!/bin/bash

DIR_PATH="~/.config/clipcat"

FILES=(
    "./clipcat-menu.toml"
    "./clipcatctl.toml"
    "./clipcatd.toml"
)

function create_dir {
    if [ ! -d "$DIR_PATH" ]; then
        echo "Folder $DIR_PATH not found. Creating..."
        mkdir -p "$DIR_PATH"
        if [ $? -ne 0 ]; then
            echo "Error: failed to create folder $DIR_PATH"
            exit 1
        fi
        echo "Folder has been created."
    else
        echo "Folder $DIR_PATH exist."
    fi
}

function copy_files {
    for file in "${FILES[@]}"; do
        if [ -f "$file" ]; then
            echo "Coping $file in $DIR_PATH"
            cp "$file" "$DIR_PATH"
            if [ $? -ne 0 ]; then
                echo "Error while coping $file"
            fi
        else
            echo "File not found: $file"
        fi
    done
}


create_dir
copy_files
