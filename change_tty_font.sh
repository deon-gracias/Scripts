#!/bin/sh

# sudo pacman -Sy terminus-font
echo "FONT=ter-u18n" > /etc/vconsole.conf && echo "FONT_MAP=8859-2" >> /etc/vconsole.conf

hooks=$( grep "HOOKS=(" /etc/mkinitcpio.conf | tail -1 )
echo "$hooks"

cp -i /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak

sed -i "/$hooks/c ${hooks:0: -1} consolefont)" /etc/mkinitcpio.conf
