#For package updates
alias upgrade='sudo apt upgrade'
alias update='sudo apt update'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias autorm='sudo apt autoremove'

#See global installed packeages
alias npm-ls='npm list -g --depth=0'
alias ns='npm start'

# git commamands simplified
alias gst=' git status'
alias gci=' git commit'
alias grb=' git rebase'
alias gbr=' git branch'
alias gad=' git add -A'
alias gsl=' git stash list'
alias gsapl=' git stash apply'
alias gsd=' git stash drop'
alias gss=' git stash save'
alias gpl=' git pull'
alias gpo=' git pull origin'
alias gpm=' git push origin master'
alias glg=' git log--graph --oneline --decorate'
#git Reset and clean
function gitr () {
 git config user.email && git config user.name
 git checkout NV-"$@"
 gst
 git reset --hard origin/NV-"$@"
 gst
 git clean -df
 gst
}
#git checkout and to nivoda
function gco () {
git config user.email && git config user.name
 # string='NV'
 # if [[ "$@" =~ "[0-9]" ]]; then
 # git checkout NV-"$@"
 # fi
 git checkout NV-"$@"

 gst
}
#git checkout and to nivoda
function gcn () {
 git config user.email && git config user.name
 # string='NV'
 # if [[ "$@" =~ "[0-9]" ]]; then
 # git checkout NV-"$@"
 # fi
 git checkout "$@"

 gst
}
function gbrc () {
 git config user.email && git config user.name
 # re='^[0-9]+$'
 # if [[ $@ =~ re ]]; then
 # git checkout -b NV-"$@"
 # fi
 git checkout -b NV-"$@"

 gst
}
# ls alias for color-mode
alias lh=' ls -lhaG'

#alias gk='git diff $* | kompare -'

# up 'n' folders
alias ..=' cs ..'
alias ...=' cs ../..'
alias ....=' cs ../../..'
alias .....=' cs ../../../..'

# refresh shell
alias reload='source ~/.bash_profile'
alias x='exit' 

#copy codebase files

#gk () { git diff $* | meld - ; }

#This is for printing the directory name while useing cd so use cs instead
function cs () {
 cd "$@" && ls
} 
    
#MongoDb
#alias startmd='sudo service mongod start'
#alias stopmd='sudo service mongod stop'
#alias restartmd='sudo service mongod restart'  

alias edt="code"
alias edtalias=" edt /home/abhishek/.bash_aliases"  


#gulp task
alias gp='gulp'
alias gl='gulp local'

alias devr='cs ~/dev/nivoda/codebase/website_ref'
alias devw='cs ~/dev/nivoda/codebase/website'
alias devi='cs ~/dev/nivoda/codebase/integrations'
alias devd='cs ~/dev/nivoda/codebase/diamonds'
