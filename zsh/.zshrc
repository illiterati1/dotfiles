# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in $ZSH/plugins/
plugins=(git aliases colored-man-pages command-not-found extract safe-paste vi-mode web-search
  pip python
  archlinux systemd
  )

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PATH=$PATH:~/.cargo/bin:~/bin

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# personal aliases
alias zshconf="$EDITOR ~/.zshrc"
alias vim=nvim
alias svim="sudo nvim"
alias cl=clear
alias sudo='sudo -v; sudo '
alias sway="sway --unsupported-gpu"
alias cd=z

# Related to /etc/pacman.d/hooks/zsh.hook
TRAPUSR1() { rehash }

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Try to locate packages containing command
function command_not_found_handler {
  local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
  printf 'zsh: command not found: %s\n' "$1"
  local entries=(
  ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
)
if (( ${#entries[@]} ))
then
  printf "${bright}$1${reset} may be found in the following packages:\n"
  local pkg
  for entry in "${entries[@]}"
  do
    # (repo package version file)
    local fields=(
    ${(0)entry}
  )
  if [[ "$pkg" != "${fields[2]}" ]]
  then
    printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
  fi
  printf '    /%s\n' "${fields[4]}"
  pkg="${fields[2]}"
done
fi
return 127
}
