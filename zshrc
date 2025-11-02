# Always work in a tmux session if tmux is installed
# https://github.com/chrishunt/dot-files/blob/master/.zshrc
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t hack || tmux new -s hack; exit
  fi
fi

set -o vi

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
NEWLINE=$'\n'
setopt PROMPT_SUBST
PROMPT='${NEWLINE}%F{green}%*%f %F{blue}%2~ %f %F{cyan}${vcs_info_msg_0_}%f${NEWLINE}$ '


PATH="~/bin/:/opt/homebrew/bin/:$PATH"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
alias tmuxhelp="cat ~/notes/tmux_cheatsheet.md | less"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/itsmed/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/itsmed/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/itsmed/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/itsmed/bin/google-cloud-sdk/completion.zsh.inc'; fi

# Created by `pipx` on 2022-11-08 16:50:48
export PATH="$PATH:/Users/itsmed/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
