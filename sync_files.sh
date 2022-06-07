#!/bin/sh

DEST="/run/media/deongracias/C61AEAF91AEAE601"
SOURCES=( \
    "/home/deongracias/.config/aliases" \
    "/home/deongracias/.config/nvim/init.vim" \
    "/home/deongracias/.config/fish" \
    "/home/deongracias/.config/alacritty" \
    "/home/deongracias/Personal" \
    "/home/deongracias/Pictures" \
    "/home/deongracias/Coding" \
    "/home/deongracias/College" \
    "/home/deongracias/Documents" \
    "/home/deongracias/Downloads" \
    "/home/deongracias/Music" \
    "/home/deongracias/Videos" \
    "/home/deongracias/Scripts" \
)

for file in ${SOURCES[@]}; do
    echo $file
    rsync -auvhp --delete --exclude=node_modules $file $DEST
done
