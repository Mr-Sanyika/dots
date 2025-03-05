# .zprofile is for login shells
# Add environment variables that should be available to login shells

export BROWSER='brave'

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG="en_GB.UTF-8"
fi

# Extend the path with additional directories
# Note: Basic paths are already set in .zshenv
path=($HOME/.local/share $HOME/.local/bin /usr/local/bin /usr/local/sbin $path)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

export TMPPREFIX="${TMPDIR%/}/zsh"

export GPG_TTY=$(tty)
export GPG_AGENT_INFO=""
#export GPG_AGENT_INFO=$HOME/.gnupg/S.gpg-agent

# fix for libreoffice
export SAL_USE_VCLPLUGN=gtk

export ANDROID_HOME=/opt/android-sdk
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
