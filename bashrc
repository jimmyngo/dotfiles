# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# SHELL OPTIONS - SHOPT
shopt -s autocd
shopt -s histappend
shopt -s cdspell

declare -x PS1='\u@\h \W \$ '
#
# ENVIRONMENT VARIABLES
declare -x FIGNORE=".svn"
declare -x LESS="deMX"
declare -x HISTORYFILESIZE=10000
declare -x HISTSIZE=10000
declare -x PATH=$PATH:.
declare -x PROMPT_DIRTRIM=2


#
# ALIASES
#
alias j='jobs'
alias ll='ls -AlF'
alias ls='/bin/ls -lF'
alias lsa='/bin/ls -AlF'
alias lss='/bin/ls -F'
alias sql='sqlite3'

#
# ENVIRONMENT VARIABLES
#

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

# Disable Ctrl-S for flow control
stty -ixon
