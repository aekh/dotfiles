local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} - %{$fg_bold[green]%}%* %D{UTC%z}%{$reset_color%} - %{$fg_bold[green]%}%D{%Y-%m-%d}%{$reset_color%} - %{$fg_bold[yellow]%}%j%{$reset_color%} $(git_prompt_info)
${ret_status} %{$fg[cyan]%}%~%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="- %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
