zmodload zsh/terminfo
autoload -Uz edit-command-line
zle -N edit-command-line

setopt BEEP

bindkey -M vicmd "E"                    edit-command-line
bindkey -M vicmd '/'                    history-incremental-pattern-search-backward
bindkey -M vicmd '?'                    history-incremental-pattern-search-forward
bindkey -M vicmd "\C-R"                 redo
bindkey -M vicmd "u"                    undo

bindkey -M viins '^R'                   history-incremental-pattern-search-backward
bindkey -M viins '^F'                   history-incremental-pattern-search-forward
bindkey -M viins "$terminfo[khome]"     beginning-of-line
bindkey -M viins "$terminfo[kend]"      end-of-line
bindkey -M viins "$terminfo[kich1]"     overwrite-mode
bindkey -M viins "^[[3~"                delete-char
bindkey -M viins "^?"                   backward-delete-char
