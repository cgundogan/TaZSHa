[[ "$SHLVL" -eq 1 ]] && source "$TAZSHADIR/.zpath"

source "$TAZSHADIR/.ztazsha"

fpath=(
    "${TAZSHADIR}/functions"
    $fpath
)

autoload -Uz tazsha_comp

for mod in ${TAZSHADIR}/modules/${^tmodules}/init.zsh(.N); do
    source ${mod}
done

setopt extended_glob

(
    $(tazsha_comp "$HOME/.zshenv")
    $(tazsha_comp "$TAZSHADIR/.zshenv")
    $(tazsha_comp "$TAZSHADIR/.zshrc")
    $(tazsha_comp "$TAZSHADIR/.zprofile")
    $(tazsha_comp "$TAZSHADIR/.zpath")
    $(tazsha_comp "$TAZSHADIR/.ztazsha")
    for fun in ${TAZSHADIR}/functions/^*.zwc(.); do
        tazsha_comp "${fun}"
    done
    for mod in ${TAZSHADIR}/modules/${^tmodules}/init.zsh(.N); do
        tazsha_comp "${mod}"
    done

) &!

unset mod
unset tmodules
unfunction tazsha_comp
