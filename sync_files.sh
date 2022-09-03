#!/bin/sh

DEST="/run/media/$USER/3C64BD5A4D33BF62/"
EXCLUDE="rsync-exclude-file.txt"

SOURCES=(
    "/home/$USER/dotfiles"
    "/home/$USER/Personal"
    "/home/$USER/Pictures"
    "/home/$USER/Coding"
    "/home/$USER/College"
    "/home/$USER/Documents"
    "/home/$USER/Downloads"
    "/home/$USER/Music"
    "/home/$USER/Videos"
    "/home/$USER/Scripts"
)

echo "
.debris
.next
.trash
.vscode
.dart_tool
.idea
.DS_Store
.atom
.buildlog
.history
.svn
.debris
.next
.trash
.vscode
.pub_cache
.pub
.pnp
.pnp.js
*.o
*.out
*.class
*.log
*.pyc
*.swp
*.iml
*.ipr
*.iws
coverage
doc/api
ios/Flutter/.last_build_id
app.*.symbols
app.*.map.json
node_modules
android/app/debug
android/app/profile
android/app/release
build
site-packages
target
__pycache__
doc
ios
npm-debug.log*
yarn-debug.log*
yarn-error.log*
go/bin
go/pkg
" > $EXCLUDE

for entry in ${SOURCES[@]}; do
    rsync -auvhp --delete --exclude-from=$EXCLUDE $entry $DEST
done

rm $EXCLUDE
