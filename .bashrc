# .bashrc

# User specific aliases and functions

# Source global definitions

### common setting
# set -o vi
setterm -blank 0
#set convert-meta on

### for history setting
# 第一句的作用是将命令追加到 history 中。第二句是在显示命令提示符时，保存 history。
shopt -s histappend 
PROMPT_COMMAND='history -a'
HISTSIZE=20000
HISTFILESIZE=2000000   ###.bash_history 文件大小最大1KB



### for completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### for man like vim
vman() {
    export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
                     vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
                     -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
                     -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

    # invoke man page
    man $1

    # we muse unset the PAGER, so regular man pager is used afterwards
    unset PAGER
}
# alias man='vman'
# alias info='info --vi-keys'
# alias man='pinfo'

### for alias

#add tenym
alias q='exit'
alias op='vim -p .'
alias chd='chmod 777'
alias tpr='sudo service tftpd-hpa restart'
alias tp='rm -rf /home/tengym/tftp/hiapp.elf;cp ./hiapp.elf /home/tengym/tftp -rf;chmod 777 /home/tengym/tftp/hiapp.elf'
alias get='git clone git@192.168.1.109:/home/git/repositories/'

alias a='apvlv'
alias c='cd'
alias e='evince -f'
alias f='find . -name'
alias F='find . -iname'
alias g='g++ *.cpp'
alias k='kermit'
alias l='ls -hl --color=auto'
alias n='netstat -n -t -u -p'
alias p='cd ..'
alias S='ssh -o StrictHostKeyChecking=no'
alias v='gvim -p'
alias V='gvim -p'
alias x='startx'
alias m='make'
alias r='trash'

alias rl='trash-list'
alias rr='restore-trash'

alias pp='cd ../../'
alias du='du -h --max-depth=1'
alias vi='vim -p'
alias cp='cp -iv'
alias psa='ps -a'
alias psg='ps -A | grep '
alias mp='mplayer'
alias mpp='mplayer -playlist'
alias mpa='mplayer * -shuffle'
alias rm='rm -i --preserve-root -v'
alias rmm='rm -rf'

alias vcp='gvim -p --cmd "let g:ycp_on=1"'

alias indentcpp='astyle -A1 -f -p -c -j -y -z2 -U'
alias indentlinux='indent -npro -linux'
alias googleastyle='astyle --style=java -N -S -M -p -H -U -k1'

alias SCP='scp -o StrictHostKeyChecking=no'

# git
# GIT_SSH
alias gstu='git status -u'
alias gst='git status'
alias gsh='git show'
alias glog='git log --oneline'
alias gloga='git log --pretty=short --name-status'
alias gc='git commit -m'
alias gcl='git commit . -m'
alias gca='git commit -a -m'
alias gbr='git branch'
alias gco='git checkout'
alias gls='git ls-files'
alias gdf='git diff'
alias gdf_prev='git diff HEAD^'
alias gf='git diff --name-only'
alias gsu='git svn fetch;git svn rebase -l;git svn rebase;git svn info'

#svn
alias stt='svn status'
alias svt='svn status -uq'
alias sc='svn commit'
alias sl='svn log -l 8'
alias sls='svn list -R'
alias sdf='svn diff --diff-cmd tkdiff'
alias sup='svn update'
alias sdf_prev='svn diff --diff-cmd tkdiff -r PREV'
alias sdf_base='svn diff --diff-cmd tkdiff -r BASE'
alias sdf_head='svn diff --diff-cmd tkdiff -r HEAD'

alias ls='ls -F --color=always'
alias ll='ls -lh'
alias la='ls -ah'

alias ma='make ARCH=arm'
alias me='make example'
alias mae='make ARCH=arm example'
alias mt='make tools'
alias mat='make ARCH=arm tools'
alias mac='make ARCH=arm clean'
alias madc='make ARCH=arm distclean'
alias mi='make install'
alias mm='make;make install'
alias mc='make clean'
alias mdc='make distclean'
alias mu='make menuconfig'
alias mau='make menuconfig ARCH=arm'
alias mif='make install_func_test'
alias maif='make ARCH=arm install_func_test'
alias ut='make run_unit_test'
alias ft='make run_func_test'
alias mcut='make check_unit_test'
alias mcft='make check_func_test'
alias mf='make func_test'
alias maf='make ARCH=arm func_test'

alias gp='grep -n --color=auto -H'
alias fs='find . -iname "*.[ch]" -o -iname "*.cpp"'

