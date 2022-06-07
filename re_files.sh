#!/bin/sh
uppercase_to_lowercase() {
    for file in * ; do
        new_file=`echo $file | tr A-Z a-z`
        echo $new_file
        mv "$file" "$new_file"
    done
}
lowercase_to_uppercase() {
    for file in * ; do
        new_file=`echo $file | tr a-z A-Z`
        echo $new_file
        mv "$file" "$new_file"
    done
}
space_to_underscore() {
    for file in * ; do
        new_file=`echo $file | tr " " "_"`
        echo $new_file
        mv "$file" "$new_file"
    done
}

underscore_to_space() {
    for file in * ; do
        new_file=`echo $file | tr "_" " "`
        echo $new_file
        mv "$file" "$new_file"
    done
}

echo -n " 1 -> Space to Underscore
 2 -> Underscore to Space
 3 -> Uppercase to Lowercase
 4 -> Lowercase to Uppercase
 => "
read opt

case $opt in
    1)
        space_to_underscore
        ;;
    2)
        underscore_to_space
        ;;

    3)
        uppercase_to_lowercase
        ;;

    4)
        lowercase_to_uppercase
        ;;

    *)
        echo "Invalid Option"
        ;;
esac
