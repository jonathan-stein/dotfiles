export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE="$HOME/.fzf"

ZSH_THEME="robbyrussell"

plugins=(
  git
  fzf
  aliases
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"
