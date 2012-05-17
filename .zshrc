# auto complete
autoload -U compinit
compinit

setopt auto_cd    # auto complete directory candidate
setopt auto_pushd # hitorize current directory
setopt correct
setopt list_packed
setopt nolistbeep

# zmv
autoload zmv

# predict
# autoload predict-on
# predict-on


# prompt
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m]%(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{${fg[white]}%}[%~]%{${reset_color}%}"

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# histroy
HISTFILE=~/.zsh_histroy
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups # ignore duplication commands
setopt share_history # share command history data


# git completion
autoload bashcompinit
bashcompinit
#source ~/.git-completion.sh

##################################
# aliases
##################################
export LSCOLORS=GxfxcxdxbxGgGdabagacad
alias ls="ls -G -w"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias finder='open -a Finder .'

alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'

#############################
# other settings
#############################
# for rvm(ruby version manager)
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
   	source $HOME/.rvm/scripts/rvm 
fi

# path
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/tools/android-sdk-mac_x86/tools:$PATH
export PATH=~/tools/android-sdk-mac_x86/platform-tools:$PATH


# display git branch in prompt
# see: http://d.hatena.ne.jp/uasi/20091017/1255712789
function rprompt-git-current-branch {
        local name st color

        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        if [[ -z $name ]]; then
                return
        fi
        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=${fg[green]}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=${fg[yellow]}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=${fg_bold[red]}
        else
                color=${fg[red]}
        fi

        # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
        # これをしないと右プロンプトの位置がずれる
        echo "%{$color%}$name%{$reset_color%} "
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
RPROMPT='[`rprompt-git-current-branch`%~]'
