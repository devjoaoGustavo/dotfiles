#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s "$HOME/git-completion.bash" ]] && source "$HOME/git-completion.bash" # Load RVM into a shell session *as a function*
