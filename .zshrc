export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git 
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Git dotfiles alias
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Often used commands
alias v="vim"
alias vv="nvim"
alias nv="nvim"
alias nf="neofetch"

# Config files
alias cfb="nvim ~/.zshrc && source ~/.zshrc"
alias cfi="nvim ~/.config/i3/config"
alias cfii="nvim ~/.config/i3blocks/config"
alias cfv="nvim ~/.vimrc"
alias cfvv="nvim ~/.config/nvim/init.lua"
alias cfp="nvim ~/.config/picom.conf"
alias cfa="nvim ~/.config/alacritty/alacritty.yml"
alias cfr="nvim ~/.config/rofi/"

# Open with fzf
alias ov="open_file_fzf_vim"
alias ovv="open_file_fzf_nvim"
alias onv="open_file_fzf_nvim"
alias op="open_pdf_fzf_zathura"
alias ompv="open_file_fzf_mpv"

open_file_fzf_vim() {
    FILE_PATH=$(fd --type f --hidden | fzf --preview='bat --color=always --line-range :50 {}' --bind='ctrl-space:toggle-preview' --preview-window=,60:hidden)
    [[ -z $FILE_PATH ]] || (vim "$FILE_PATH")
}

open_file_fzf_nvim() {
    FILE_PATH=$(fd --type f --hidden | fzf --preview='bat --color=always --line-range :50 {}' --bind='ctrl-space:toggle-preview' --preview-window=,60:hidden)
    [[ -z $FILE_PATH ]] || (nvim "$FILE_PATH")
}

open_pdf_fzf_zathura() {
    PDF_PATH=$(fd --type f --extension pdf | fzf --preview="pdfinfo {}" --bind="ctrl-space:toggle-preview" --preview-window=,60:hidden)
    [[ -z $PDF_PATH ]] || (zathura "$PDF_PATH" &> /dev/null)
}

open_file_fzf_mpv() {
    FILE_PATH=$(fd --type f --extension mp4 mkv webm | fzf ) # you can add exetsions to open with mpv
    [[ -z $FILE_PATH ]] || (mpv "$FILE_PATH")
}

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