alias minicom='minicom -c on '
alias ctags='ctags --c++-kinds=+p --c-kinds=+px-n --fields=+iatfS --extra=+q -I __wur,__THROW,__nonnull+ '
alias tags='ctags -R;cscope -bkqR'
alias tg='ctags -R;cscope -bkqR'
alias tagsclean='/bin/rm ./cscope.*;/bin/rm ./tags'
alias alltagsclean='find . -name tags -o -name cscope.* | xargs /bin/rm'

_SUDO=`which sudo`
if [ -e /etc/debian_version ]; then
    alias si='$_SUDO aptitude install'
    alias sr='$_SUDO aptitude remove'
    alias srp='$_SUDO aptitude purge'
    alias SL='apt-file -c /work/cache/apt-file search'
    alias SLU='apt-file -c /work/cache/apt-file update'
	alias SS='apt-cache search'
	alias SH='apt-cache showpkg'
	alias ag='$_SUDO sh -c "aptitude update;aptitude -R upgrade;apt-get autoremove"'
	alias au='$_SUDO aptitude update'
elif [ -e /etc/arch-release ];then
    alias si='$_SUDO pacman -S'
    alias sr='$_SUDO pacman -R'
    alias srp='$_SUDO pacman -R'
    alias SL='$_SUDO pacman -Ql'
	alias SS='$_SUDO pacman -Ss'
	alias au='$_SUDO pacman -Syu'
	alias ag='$_SUDO pacman -Syu'
fi
#mount
#alias mount219='su -;route add default gw 192.168.100.1;mount -o nolock 192.168.1.219:/home/tengym /mnt;chdir /mnt'


# venv_cd () {
   # cd "$@" && 
# }
# alias cd="venv_cd" 

### export 
show_version_string()
{
    if [ -e ".svn" ];then
        echo "(svn)"
    elif [ -e ".hg" ];then
        echo "(hg)"
    elif [ -e ".bzr" ];then
        echo "(bzr)"
    else 
        git_ver=$(__git_ps1 "%s" 2> /dev/null)
        if [ $? != 0 ];then
            return
        fi
        if [ -n "$git_ver" ];then
            echo "(git:$git_ver)"
        fi
    fi
}

if [ $(whoami) == "root" ];then
    export PS1='\[\e[31;40m\]`show_version_string`\[\e[0m\]\[\e[1;31m\]\W\[\e[0m\]-> '
else
    export PS1='\[\e[32;40m\]`show_version_string`\[\e[0m\]\[\e[1;32m\]\W\[\e[0m\]-> '
fi
# export PS1='\u:\W \033[1;36m$(__git_ps1 "%s")\033[0m->'
# PS1='`a=$?;if [ $a -ne 0 ]; then echo -n -e "\[\e[01;32;41m\]{$a}"; fi`\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W`B=$(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/"); if [ "$B" != "" ]; then S="git"; elif [ -e .bzr ]; then S=bzr; elif [ -e .hg ]; then S="hg"; elif [ -e .svn ]; then S="svn"; else S=""; fi; if [ "$S" != "" ]; then if [ "$B" != "" ]; then M=$S:$B; else M=$S; fi; fi; [[ "$M" != "" ]] && echo -n -e "\[\e[33;40m\]($M)\[\033[01;32m\]\[\e[00m\]"`\[\033[01;34m\] $ \[\e[00m\]'

export EDITOR=vim
export PATH="/opt/hisi-linux/x86-arm/arm-hisiv200-linux/target/bin:$PATH"
export PATH="/opt/hisi-linux/x86-arm/arm-hisiv200-linux/bin:$PATH"
#export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export OOO_FORCE_DESKTOP=gtk3


### functions
echo_usb_disk()
{
    /bin/ls /dev/disk/by-id/usb-*part1
}

### for bak
bak_mnt_dir=/media/bak
bak_sfs_dir=/media/work_backup

bak()
{
    cpu_counts=`cat /proc/cpuinfo | grep "processor" | wc -l`

    bak_name="$1"

    if [ -z $bak_name ];then
        echo "param error."
        return 0
    fi

    bak_path=$(realpath $bak_name)
    if [ ! -d $bak_path ];then
        echo "$bak_path is not dir"
        return 0
    fi

    bak_name=$(basename $bak_path)
    bak_sfs=$bak_sfs_dir/$bak_name.sfs
    if [ -e "$bak_sfs" ];then
        whiptail --yesno "$bak_sfs is exist, continue?" 30 80
        if [ $? != 0 ];then
            return 0
        fi
        $_SUDO chattr -i $bak_sfs
        $_SUDO rm $bak_sfs
    fi
    $_SUDO mksquashfs $bak_path $bak_sfs -processors $cpu_counts
    $_SUDO chattr +i $bak_sfs
}

