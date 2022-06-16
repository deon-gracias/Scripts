#!/bin/sh

DEST="/run/media/deongracias/C61AEAF91AEAE601"
EXCLUDE="rsync-exclude-file.txt"

user="deongracias"

SOURCES=(
    "/home/$user/dotfiles"
    "/home/$user/Personal"
    "/home/$user/Pictures"
    "/home/$user/Coding"
    "/home/$user/College"
    "/home/$user/Documents"
    "/home/$user/Downloads"
    "/home/$user/Music"
    "/home/$user/Videos"
    "/home/$user/Scripts"
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
