#!/bin/bash

csindex () {
    mkdir -p .cscope
    find -iregex ".*\.\(h\|c\|cpp\|S\)$" > .cscope/cscope.files
    cscope -q -R -b -i .cscope/cscope.files
    mv cscope.* .cscope
}

mcd () {
    case "$1" in /*) :;; *) set -- "./$1";; esac
    mkdir -p "$1" && cd "$1"
}

copycat() {
    if [ -z "$1" ] ; then
        cat "$1" | xclip -selection clipboard
    else
        tail -$2 "$1" | xclip -selection clipboard
    fi
}
