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

underscore_to_hyphen() {
    for file in * ; do
        new_file=`echo $file | tr "_" "-"`
        echo $new_file
        mv "$file" "$new_file"
    done
}

space_to_hyphen() {
    for file in * ; do
        new_file=`echo $file | tr " " "-"`
        echo $new_file
        mv "$file" "$new_file"
    done
}

echo -n "
 1 -> Uppercase to Lowercase
 2 -> Lowercase to Uppercase
 3 -> Space to Underscore
 4 -> Underscore to Space
 5 -> Underscore to Hyphen
 6 -> Space to Hyphen
 => "
read opt

case $opt in
    1)
        uppercase_to_lowercase
        ;;
    2)
        lowercase_to_uppercase
        ;;

    3)
        space_to_underscore
        ;;

    4)
        underscore_to_space
        ;;
    5)
        underscore_to_hyphen
        ;;
    6)
        space_to_hyphen
        ;;
    *)
        echo "Invalid Option"
        ;;
esac
