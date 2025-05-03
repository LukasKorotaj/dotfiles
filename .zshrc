#config for zsh
#add .local/bin to path
PATH=$PATH:~/.local/bin

# Load Zsh completion system
autoload -Uz compinit && compinit

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[red]%}%n%{$fg[blue]%}@%{$fg[red]%}%M %{$fg[yellow]%}%(5~|%-1~/…/%3~|%4~)%{$fg[green]%}]%{$reset_color%}$%b "

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

# aliases
export VISUAL=nvim
export EDITOR="$VISUAL"

MANPATH=/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH
export MANPATH
export PATH

export QT_QPA_PLATFORMTHEME=qt5ct

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"


#@aquaductape


# my aliases

alias nv="nvim"
alias snv="sudo nvim"
alias ra="ranger"
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
alias cdnvimplugins="cd ~/.config/nvim/lua/custom/plugins/"
alias repl="scala-cli repl ."
alias deepseek="ollama run deepseek-r1:32b"
alias javaRunner="~/dotfiles/utils/java/javaRunner.sh"
alias javaDebugger="~/dotfiles/utils/java/javaDebugger.sh"
alias t="task"
alias tw="taskwarrior-tui"


export JAVA_HOME="/usr/lib/jvm/java-17-openjdk/"
export PATH=$JAVA_HOME/bin:$PATH

bindkey -r '^N'
bindkey -r '^P'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
