cindex () {
    find -iregex ".*\.\(h\|c\|cpp\|S\)$" > cscope.files
    cscope -q -R -b -i cscope.files
}

mcd () {
    case "$1" in /*) :;; *) set -- "./$1";; esac
    mkdir -p "$1" && cd "$1"
}
