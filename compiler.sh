#!/bin/sh

# This script will compile or run another finishing operation on a document. I
# have this script run via vim.
#
# Compiles .tex. groff (.mom, .ms), .rmd, .md, .org.  Opens .sent files as sent
# presentations. Runs scripts based on extention or shebang.
#
# Note that .tex files which you wish to compile with XeLaTeX should have the
# string "xelatex" somewhere in a comment/command in the first 5 lines.

file=$(readlink -f "$1")
dir=${file%/*}
base="${file%.*}"
ext="${file##*.}"

cd "$dir" || exit 1

textype() { \
	command="pdflatex"
	( head -n5 "$file" | grep -qi 'xelatex' ) && command="xelatex"
	$command --output-directory="$dir" "$base" &&
	grep -qi addbibresource "$file" &&
	biber --input-directory "$dir" "$base" &&
	$command --output-directory="$dir" "$base" &&
	$command --output-directory="$dir" "$base"
}

case "$ext" in
	# Try to keep these cases in alphabetical order.
	[0-9]) preconv "$file" | refer -PS -e | groff -mandoc -T pdf > "$base".pdf ;;
	asm) nasm -f elf "$file" && ld -m elf_i386 -s -o "$base" "$base.o" && "$base" ;;
	c) gcc "$file" -lm -o "$base.o" && "$base.o" ;;
	cpp) g++ "$file" -o "$base.o" && "$base.o" ;;
	cs) mcs "$file" && mono "$base".exe ;;
	go) go run "$file" ;;
	java) javac -d classes "$file" && java -cp classes "${1%.*}" ;;
	md)	if  [ -x "$(command -v lowdown)" ]; then
			lowdown -d nointem -e super "$file" -Tms | groff -mpdfmark -ms -kept > "$base".pdf
		elif [ -x "$(command -v groffdown)" ]; then
			groffdown -i "$file" | groff > "$base.pdf"
		else
			pandoc -t latex --highlight-style=kate -s -o "$base".pdf "$file"
		fi ; ;;
	mom) preconv "$file" | refer -PS -e | groff -mom -kept -T pdf > "$base".pdf ;;
	ms) preconv "$file" | refer -PS -e | groff -me -ms -kept -T pdf > "$base".pdf ;;
	py) python "$file" ;;
	[rR]md) Rscript -e "rmarkdown::render('$file', quiet=TRUE)" ;;
	rs) cargo run ;;
	sass) sassc -a "$file" "$base.css" ;;
	scad) openscad -o "$base".stl "$file" ;;
	sent) setsid -f sent "$file" 2>/dev/null ;;
	tex) textype "$file" ;;
	*) sed -n '/^#!/s/^#!//p; q' "$file" | xargs -r -I % "$file" ;;
esac
