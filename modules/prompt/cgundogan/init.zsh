setopt PROMPT_SUBST
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*'                        enable git
zstyle ':vcs_info:git*'                     actionformats '%m%F{5}[%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:git*'                     formats '%m%F{5}[%b%F{5}]%f'
zstyle ':vcs_info:git*'                     check-for-changes false
zstyle ':vcs_info:git+set-message:*'        hooks check-upstream check-dirty

PROMPT='%F{magenta}[%F{green}%n%F{33}@%F{cyan}%m%F{magenta}] %F{yellow}%3~ %f%# '
RPROMPT='${vcs_info_msg_0_}'

+vi-check-dirty() {
    if [[ -z $(command git status --porcelain 2>/dev/null) ]]; then
        hook_com[branch]="%F{green}$hook_com[branch]%f"
    else
        hook_com[branch]="%F{red}$hook_com[branch]%f"
    fi
    return 0
}

+vi-check-upstream() {
    local ours theirs
    git rev-list --count --left-right '...@{u}' 2>/dev/null | read ours theirs
    ((ours)) && hook_com[misc]+="%F{green}$ours↑%f"
    ((theirs)) && hook_com[misc]+="%F{yellow}$theirs↓%f"
    hook_com[misc]+=${hook_com[misc]:+ }
    return 0
}

add-zsh-hook precmd vcs_info
