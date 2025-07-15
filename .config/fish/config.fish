set fish_greeting
export MANPAGER='nvim +Man!'

if status is-interactive
    export GPG_TTY=$(tty)
end
