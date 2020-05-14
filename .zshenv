TAZSHADIR="${ZDOTDIR:-$HOME}"

export BIBINPUTS="$HOME/git/haw/bib/"
#export BROWSER="firefox"
export EDITOR="emacsclient -t -c"
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export LANG="en_US.UTF-8"
export LESS="-F -g -i -M -R -S -w -X -z-4"
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export PAGER="less"
export TERM="rxvt-unicode-256color"
[ -n "$TMUX" ] && export TERM="screen-256color"
export VISUAL="$EDITOR"
