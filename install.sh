#!/bin/bash

create_link() {
    local folder=$1
    local plugins_path=$2
    local folder_path=$(realpath "$folder")
    local folder_dest="$HOME/.config/$folder"

    echo -e "\nCreate link of $folder"
    echo "PATH: $folder_path"
    echo "DEST: $folder_dest"

    read -r -p "Continue? (Y/N): " answer
    if [[ $answer =~ [Yy] ]]; then

        ln -s "$folder_path" "$folder_dest"

        if [[ -n "$plugins_path" ]]; then

            read -r -p "Install plugins? (Y/N): " answer
            if [[ $answer =~ [Yy] ]]; then
                local plugin_list=($plugins_path)

                for plugin in "${plugin_list[@]}"; do
                    git clone "https://github.com/$plugin" "$HOME/.config/$folder/plugins/$(basename "$plugin")"
                done

                echo -e "\n#-> $folder plugins installed <-#"
            fi
        fi
    else
        echo "Skip link of $folder"
    fi
}

declare -A folders=(
    ["zsh"]="zsh-users/zsh-autosuggestions zsh-users/zsh-syntax-highlighting zsh-users/zsh-completions"
    ["tmux"]="tmux-plugins/tpm"
    ["git"]=""
    ["htop"]=""
    ["npm"]=""
)

for folder in "${!folders[@]}"; do
    case $folder in
    "zsh")
        create_link "$folder" "${folders[$folder]}"
        read -p "Source \$HOME/.config/zsh/.zshrc or reset the terminal (ENTER)"
        ;;
    "tmux")
        create_link "$folder" "${folders[$folder]}"
        read -p "Start tmux and use 'c-a I' to update the plugins (ENTER)" answer
        ;;
    *)
        create_link "$folder"
        ;;
    esac
done
