zstyle -a ":tazsha:module:aliases" alias_modules "alias_modules"

for amod in ${0:h}/${^alias_modules}/alias.zsh(.N); do
    source ${amod}
done

(
    for amod in ${0:h}/${^alias_modules}/alias.zsh(.N); do
        tazsha_comp "${amod}"
    done
) &!

unset amod
unset alias_modules
