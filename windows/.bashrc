# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.3-3

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Programmable completion enhancements are enabled via
# /etc/profile.d/bash_completion.sh when the package bash_completetion
# is installed.  Any completions you add in ~/.bash_completion are
# sourced last.

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle ()
# {
#   echo -ne "\e]2;$@\a\e]1;$@\a";
# }
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func

alias tmx="tmux"
alias tks="tmux kill-session -t"
alias tsc="tmux switch-client -t"
alias tka="tmux kill-server"
alias tls="tmux ls"
alias tas="tmux a -t"
alias tns="tmux new -s"
alias tnd="tmux new -d -s"

function te() { echo "terraform $@"; terraform $@; }
function td() { echo "terraform destroy -auto-approve $@"; terraform destroy -auto-approve "$@"; }
function ta() { echo "terraform apply -auto-approve $@"; terraform apply -auto-approve "$@"; }
function ti() { echo "terraform init $@"; terraform init $@; }

alias g="git"

check-alias() {
    case "$1" in
        --tmux)
            echo 'alias tmx="tmux"'
            echo 'alias tks="tmux kill-session -t"'
            echo 'alias tsc="tmux switch-client -t"'
            echo 'alias tka="tmux kill-server"'
            echo 'alias tls="tmux ls"'
            echo 'alias tas="tmux a -t"'
            echo 'alias tns="tmux new -s"'
            echo 'alias tnd="tmux new -d -s"'
            ;;
        --terraform)
            echo 'te() { echo "terraform $@"; terraform "$@"; }'
            echo 'td() { echo "terraform destroy -auto-approve $@"; terraform destroy -auto-approve "$@"; }'
            echo 'ta() { echo "terraform apply -auto-approve $@"; terraform apply -auto-approve "$@"; }'
            echo 'ti() { echo "terraform init $@"; terraform init "$@"; }'
            ;;
        --git)
	    echo 'po = "!f() { echo git push origin \"$@\"; git push origin \"$@\"; }; f"'
	    echo 'c = "!f() { echo git checkout \"$@\"; git checkout \"$@\"; }; f"'
	    echo 'f = "!f() { echo git fetch origin \"$@\"; git fetch origin \"$@\"; }; f"'
	    echo 'cm = "!f() { echo git commit -m \"$*\"; git commit -m \"$*\"; }; f"'
	    echo 'ps = "!f() { echo git push --set-upstream origin \"$@\"; git push --set-upstream origin \"$@\"; }; f"'
	    echo 'p = "!f() { echo git pull origin \"$@\"; git pull origin \"$@\"; }; f"'
	    echo 's = "!f() { echo git status \"$@\"; git status \"$@\"; }; f"'
	    echo 'b = "!f() { echo git branch \"$@\"; git branch \"$@\"; }; f"'
	    echo 'del = "!f() { echo git push origin --delete \"$@\"; git push origin --delete \"$@\"; }; f"'
	    echo 'a = "!f() { echo git add --all \"$@\"; git add --all \"$@\"; }; f"'
	    echo 'fp = "!f() { echo git fetch --prune \"$@\"; git fetch --prune \"$@\"; }; f"'
	    echo 'alias g="git"'
            ;;
        *)
            check-alias --tmux
            echo ''
            check-alias --terraform
            echo ''
            check-alias --git
            ;;
    esac
}

#eval "$(zoxide init --cmd cd bash)"
eval "$(zoxide init bash)"

function cd() { 
    z "$@"; 
    pwd; 
    echo ""; 
    count=$(ls -1Aa | wc -l); 
    if [ "$count" -lt 50 ]; then 
        ls -a; 
    else 
        echo "More than 50 files, skipping 'ls'"; 
    fi 
}

if [[ $TERM == "screen" ]]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi

