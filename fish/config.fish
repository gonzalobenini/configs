set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

function fish_prompt
    set_color green
    set_color blue
    # Imprime el nombre de usuario en blanco
    #echo -n (whoami)'@'
    echo -n Desarrollador
    # Establece el color azul para el texto que sigue después del símbolo "@"

    # Imprime el resto del prompt (en azul)
    echo -n ' elocuente'
    # Restablece el color a normal
    set_color normal

    # Imprime el prompt del directorio actual
    echo -n '' (prompt_pwd) '> '
end

alias du="docker-compose up"
alias c="code . && exit"

alias n='nvim'
alias ide='~/ide'

alias n='/usr/local/nvim-linux64/bin/nvim'
alias nvim='n'

set -x PATH /usr/local/nvim-linux64/bin /home/gonza/.nvm/versions/node/v20.13.1/bin /home/gonza/go/bin /home/gonza/.local/bin /home/gonza/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games /snap/bin /snap/bin $PATH

alias sail='vendor/bin/sail'
alias configfish="n ~/.config/fish/config.fish"

function ter
    set layout "New Layout"
    if test (count $argv) -gt 0
        set layout $argv[1]
    end
    nohup terminator -l "$layout" >/dev/null 2>&1 &
end

function rs
    echo $argv | tr ' ' -
end
