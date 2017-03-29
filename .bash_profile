source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

alias player='cd ~/workspace/projects/ocs-player'
alias ocs_skylark='cd ~/workspace/projects/ocs-skylark'
alias skylark='cd ~/workspace/projects/ost-skylark'
alias vi='vim'

alias gc='git checkout'
alias gp='git pull'
alias gpu='git push'
alias gco='git commit -am'
alias gs='git status'

alias prettyjson='python -m json.tool'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
alias git_clean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:${PATH}"


