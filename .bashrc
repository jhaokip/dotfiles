#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

############# SETTING DEFATAUL EDITOR ###################
export EDITOR='vim'
export VISUAL='vim'
export HISTCONTROL=ignoreboth:erasedups

###############################
alias cfi='vim /home/haopu/.config/i3/config'
alias v=vim
alias df='df -h'
alias grep='grep --color=auto'

################### Bash Powerline status #################
#if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
#fi


#### System Update Pacman

#### List ls aliases
alias la='ls -a'
alias ll='ls -alFh'
alias l='ls'
alias l.="ls -A | grep -E '^\.'"

#### Fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias update='sudo pacman -Syu'

#### Free
alias free="free -mt"

#### userList
alias userlist="cut -d: f1 /etc/passwd | sort"

#### GRUB update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#### Switch between bash, zsh and fish
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#### Hardware Info --short
alias hw="hwinfo --short"

#### Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#### Shutdown or Reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

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
alias mirror='sudo reflector --protocol https --latest 10 --number 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrors='mirror'


































pfetch
alias config='/usr/bin/git --git-dir=/home/haopu/.cfg/ --work-tree=/home/haopu'
