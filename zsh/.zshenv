# Keep .zshenv minimal and focused on environment variables
# that are needed for both interactive and non-interactive shells

# Ensure path arrays don't contain duplicates
typeset -U path PATH

# Add basic paths that should be available everywhere
path=(~/.local/bin $path)

# Export PATH to make it available to other processes
export PATH

# Load Cargo environment if available
if [[ -f $HOME/.cargo/env ]]; then
    source $HOME/.cargo/env
fi

# Essential environment variables
export ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm" # The AUR package installs it to here.
export KUBECONFIG="$HOME/.kube/config"
export KUBE_EDITOR=nvim
export SYSTEMD_LESS=FRXMK
