export EDITOR=vim

#-----fzf-----#
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
--no-height
--color=fg:#d0d0d0,bg:-1,hl:#98971a 
--color=fg+:#d0d0d0,bg+:,gutter:-1,hl+:#b8bb26 
--color=info:#fabd2f,prompt:#b57614,pointer:#b16286 
--color=marker:#458588,spinner:#b16286,header:#87afaf'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}' --bind='ctrl-space:toggle-preview'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