mbak()
{
    bak_name="$1"
    if [ -z $bak_name ];then
        echo "param error."
        return 0
    fi

    bak_sfs=$bak_sfs_dir/$bak_name.sfs
    if [ ! -e $bak_sfs ];then
        echo "not found $bak_sfs"
        return 1
    fi

    bak_root_dir=$bak_mnt_dir/$bak_name
    bak_aufs_dir=$bak_sfs_dir/aufs/$bak_name
    bak_mnt_sfs_dir=$bak_mnt_dir/sfs/$bak_name
    if [ ! -e $bak_root_dir ];then
        $_SUDO mkdir -p $bak_root_dir
        $_SUDO mkdir -p $bak_aufs_dir
        $_SUDO mkdir -p $bak_mnt_sfs_dir
        $_SUDO mount $bak_sfs $bak_mnt_sfs_dir
        $_SUDO mount -t aufs -o br:$bak_aufs_dir:$bak_mnt_sfs_dir=ro none $bak_root_dir
    fi
    cd $bak_root_dir
}

umbak()
{
    if [ ! -e $bak_mnt_dir ];then
        return 1
    fi

    while [ $# -gt 0 ]; do

        bak_name="$1"
        if [ -z $bak_name ];then
            echo "param error."
            return 0
        fi

        bak_root_dir=$bak_mnt_dir/$bak_name
        bak_aufs_dir=$bak_sfs_dir/aufs/$bak_name
        bak_mnt_sfs_dir=$bak_mnt_dir/sfs/$bak_name

        if [ ! -d $bak_root_dir ];then
            echo "not found $bak_root_dir"
            return 1
        fi
        $_SUDO umount $bak_root_dir
        $_SUDO umount $bak_mnt_sfs_dir
        $_SUDO rmdir $bak_root_dir
        $_SUDO rmdir $bak_mnt_sfs_dir

        shift
    done
}

_print_mbak()
{
    
    dirs=$(cd $bak_mnt_dir;/bin/ls */ -d)
    for dir in $dirs 
    do 
        sfs_dir=$(basename $dir)
        if [ "$sfs_dir" != "sfs" ];then
            echo "$sfs_dir"
        fi 
    done 
}

function _mbak_aliases () 
{
    cur=$2

    COMPREPLY=( $( basename -s .sfs -a $(cd $bak_sfs_dir;/bin/ls *.sfs) | grep ".*$cur.*") )
    return 0
}

function _umbak_aliases () 
{
    cur=$2

    if [ ! -e $bak_mnt_dir ];then
        return 1
    fi
    COMPREPLY=( $(_print_mbak | grep ".*$cur.*") )
    return 0
}

complete -F _mbak_aliases mbak
complete -F _umbak_aliases umbak

### for apparix
function to () {
   if test "$2"; then
     cd "$(apparix "$1" "$2" || echo .)";
   else
     cd "$(apparix "$1" || echo .)";
   fi
   pwd
}
function bm () {
   if test "$2"; then
      apparix --add-mark "$1" "$2";
   elif test "$1"; then
      apparix --add-mark "$1";
   else
      apparix --add-mark;
   fi
}
function portal () {
   if test "$1"; then
      apparix --add-portal "$1";
   else
      apparix --add-portal;
   fi
}
# function to generate list of completions from .apparixrc
function _apparix_aliases ()
{   cur=$2
    dir=$3
    COMPREPLY=()
    if [ "$1" == "$3" ]
    then
        COMPREPLY=( $( cat $HOME/.apparix{rc,expand} | \
                       grep "j,.*$cur.*," | cut -f2 -d, ) )
    else
        dir=`apparix -favour rOl $dir 2>/dev/null` || return 0
        eval_compreply="COMPREPLY=( $(
            cd "$dir"
            \ls -d *$cur* | while read r
            do
                [[ -d "$r" ]] &&
                [[ $r == *$cur* ]] &&
                    echo \"${r// /\\ }\"
            done
            ) )"
        eval $eval_compreply
    fi
    return 0
}
# command to register the above to expand when the 'to' command's args are
# being expanded
complete -F _apparix_aliases to


## vim:fdm=expr:fdl=0
## vim:fde=getline(v\:lnum)=~'^##'?'>'.(matchend(getline(v\:lnum),'##*')-2)\:'='

#停用终端的pause快捷键
stty -ixon
