#For package updates
alias upgrade='sudo apt upgrade'
alias update='sudo apt update'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias autoremove='sudo apt autoremove'

#See global installed packeages
alias npm-ls='npm list -g --depth=0'

#git commamands simplified
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gsl='git stash list'
alias gsapl='git stash apply'
alias gsd='git stash drop'
alias gss='git stash save'
alias gpl='git pull'
alias gpo='git pull origin'
alias gpm='git push origin master'
alias glg='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

#git Reset and clean
#function gitr () {
#git config user.email && git config user.name
#git checkout -b "$@"
#gst
#git reset --hard origin/master
#gst
#git clean -df
#gst
#git pull origin master
#gst
#}

#ls alias for color-mode
alias lh='ls -lhaG'

# Go up 'n' folders
alias ..='cs ..'
alias ...='cs ../..'
alias ....='cs ../../..'
alias .....='cs ../../../..'

#refresh shell
alias reload='source ~/.bash_profile'

#Reload the keyboard binding for backslash and capslock
alias rkb='xmodmap ~/.Xmodmap'
alias x='exit'

#This is for printing the directory name while useing cd so use cs instead
function cs (){
  cd "$@" && ls
}

#MongoDb
#alias startmd='sudo service mongod start'
#alias stopmd='sudo service mongod stop'
#alias restartmd='sudo service mongod restart'

alias edtalias="edt /home/space-monkey/.bash_aliases"
alias edt="code"

#To compile c files
function runc (){
  gcc "$@" - o test
}

#some more ls aliases
alias ll='exa --icons -l --colour always'
#alias ll='ls -alF'
alias la='exa --icons -FBla --colour always'
#alias la='ls -A'
alias l='exa --icons --colour always'
#alias l='ls -CF'

#omz
alias zshconf="nano ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"
alias histf="nano ~/.cache/zsh/history"
alias v="vim"
