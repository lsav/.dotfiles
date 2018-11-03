#!/bin/bash

csindex () {
    mkdir -p .cscope
    find -E ./ -regex ".*\.(h|c|cpp|S)$" > .cscope/cscope.files
    cscope -q -R -b -i .cscope/cscope.files
    mv cscope.* .cscope
}

mcd () {
    case "$1" in /*) :;; *) set -- "./$1";; esac
    mkdir -p "$1" && cd "$1"
}

copycat() {
    if [ `uname` == "Darwin" ] ; then
        cp_cmd = "pbcopy"
    else
        cp_cmd = "xclip -selection clipboard"
    fi

    if [[ $# -eq 1 ]] ; then
        cat "$1" | $cp_cmd
    else
        tail -$2 "$1" | $cp_cmd
    fi
}

