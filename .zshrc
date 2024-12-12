#config for zsh
#add .local/bin to path
PATH=$PATH:~/.local/bin

# auto startx upon login

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[red]%}%n%{$fg[blue]%}@%{$fg[red]%}%M %{$fg[yellow]%}%~%{$fg[green]%}]%{$reset_color%}$%b "

# PS1="%F{$fg[red]}[%f%B%F{$fg[green]}%n%f%b%F{$fg[blue]}@%f%F{$fg[green]}%m%f %F{$fg[yellow]}%~%f%F{$fg[red]}]%f%F{$fg[green]}$%f "
RPROMPT="%F{white}%*%f"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# alias for l -t | head -20
alias lt='ls -t | head -20'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# add backsearching
bindkey '^r' history-incremental-search-backward

# aliases
export VISUAL=nvim
export EDITOR="$VISUAL"


PATH="$PATH:/usr/local/texlive/2020/bin/x86_64-linux"
PATH="$PATH:/home/gospodar/programs/libcluon/build"
MANPATH=/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH
export MANPATH
export PATH


# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
#@aquaductape

# Wal sequence loader
(cat ~/.cache/wal/sequences &)

# my aliases

alias nv="nvim"
alias snv="sudo nvim"
alias r="ranger"
alias sr="sudo ranger"
alias keyboard_se="setxkbmap -layout se"
alias keyboard_gb="setxkbmap -layout gb"
alias keyboard_hr="setxkbmap -layout hr"
alias h="htop"
alias shtop="sudo htop"
alias die="poweroff"
alias theme="python ~/.config/.scripts/theme.py"
alias theme_predefined="python ~/.config/.scripts/theme_predefined.py"
alias i3_config="$EDITOR ~/.config/i3/config"
alias background="python ~/.config/.scripts/background.py"
alias p="python3"
alias polybar_start="bash ~/.config/polybar/launch.sh"
alias update="sudo pacman --noconfirm -Syu"
alias faks_vpn="sudo openfortivpn -c .openfortivpn/config"
alias cdnvim="cd ~/.config/nvim/"

export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"

# function/alias for opening pdf files in default browser
pdf() {
	nohup xdg-open "$1" & disown
}

