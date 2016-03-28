autoload -Uz colors && colors
autoload -Uz promptinit && promptinit

zstyle -s ":tazsha:module:prompt" theme "theme"

theme_ini="${0:h}/$theme/init.zsh"

source "$theme_ini"
$(tazsha_comp "${theme_ini}") &!

unset theme_ini
unset theme
