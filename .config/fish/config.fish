#  ____  _ __     ___   _ ____  ____  
# |  _ \| |\ \   / / | | |  _ \|  _ \ 
# | | | | | \ \ / /| |_| | | | | |_) |
# | |_| | |__\ V / |  _  | |_| |  _ < 
# |____/|_____\_/  |_| |_|____/|_| \_\
#                                     
set fish_greeting

fzf_configure_bindings --directory=\ct
set fzf_preview_dir_cmd exa --group-directories-first --icons -a
set -gx fzf_history_opts "--nth=4.." --preview=""
set -gx FZF_DEFAULT_OPTS '
    --bind ctrl-j:down,ctrl-k:up
    --exact
    --reverse
    --cycle
    --height=20%
    --info=inline
    --prompt=""\ 
    --pointer=→
    --color=dark
    --color=fg:-1,bg:-1,hl:#9ece6a,fg+:#a9b1d6,bg+:#1D202F,hl+:#9ece6a
    --color=info:#9ece6a,prompt:#7aa2f7,pointer:#9ece6a,marker:#e5c07b,spinner:#61afef,header:#7aa2f7'

set -gx GUM_FILTER_INDICATOR "→"
set -gx GUM_FILTER_PROMPT " "
