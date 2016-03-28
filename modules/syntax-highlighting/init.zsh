zstyle -a ":tazsha:module:syntax-highlighting" highlighters "ZSH_HIGHLIGHT_HIGHLIGHTERS"
source "${0:h}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

(
    for highlighters in ${0:h}/zsh-syntax-highlighting/highlighters/**/*.zsh; do
        tazsha_comp "${highlighters}"
    done
) &!
