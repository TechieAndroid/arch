#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

alias lolfetch='neofetch | lolcat'
alias meow='cat'
alias ytdl='youtube-dl'
alias neofetch='neofetch --ascii_colors 0 0  --colors'
alias pipes='pipes.sh -c#87'
alias sup='sudo pacman -Syu'
alias yup='yay -Syu'

export PATH="/home/recompiler/pipes.sh/:$PATH"
