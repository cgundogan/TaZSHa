zstyle -s ":tazsha:module:aliases:git"  log_format_brief    "tazsha_git_log_format_brief"
zstyle -s ":tazsha:module:aliases:git"  log_format_oneline  "tazsha_git_log_format_oneline"

alias g..='cd $(git rev-parse --show-toplevel 2> /dev/null || print .)'

alias gb='git branch'
alias gbc='git checkout -b'
alias gbx='git branch -d'
alias gbX='git branch -D'

alias gc='git commit --verbose'
alias gca='git commit --amend'
alias gcf='git commit --amend --no-edit HEAD'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcs='git show'

alias gd='git diff --no-ext-diff'
alias gdc='git diff --no-ext-diff --cached'

alias gf='git fetch'
alias gfa='git fetch --all'
alias gfp='git fetch --prune'
alias gfc='git clone'
alias gfm='git pull'
alias gfmu='git pull upstream "${$(git symbolic-ref HEAD 2> /dev/null)##refs/heads/}"'
alias gfr='git pull --rebase'

alias gg='git grep'

alias gia='git add'
alias giA='git add --patch'
alias gir='git reset'

alias gl='git log --topo-order --stat --pretty=format:"${tazsha_git_log_format_brief}"'
alias glc='git shortlog --summary --numbered'
alias glo='git log --topo-order --pretty=format:"${tazsha_git_log_format_oneline}"'
alias glg='git log --topo-order --all --graph --pretty=format:"${tazsha_git_log_format_oneline}"'

alias gm='git merge'

alias gp='git push'
alias gpf='git push --force'
alias gpa='git push --all'
alias gpc='git push --set-upstream origin "${$(git symbolic-ref HEAD 2> /dev/null)##refs/heads/}"'

alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias grs='git rebase --skip'

alias gR='git remote'

alias gs='git stash'
alias gsa='git stash apply'
alias gsd='git stash show --patch --stat'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash save --include-untracked'
alias gsS='git stash save --patch --no-keep-index'
alias gsw='git stash save --include-untracked --keep-index'
alias gsx='git stash drop'

alias gS='git submodule'
alias gSa='git submodule add'
alias gSf='git submodule foreach'
alias gSi='git submodule init'
alias gSI='git submodule update --init --recursive'
alias gSl='git submodule status'
alias gSs='git submodule sync'
alias gSu='git submodule foreach git pull origin master'

alias gws='git status --short'
alias gwS='git status'
alias gwc='git clean -fd'
alias gmv='git mv'
alias grm='git rm'
