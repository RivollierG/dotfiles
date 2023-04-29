# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
source ~/scripts/extract.sh

# Manage dotfiles
# https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
alias dotfiles='/usr/bin/git --git-dir=/home/guillaume/.dotfiles/ --work-tree=/home/guillaume'


# Shell color script from Derek Taylor
# https://gitlab.com/dwt1/shell-color-scripts
# https://copr.fedorainfracloud.org/coprs/foopsss/shell-color-scripts/
### RANDOM COLOR SCRIPT ###
colorscript random


#Starship prompt
# https://starship.rs/guide/

eval "$(starship init bash)"


#set VIRTUAL_ENV_DISABLE_PROMPT = true
#export VIRTUAL_ENV_DISABLE_PROMPT
# eval "$(oh-my-posh init bash --config ~/.config/OhMyPosh.yml)"

