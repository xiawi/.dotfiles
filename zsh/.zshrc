alias vim="nvim"

function open() {
    xdg-open "$@" >/dev/null 2>&1 &
    disown
}

