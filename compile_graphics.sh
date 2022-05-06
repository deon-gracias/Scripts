file=$(readlink -f "$1")
dir=${file%/*}
base="${file%.*}"
ext="${file##*.}"

cd "$dir" || exit 1

case "$ext" in
    c) gcc "$file" -o "$base" -lSDL_bgi -lSDL2 && "$base" ;;
    cpp) g++ "$file" -o "$base" -lSDL_bgi -lSDL2 && "$base" ;;
    *) echo "Invalid file"
esac
