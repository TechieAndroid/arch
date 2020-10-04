#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# Use bash-completion, if available

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \

. /usr/share/bash-completion/bash_completion
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'

alias steam='steam -noverifyfiles'
alias lolfetch='neofetch | lolcat'
alias meow='cat'
alias ytdl='youtube-dl'
alias neofetch-black='neofetch --ascii_colors 0 0  --colors'
alias neofetch='neofetch --ascii_colors 4 4 --colors 4 4 4 4 4 7'
alias pipes='pipes.sh -c#87'
alias sup='sudo pacman -Syu'
alias yup='yay -Syu'

PATH=$PATH:~/bin/
PATH=$PATH:~/pipes.sh/
PATH=$PATH:~/sm64nx/scripts/
