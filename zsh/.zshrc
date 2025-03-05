export EDITOR=nvim

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# thanks to https://github.com/dreamsofcode-io/dotfiles for the heads up
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '$HOME/.zshrc'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

### Added by Zinit's installer
if [[ -f $ZINIT_HOME ]]; then
  mkdir -p $HOME/.local/share/zinit/zinit.git
  command git clone https://github.com/zdharma-continuum/zinit $ZINIT_HOME
fi

source "$ZINIT_HOME/zinit.zsh"

autoload -Uz compinit 
compinit

### End of Zinit's installer chunk

zinit ice depth=1;
zinit light romkatv/powerlevel10k
zinit load maxrodrigo/zsh-terraform

[ -f ~/.zsh_secrets ] && source ~/.zsh_secrets

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# source <(kubectl completion zsh)
# source <(flux completion zsh)
# source <(helm completion zsh)

alias python-server="python -m http.server 8000 --bind 0.0.0.0"
alias lastBoot="sudo journalctl --since=today | tac | sed -n '/-- Reboot --/{n;:r;/-- Reboot --/q;p;n;b r}' | tac"
alias androiddbg="adb forward tcp:9222 localabstract:chrome_devtools_remote"
alias noise="play -n -c2 synth whitenoise band -n 100 24 band -n 300 100 gain +20"
alias vim='nvim'
alias vi='nvim'
alias tmr="~/.tmux/plugins/tmux-remote/tmux-remote.sh"
alias lzg='lazygit'
alias lzd='lazydocker'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

