# auto complete
autoload -U compinit
compinit

setopt auto_cd    # auto complete directory candidate
setopt auto_pushd # hitorize current directory
setopt correct
setopt list_packed
setopt nolistbeep


# predict
# autoload predict-on
# predict-on


# prompt
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[white]}%}[%~]%{${reset_color}%}"

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



# aliases
export LSCOLORS=GxfxcxdxbxGgGdabagacad
alias ls="ls -G -w"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

