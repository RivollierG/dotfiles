# Common aliases

# prompt before overwriting
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# color
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Git aliases
alias gaa='git add --all -v'
alias gs='git status'
alias gc='git checkout'
alias gf='git fetch'

# Python virtual environment aliases
alias condactivate='source ~/anaconda3/bin/activate'
alias venv='source ./venv/bin/activate'

# ls aliases
alias ls='LC_COLLATE=C ls -aCFh --group-directories-first --color=auto'
alias ll='ls -l'

# Manage dotfiles
# https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Other
alias bat='bat --theme=ansi'
