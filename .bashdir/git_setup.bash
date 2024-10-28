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
alias gsp="git switch -"
alias gbl="git branch --list -a"
alias gsm="git switch master"
alias gsu="git submodule update --init --recursive"

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

# I don't use extra wrapper .sh files. My environment is Windows XP, git 1.7.1 on cygwin, and Beyond Compare 3. Following is my .git/config file.
# 
# [diff]
#     tool = bc3
# [difftool]
#     prompt = false
# [difftool "bc3"]
#     #use cygpath to transform cygwin path $LOCAL (something like /tmp/U5VvP1_abc) to windows path, because bc3 is a windows software
#     cmd = \"c:/program files/beyond compare 3/bcomp.exe\" "$(cygpath -w $LOCAL)" "$REMOTE"
# [merge]
#     tool = bc3
# [mergetool]
#     prompt = false
# [mergetool "bc3"]
#     #trustExitCode = true
#     cmd = \"c:/program files/beyond compare 3/bcomp.exe\" "$LOCAL" "$REMOTE" "$BASE" "$MERGED"
# 
# Then, I use $ git difftool to compare and $ git mergetool to merge.
# 
# About trustExitCode: For a custom merge command, specify whether the
# exit code of the merge command can be used to determine whether the
# merge was successful. If this is not set to true then the merge target
# file timestamp is checked and the merge assumed to have been
# successful if the file has been updated, otherwise the user is
# prompted to indicate the success of the merge.
# 
# --yehnan
