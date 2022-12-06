#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -lF'
PS1='[\u@\h \W]\$ '

############# SETTING DEFAULT EDITOR ###################
export EDITOR='vim'
export VISUAL='vim'
export HISTCONTROL=ignoreboth:erasedups

###############################
alias v=vim
alias cfi='vim /home/haopu/.config/i3/config'
alias brc='vim /home/haopu/.bashrc'
alias df='df -h'
alias grep='grep --color=auto'

################### Bash Powerline status #################
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi


#### System Update Pacman

#### List ls aliases
alias la='ls -alF | less'
alias ll='ls -alFh'
alias l='ls'
alias l.="ls -A | grep -E '^\.'"
##alias urbit='ssh -i ~/.ssh/oracle.key ubuntu@130.61.255.175'
alias rg='ranger'
alias cls='clear'

## Check disk size of files or directories
## example: ds /home/haopu/Documents
## example: ds /home/haopu/Downloads/movies.mkv
alias ds='du -sh'

#### Fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias update='sudo pacman -Syu'

#### userList
alias userlist="cut -d: f1 /etc/passwd | sort"

#### GRUB update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#### Switch between bash, zsh and fish
## alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
## alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
## alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#### Hardware Info --short
alias hw="hwinfo --short | less"

#### Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#### Shutdown, Reboot and Suspend
alias ssn="sudo shutdown now"
alias sr="sudo reboot"
alias sus="sudo systemctl suspend"
alias rbash='source ~/.bashrc'
#### ex = Extractor for all kings of archives
#### usage: ex <file>
ex ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1	;;
			*.tar.gz)    tar xzf $1   ;;
      		*.bz2)       bunzip2 $1   ;;
      		*.rar)       unrar x $1   ;;
      		*.gz)        gunzip $1    ;;
      		*.tar)       tar xf $1    ;;
      		*.tbz2)      tar xjf $1   ;;
      		*.tgz)       tar xzf $1   ;;
      		*.zip)       unzip $1     ;;
      		*.Z)         uncompress $1;;
      		*.7z)        7z x $1      ;;
      		*.deb)       ar x $1      ;;
      		*.tar.xz)    tar xf $1    ;;
      		*.tar.zst)   tar xf $1    ;;
      		*)           echo "'$1' cannot be extracted via ex()" ;;
    	esac
  	else
    	echo "'$1' is not a valid file"
  fi
}

#### BTRFS aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"

#### Update mirrors
alias mirror='sudo reflector --country India,Germany --protocol https --latest 10 --age 12  --number 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrors='mirror'

### git bare: config alias
alias config='/usr/bin/git --git-dir=/home/haopu/.cfg/ --work-tree=/home/haopu'
. "$HOME/.cargo/env"


##### System Status ####
status() {
	{
		echo -e "\nUptime:"
		uptime
		echo -e "\nDisk Space:"
		df -h 2> /dev/null
		echo -e "\nInodes:"
		df -i 2> /dev/null
		echo -e "\nBlock devices:"
		blkid
		echo -e "\nMemory:"
		free -m
		if [[ -r /var/log/syslog ]]; then
			echo -e "\nSyslog:"
			tail /var/log/syslog
		fi
		if [[ -r /var/log/messages ]]; then
			echo -e "\nMessages:"
			tail /var/log/message
		fi
	} | less
}

