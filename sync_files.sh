#!/bin/sh

DEST="/run/media/deon/C61AEAF91AEAE601"
SOURCES=( \
    "/home/deon/.config/aliases" \
    "/home/deon/.config/nvim/init.vim" \
    "/home/deon/.config/fish" \
    "/home/deon/.config/alacritty" \
    "/home/deon/Personal" \
    "/home/deon/Pictures" \
    "/home/deon/Coding" \
    "/home/deon/College" \
    "/home/deon/Documents" \
    "/home/deon/Downloads" \
    "/home/deon/Music" \
    "/home/deon/Videos" \
    "/home/deon/Scripts" \
)

for file in ${SOURCES[@]}; do
    echo $file
    rsync -auvhp --delete --exclude=node_modules $file $DEST
done
