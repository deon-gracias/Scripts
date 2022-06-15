#!/usr/bin/env sh

ARG=$1

chmod -R u+rw "$ARG"
chmod -R o-rwx "$ARG"
chmod -R g+r "$ARG"
chmod -R g-w "$ARG"
