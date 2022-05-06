#!/bin/sh

for file in * ; do
	new_file=`echo $file | tr A-Z a-z | tr " " "_"`
	echo $new_file
	mv "$file" "$new_file"
done
