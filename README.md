# dotfiles
My personnal dotfiles and scripts.  
For sway and waybar workflow.  

## Requirements

- alacritty  
- jq, curl, git  
- sway, swayidle, swaylock, swaybg, waybar, wofi  
- wl-clipboard, clipman  
- [starship](https://starship.rs/) or [oh my posh](https://ohmyposh.dev/)  

## Terminal and prompt

You can use another terminal than alacritty, just change the following line accordingly in .config/sway/config `set $term alacritty`  
There is no need to use the starship or the ohmyposh prompt, if you prefer you can comment the lines in .bashrc `eval "$(starship init bash)"` or `eval "$(oh-my-posh init bash --config ~/.config/OhMyPosh.yml)"`. In any case you only need one of the two prompt customizers.  

## Default applications

In the same vein you can change the terminal application, you can also modify other default application (web browser, file manager, app launcher, ...).  

## Font

You can use another font, but lot of icon are from Nerd Fonts, so please change for another nerd font.  
Then you might need to change font in multiple places (alacritty, waybar, codium, ...).  

## Wallpaper

Using swaybg, the wallpaper change each 10 minuts based on the local time.  
The wallpapers are from [the 25th hour animation](https://louie.co.nz/25th_hour/) by Louis Coyle.

## Keyboard layout and language

Sway workspace key are mapped for french azerty layout, i.e., not using number key `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9` and `0` but using default azerty number row keys instead : `&`, `é`, `"`, `'`, `(`, `-`, `è`, `_`, `ç` and `à`.  
As `-` is used for the 6th workspace, scratchpad is mapped on the exclamation point (`!`) key.  
A few text appear here and there (default wofi prompt, ...), feel free to modify it as it written in french.  

## Clone and use these dotfiles

Instructions can be found [here](https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)  
```bash
cd ~
git clone --bare https://github.com/RivollierG/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```
You will also need to extract icon and cursor themes :

```bash
tar -xf ~/.icons/Future-cyan-cursors.tar.gz -C ~/.icons/
tar -xf ~/.icons/Papirus.tar.gz -C ~/.icons/
```

## Add user to groups

In order to make things work, the user must be add to somes groups
```bash
sudo usermod -aG input $USER # allow access to keyboard event (required by keyboard state indicator)
sudo usermod -aG dialout $USER # allow reading and writing over serial connection
```
## Disclaimer

This is mainly a bunch of code and stuff made by other people, and I do not intended to take ownership of the work of others.  
Everything belongs to whoever is entitled to it.  
