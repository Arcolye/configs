PROMPT='%{$fg_bold[blue]%}%c $(git_prompt_info)'
PROMPT+='
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}±%{$fg[black]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[black]%})"
