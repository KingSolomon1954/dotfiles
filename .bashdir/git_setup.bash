# -----------------------------------------------------------
#
# Setup for git
#
# -----------------------------------------------------------

sourceIt /usr/local/etc/bash_completion.d/git-completion.bash

alias gs="git status"
alias gc="git commit -m"
alias gcw="git commit -m \"work-in-progress\""
alias gac="git add -A && git commit -m "
alias gp="git pull --recurse-submodules"
alias glog="git log --all --oneline --decorate --graph"
alias glast="git log -1 HEAD"

# List the files involved in latest commit or specify a commit
# alias glsc="git show --name-only"

# List the updated files in as yet unpushed commits
# alias glsu='git log --name-only origin/master..HEAD'

# Opens editor to set the current branch description
# alias gbe='git branch --edit-description'

# alias gsu="git submodule foreach 'git pull || :'"

# git config --global status.submoduleSummary true
# git config --global diff.submodule log

# git submodule foreach ‘git checkout master || :'
# git config -f .gitmodules submodule.docs-src/shared.branch master
# git config -f .gitmodules submodule.docs-src/shared.update merge

# https://medium.com/@porteneuve/mastering-git-submodules-34c65e940407
# https://betterdev.blog/handy-git-aliases/
# https://github.com/GitAlias/gitalias
# https://gist.github.com/robmiller/6018582
# https://gggritso.com/human-git-aliases
    
# -----------------------------------------------------------

