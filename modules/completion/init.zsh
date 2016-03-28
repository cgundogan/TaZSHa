ZCOMPDUMPFILE="${TAZSHADIR}/.zcompdump"
ZCOMPCACHEFILE="${TAZSHADIR}/.zcompcache"

fpath=(${0:h}/zsh-completions/src $fpath)

autoload -Uz compinit && compinit -C -d "${ZCOMPDUMPFILE}"

$(tazsha_comp "${ZCOMPDUMPFILE}") &!

# http://zsh.sourceforge.net/Doc/Release/Options.html#Completion-2
setopt  ALWAYS_TO_END \
        AUTO_LIST \
        AUTO_MENU \
        AUTO_PARAM_SLASH \
        COMPLETE_IN_WORD
unsetopt MENU_COMPLETE

zstyle '*'                                      single-ignored show

zstyle ':completion:*'                          completer _complete _match _approximate
zstyle ':completion:*'                          menu select
zstyle ':completion:*'                          use-cache on
zstyle ':completion:*'                          cache-path "${ZCOMPCACHEFILE}"
zstyle ':completion:*'                          format ' %F{yellow}-- %d --%f'
zstyle ':completion:*'                          group-name ''
zstyle ':completion:*'                          squeeze-slashes true

zstyle ':completion:*:approximate:*'            max-errors 1 numeric
zstyle -e ':completion:*:approximate:*'         max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:corrections'              format ' %F{green}-- %d (errors: %e) --%f'

zstyle ':completion:*:default'                  list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default'                  list-prompt '%S%M matches%s'

zstyle ':completion:*:descriptions'             format ' %F{yellow}-- %d --%f'

zstyle ':completion:*:functions'                ignored-patterns '(_*|pre(cmd|exec))'

zstyle ':completion:*:history-words'            list false
zstyle ':completion:*:history-words'            menu yes
zstyle ':completion:*:history-words'            remove-all-dups yes
zstyle ':completion:*:history-words'            stop yes

zstyle ':completion:*:options'                  description 'yes'
zstyle ':completion:*:options'                  auto-description '%d'

zstyle ':completion:*:manuals'                  separate-sections true
zstyle ':completion:*:manuals.(^1*)'            insert-sections true

zstyle ':completion:*:match:*'                  original only

zstyle ':completion:*:matches'                  group 'yes'

zstyle ':completion:*:messages'                 format ' %F{purple} -- %d --%f'

zstyle ':completion:*:(rm|kill|diff):*'         ignore-line other
zstyle ':completion:*:rm:*'                     file-patterns '*:all-files'

zstyle ':completion:*:warnings'                 format ' %F{red}-- no matches found --%f'

zstyle ':completion:*:*:-subscript-:*'          tag-order indexes parameters

zstyle ':completion:*:*:cd:*'                   tag-order local-directories directory-stack \
                                                path-directories
zstyle ':completion:*:*:cd:*:directory-stack'   menu yes select

zstyle ':completion:*:*:kill:*:processes'       list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*'                 menu yes select
zstyle ':completion:*:*:kill:*'                 force-list always
zstyle ':completion:*:*:kill:*'                 insert-ids single

zstyle ':completion:*:*:zcompile:*'             ignored-patterns '(*~|*.zwc)'

zstyle ':completion:*:*:*:users'                ignored-patterns \
                                                $(awk -F: '$3<1000 || $3>60000 {print $1}' /etc/passwd)

zstyle ':completion:*:*:*:*:processes'          command 'ps -u $USER -o pid,user,comm -w'

unset ZCOMPDUMPFILE
unset ZCOMPCACHEFILE
