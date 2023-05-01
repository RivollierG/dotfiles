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

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Use bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# In order to use sudo -A for gui password auth: 
export SUDO_ASKPASS=/usr/libexec/openssh/gnome-ssh-askpass

# source various scripts
source ~/scripts/extract.sh

# Shell color script from Derek Taylor
# https://gitlab.com/dwt1/shell-color-scripts
# https://copr.fedorainfracloud.org/coprs/foopsss/shell-color-scripts/
### RANDOM COLOR SCRIPT ###
colorscript random

### Prompt format ###
# Starship prompt
# https://starship.rs/guide/

eval "$(starship init bash)"

# OhMyPosh prompt

#set VIRTUAL_ENV_DISABLE_PROMPT = true
#export VIRTUAL_ENV_DISABLE_PROMPT
# eval "$(oh-my-posh init bash --config ~/.config/OhMyPosh.yml)"
