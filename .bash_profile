source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Bash prompt setup
show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\$(show_virtual_env)\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias gch='git checkout'
alias gp='git pull'
alias gpu='git push'
alias gco='git commit -am'
alias gs='git status'

alias prettyjson='python -m json.tool'

# Switching ssh keys for different git repos
alias gwork="cp ~/.ssh/id_rsa_work ~/.ssh/id_rsa && cp ~/.ssh/id_rsa_work.pub ~/.ssh/id_rsa.pub"
alias gpers="cp ~/.ssh/id_rsa_pers ~/.ssh/id_rsa && cp ~/.ssh/id_rsa_pers.pub ~/.ssh/id_rsa.pub"

eval "$(pyenv init -)"
eval "$(direnv hook bash)"
