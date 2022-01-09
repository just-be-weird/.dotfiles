echo "  ** KARMA - Never Give Up! **"
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Get the IP address of the host from /etc/resolv.conf
#export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
# Set the display path
#export DISPLAY=$WSL_HOST:0.0
#export DISPLAY=${DISPLAY:-$(grep -Po '(?<=nameserver ).*' /etc/resolv.conf):0}
export LIBGL_ALWAYS_INDIRECT=1
