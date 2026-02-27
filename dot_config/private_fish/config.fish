# 1. Aliases (Fish automatically appends $argv for you)
alias ls='eza --long --icons --group-directories-first'
alias ll='eza --long -lh --icons --grid --group-directories-first'
alias lt='eza --tree --level=2 --icons'

# 2. Environment Variables (Use set -gx for global exports)
set -gx EDITOR "nvim"
set -g fish_key_bindings fish_vi_key_bindings

# 3. Path Management (Fish-specific optimized way)
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"

# 4. Tool Initializations (Note the 'source' instead of 'eval')
starship init fish | source
zoxide init --cmd cd fish | source

# 5. Functions (Fish syntax is: function name ... end)
# This is the converted Yazi wrapper
function ra
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"
        and [ "$cwd" != "$PWD" ]
        and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
