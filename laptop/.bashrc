# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

PS1='\[\e[34m\]╔══<=\[\e[m\]\[\e[32m\]\u\[\e[m\]\e[34m\]>=\[\e[m\] \[\e[34m\]\[\e[m\]\[\e[35m\][\w]\[\e[m\[\e[34m\]\[\e[m\]
\[\e[34m\]╚══>>> \[\e[m\]\[\e[32m\]$\[\e[m\]'

#PATH=$PATH:/home/recompiler/.local/bin

alias vimuse="sudo vim /etc/portage/package.use"
alias vimaccept="sudo vim /etc/portage/package.accept_keywords"
alias vimmake="sudo vim /etc/portage/make.conf"
alias vimunmask="sudo vim /etc/portage/package.unmask"
alias ls="ls -aACghsS" #lhgSCA
alias ytdl="youtube-dl"
alias gup="sudo emerge --sync && sudo eix-sync && sudo emerge -au1 portage && sudo emerge -uDNpv world"

# Use fish in place of bash
# keep this line at the bottom of ~/.bashrc
[ -x /bin/fish ] && SHELL=/bin/fish exec fish