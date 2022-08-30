export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git 
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)
# Cheetsheet aliases with fzf 
alias al="alias | fzf -m"

# Git dotfiles alias
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Google Drive 
alias gdsyncin="rclone sync gdrive: ~/gdrive --progress"
alias gdsync="rclone sync ~/gdrive gdrive: --progress"
alias gdcpin="rclone copy gdrive: ~/gdrive --progress"
alias gdcp="rclone copy ~/gdrive gdrive: --progress"

# Translate tool
alias tr="trans -t en+ru  -show-languages n -show-original n -show-alternatives y -show-dictionary n -show-prompt-message n -indent 1 -hl ru -e google -I"

# Often used commands
# alias conda="/opt/miniconda3/bin/conda"
alias v="vim"
alias vv="nvim"
alias nv="devour neovide --nofork --multigrid"
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
alias onv="open_file_fzf_nvide"
alias op="open_pdf_fzf_zathura"
alias opw="open_pdf_fzf_wps"
alias ow="open_fzf_wps"
alias ompv="open_file_fzf_mpv"

open_file_fzf_vim() {
    FILE_PATH=$(fd --type f --hidden | fzf -m --preview='bat --color=always --line-range :50 {}' --bind='ctrl-space:toggle-preview' --preview-window=,60:hidden)
    [[ -z $FILE_PATH ]] || (echo "$FILE_PATH")
}

open_file_fzf_nvim() {
    FILE_PATH=$(fd --type f --hidden | fzf -m --preview='bat --color=always --line-range :50 {}' --bind='ctrl-space:toggle-preview' --preview-window=,60:hidden)
    [[ -z $FILE_PATH ]] || (nvim "$FILE_PATH")
}

open_file_fzf_nvide() {
    FILE_PATH=$(fd --type f --hidden | fzf -m --preview='bat --color=always --line-range :50 {}' --bind='ctrl-space:toggle-preview' --preview-window=,60:hidden)
    [[ -z $FILE_PATH ]] || (devour neovide --nofork --multigrid "$FILE_PATH")
}

open_pdf_fzf_zathura() {
    PDF_PATH=$(fd --type f --extension pdf | fzf -m --preview="pdfinfo {}" --bind="ctrl-space:toggle-preview" --preview-window=,60:hidden)
    [[ -z $PDF_PATH ]] || (devour  zathura "$PDF_PATH" &> /dev/null)
}

open_pdf_fzf_wps() {
    PDF_PATH=$(fd --type f --extension pdf | fzf -m --preview="pdfinfo {}" --bind="ctrl-space:toggle-preview" --preview-window=,60:hidden)
    [[ -z $PDF_PATH ]] || (devour wpspdf "$PDF_PATH" &> /dev/null)
}

open_fzf_wps() {
    PDF_PATH=$(fd --type f -e doc -e docx -e ppt -e pptx| fzf -m)
    [[ -z $PDF_PATH ]] || (devour wps "$PDF_PATH" &> /dev/null)
}

open_file_fzf_mpv() {
    FILE_PATH=$(fd --type f -e mp4 -e mkv -e webm | fzf ) # you can add exetsions to open with mpv
    [[ -z $FILE_PATH ]] || (devour mpv "$FILE_PATH" &> /dev/null)
}

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

