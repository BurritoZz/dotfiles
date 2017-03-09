function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

local return_code=" %(?..%{$fg[red]%}%? ↵%{$reset_color%})"

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

setopt promptsubst

PROMPT='%{$fg[cyan]%}%n: %{$fg[yellow]%}${PWD/#$HOME/~} $(git_prompt_info) %{$reset_color%}[%T]
%{$reset_color%}➜ '
RPROMPT='$(acpi | grep -o "[0-9]*%")%%B${return_code}%b'
