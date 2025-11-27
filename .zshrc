#for tmux stuff..
alias tmux="tmux -2"
#-------- ZSH Shell Only {{{
#------------------------------------------------------
# ignore duplicates from ~/.zsh_history
setopt histignoredups
setopt nonomatch   # don't error on unmatched globs (portable aliases)
cfg-zsh-history() { $EDITOR $HISTFILE ;}
# }}}
#-------- Oh My ZSH {{{
#------------------------------------------------------
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gallois"
# ZSH_THEME="wezm"
ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git 
npm
pip
node
bower
zsh_reload
zsh-autosuggestions
)


source $ZSH/oh-my-zsh.sh
#source $ZSH/custom/plugins/auto-fu.zsh/auto-fu.zsh
# optional plugins (guarded so login doesn't error on missing files)
[ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
    source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
#zsh-syntax-highlighting this is a plugin to be added.
_zsh_syntax_highlight=${ZSH_SYNTAX_HIGHLIGHTING:-$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh}
[ -f "$_zsh_syntax_highlight" ] && source "$_zsh_syntax_highlight"

DISABLE_AUTO_TITLE=true

#

# }}}




#-------- debians default zshrc binding {{{
#------------------------------------------------------
# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

# READNULLCMD=${PAGER:-/usr/bin/pager}
# 
# if [[ "$TERM" != emacs ]]; then
# [[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char
# [[ -z "$terminfo[khome]" ]] || bindkey -M emacs "$terminfo[khome]" beginning-of-line
# [[ -z "$terminfo[kend]" ]] || bindkey -M emacs "$terminfo[kend]" end-of-line
# [[ -z "$terminfo[kich1]" ]] || bindkey -M emacs "$terminfo[kich1]" overwrite-mode
# [[ -z "$terminfo[kdch1]" ]] || bindkey -M vicmd "$terminfo[kdch1]" vi-delete-char
# [[ -z "$terminfo[khome]" ]] || bindkey -M vicmd "$terminfo[khome]" vi-beginning-of-line
# [[ -z "$terminfo[kend]" ]] || bindkey -M vicmd "$terminfo[kend]" vi-end-of-line
# [[ -z "$terminfo[kich1]" ]] || bindkey -M vicmd "$terminfo[kich1]" overwrite-mode
# 
# [[ -z "$terminfo[cuu1]" ]] || bindkey -M viins "$terminfo[cuu1]" vi-up-line-or-history
# [[ -z "$terminfo[cuf1]" ]] || bindkey -M viins "$terminfo[cuf1]" vi-forward-char
# [[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" vi-up-line-or-history
# [[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" vi-down-line-or-history
# [[ -z "$terminfo[kcuf1]" ]] || bindkey -M viins "$terminfo[kcuf1]" vi-forward-char
# [[ -z "$terminfo[kcub1]" ]] || bindkey -M viins "$terminfo[kcub1]" vi-backward-char
# 
# # ncurses fogyatekos
# [[ "$terminfo[kcuu1]" == "O"* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" vi-up-line-or-history
# [[ "$terminfo[kcud1]" == "O"* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" vi-down-line-or-history
# [[ "$terminfo[kcuf1]" == "O"* ]] && bindkey -M viins "${terminfo[kcuf1]/O/[}" vi-forward-char
# [[ "$terminfo[kcub1]" == "O"* ]] && bindkey -M viins "${terminfo[kcub1]/O/[}" vi-backward-char
# [[ "$terminfo[khome]" == "O"* ]] && bindkey -M viins "${terminfo[khome]/O/[}" beginning-of-line
# [[ "$terminfo[kend]" == "O"* ]] && bindkey -M viins "${terminfo[kend]/O/[}" end-of-line
# [[ "$terminfo[khome]" == "O"* ]] && bindkey -M emacs "${terminfo[khome]/O/[}" beginning-of-line
# [[ "$terminfo[kend]" == "O"* ]] && bindkey -M emacs "${terminfo[kend]/O/[}" end-of-line
# fi
# 
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
# 			     /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# 
# unalias run-help
# autoload run-help
# 
# # If you don't want compinit called here, place the line
# # skip_global_compinit=1
# # in your $ZDOTDIR/.zshenv or $ZDOTDIR/.zprofice
# if [[ -z "$skip_global_compinit" ]]; then
#   autoload -U compinit
#   compinit
# fi

#}}}

if [ -f ~/.myAlias ]; then
    . ~/.myAlias
fi


#-------- Auto Start Tmux Session {{{
#------------------------------------------------------
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
# TMUX
if which tmux 2>&1 >/dev/null; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux -2

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi
#
#}}}


#syntax highlighter

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

#		ZSH Stuff
#======================================================
#-------- Commands {{{
#------------------------------------------------------
# Show dots if tab compeletion is taking long to load
expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#}}}
#-------- Global Alias {{{
#------------------------------------------------------
# usage: cp NF ND, cd ND, xdg-open NF, ...etc
alias -g ND='*(/om[1])' 		# newest directory
alias -g NF='*(.om[1])' 		# newest file

#alias -g NE='2>|/dev/null'
alias -g NO='&>|/dev/null'
alias -g P='2>&1 | $PAGER'
alias -g L='| less'
alias -g M='| most'
alias -g C='| wc -l'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
# some global aliases for redirection
alias -g N="&>/dev/null"
alias -g 1N="1>/dev/null"
alias -g 2N="2>/dev/null"
alias -g DN="/dev/null"
alias -g PI="|"
# Paging with less / head / tail
alias -g LS='| less -S'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g TRIM='| cut -c 1-$COLUMNS'
alias -g H='| head'
alias -g HL='| head -n $(( +LINES ? LINES - 4 : 20 ))'
alias -g EH='|& head'
alias -g EHL='|& head -n $(( +LINES ? LINES - 4 : 20 ))'
alias -g TL='| tail -n $(( +LINES ? LINES - 4 : 20 ))'
alias -g ET='|& tail'
alias -g ETL='|& tail -n $(( +LINES ? LINES - 4 : 20 ))'
# Sorting / counting
alias -g C='| wc -l'
alias -g SS='| sort'
alias -g Su='| sort -u'
alias -g Sn='| sort -n'
alias -g Snr='| sort -nr'

#}}}
#-------- Suffix Alias {{{
#------------------------------------------------------
# open file with default program base on extension
# Ex: 'alias -s avi=mplayer' makes 'file.avi' execute 'mplayer file.avi'

alias -s {avi,flv,mkv,mp4,mpeg,mpg,ogv,wmv}=$PLAYER
alias -s {flac,mp3,ogg,wav}=$MUSICER
alias -s {gif,GIF,jpeg,JPEG,jpg,JPG,png,PNG}="background $IMAGEVIEWER"
alias -s {djvu,pdf,ps}="background $READER"
alias -s txt=$EDITOR
alias -s epub="background $EBOOKER"
alias -s {cbr,cbz}="background $COMICER"
# might conflict with emacs org mode
alias -s {at,ch,com,de,net,org}="background $BROWSER"

# archive extractor
alias -s ace="unace l"
alias -s rar="unrar l"
alias -s {tar,bz2,gz,xz}="tar tvf"	#tar.bz2,tar.gz,tar.xz
alias -s zip="unzip -l"

#}}}
#-------- Vim Mode {{{
#------------------------------------------------------
# enable vim mode on commmand line
bindkey -v


# edit command with editor ( good for long commands )
# http://stackoverflow.com/a/903973
# usage: type someshit then Esc+v or v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line



# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=1

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char	#backspace
bindkey '^H' backward-delete-char


# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward


# vim mode status cursor color change
# http://andreasbwagner.tumblr.com/post/804629866/zsh-cursor-color-vi-mode
# http://reza.jelveh.me/2011/09/18/zsh-tmux-vi-mode-cursor

# bug; 112 ascii randomly showing up

#zle-keymap-select () {
#  if [ $KEYMAP = vicmd ]; then
#    if [[ $TMUX = '' ]]; then
#      echo -ne "\033]12;Red\007"
#    else
#      printf '\033Ptmux;\033\033]12;red\007\033\\'
#    fi
#  else
#    if [[ $TMUX = '' ]]; then
#      echo -ne "\033]12;Grey\007"
#    else
#      printf '\033Ptmux;\033\033]12;grey\007\033\\'
#    fi
#  fi
#}
#zle-line-init () {
#  zle -K viins
#  echo -ne "\033]12;Grey\007"
#}
#zle -N zle-keymap-select
#zle -N zle-line-init

# }}}
#--------------------------------------------------------------------------
#http://jaredforsyth.com/blog/2010/may/30/easy-zsh-auto-completion/
## http://zshwiki.org/home/examples/compctl

# ZSH completions# {{{
compdef _pids cpulimit
setopt completealiases

# calibredb
# _cmpl_calibredb() {
# alias -g search="list -s"
# 		
#     reply=(add remove search)
# }
# compctl -K _cmpl_calibredb cmx-comic cmx-dojinshi cmx-eurotica cmx-hanime cmx-normal cmx-textbook $@

# surfraw bookmarks
_cmpl_surfraw() {
	reply=($(awk 'NF != 0 && !/^#/ {print $1}' ~/.config/surfraw/bookmarks | sort -n))
}
compctl -K _cmpl_surfraw srb
fzf_surfraw() { zle -I; surfraw $(cat ~/.config/surfraw/bookmarks | fzf | awk 'NF != 0 && !/^#/ {print $1}' ) ; }; zle -N fzf_surfraw; bindkey '^W' fzf_surfraw

# playonlinux
_cmpl_playonlinux_run() {
	reply=(ls -1 ~/.PlayOnLinux/shortcuts)
}
compctl -K _cmpl_playonlinux_run pol
# fzf_playonlinux_run() { zle -I; playonlinux --run $(ls -1 ~/.PlayOnLinux/shortcuts | fzf) ; }; zle -N fzf_playonlinux_run; bindkey '^P' fzf_playonlinux_run

# fzf_hotkey_playonlinux() { zle -I; @dmenu ; }; zle -N fzf_hotkey_playonlinux; bindkey '^ ' fzf_hotkey_playonlinux

# fzf_surfraw() { zle -I; surfraw $(awk 'NF > 0' ~/.config/surfraw/bookmarks | fzf | awk 'NF != 0 && !/^#/ {print $1}' ) ; }; zle -N fzf_surfraw; bindkey '^W' fzf_surfraw

	# reply=($(awk 'NF != 0 && !/^#/ {print $1}' ~/.config/surfraw/bookmarks | sort -n))
# }}}

# hp: you define a function, you make a widget out of it with zle -N funcname, then you  bind that
# slmenukey() { zle -I; xe ; }; zle -N slmenukey; bindkey '^F' slmenukey
#hw() { zle -I; echo hello world; }; zle -N hw; bindkey '^[[4~' hw
#bindkey -s '^[[4~' 'echo hello\n'


# bindkey -s '^O' "fzf-dmenu\n"

#-------- Keybinding {{{
#------------------------------------------------------

# history search using up and down arrow keys
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init () {
    emulate -L zsh
    printf '%s' ${terminfo[smkx]}
  }
  function zle-line-finish () {
    emulate -L zsh
    printf '%s' ${terminfo[rmkx]}
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

autoload -Uz history-search-end
if PATH= whence history-search-end >/dev/null 2>&1; then
  zle -N history-beginning-search-backward-end history-search-end
  zle -N history-beginning-search-forward-end history-search-end
  [ "$terminfo[kcuu1]" ] && bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
  [ "$terminfo[kcud1]" ] && bindkey "$terminfo[kcud1]" history-beginning-search-forward-end
fi


# function bind to a hotkey
fzf_history() { zle -I; eval $(history | fzf +s | sed 's/ *[0-9]* *//') ; }; zle -N fzf_history; bindkey '^F' fzf_history

fzf_killps() { zle -I; ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} ; }; zle -N fzf_killps; bindkey '^Q' fzf_killps

fzf_cd() { zle -I; DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf) && cd "$DIR" ; }; zle -N fzf_cd; bindkey '^E' fzf_cd

#}}}

# disable zsh autocorrect
# https://coderwall.com/p/jaoypq
unsetopt correct_all

# Sourcing node version manager.
if [ -s /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
elif [ -s /opt/homebrew/opt/nvm/nvm.sh ]; then
    source /opt/homebrew/opt/nvm/nvm.sh
fi

#Including powerline stuff..
if [ -f "$HOME/bin/powerline/bindings/zsh/powerline.zsh" ]; then
    . "$HOME/bin/powerline/bindings/zsh/powerline.zsh"
fi

#tmux-powerline to show pwd
PROMPT="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
