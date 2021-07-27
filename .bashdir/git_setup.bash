# -----------------------------------------------------------
#
# Setup for git
#
# -----------------------------------------------------------

sourceIt /usr/local/etc/bash_completion.d/git-completion.bash

alias gs="git status"
alias gc="git commit"
alias gcw="git commit -m \"work-in-progress\""
alias gac="git add -A && git commit -m "
alias gp="git pull --recurse-submodules"

# Show the file's git history
alias glog="git log --all --oneline --decorate --graph"

# List the files involved in latest commit or specify a commit
alias gfiles="git show --name-only"

# List the updated files in as yet unpushed commits
alias gu='git log --name-only origin/master..HEAD'

# -----------------------------------------------------------

