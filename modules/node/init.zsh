#
# Configures Node local installation, loads version managers, and defines
# variables and aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zeh Rizzatti <zehrizzatti@gmail.com>
#   Indrajit Raychaudhuri <irc@indrajit.com>
#

# # Possible lookup locations for manually installed nodenv and nvm.
# local_nodenv_paths=({$NODENV_ROOT,{$XDG_CONFIG_HOME/,$HOME/.}nodenv}/bin/nodenv(N))
# local_nvm_paths=({$NVM_DIR,{$XDG_CONFIG_HOME/,$HOME/.}nvm}/nvm.sh(N))

# # Load manually installed or package manager installed nodenv into the shell
# # session.
# if (( $#local_nodenv_paths || $+commands[nodenv] )); then

#   # Ensure manually installed nodenv is added to path when present.
#   [[ -s $local_nodenv_paths[1] ]] && path=($local_nodenv_paths[1]:h $path)

#   eval "$(nodenv init - zsh)"

# # Load manually installed nvm into the shell session.
# elif (( $#local_nvm_paths )); then
#   source "$local_nvm_paths[1]" --no-use

# # Load package manager installed nvm into the shell session.
# elif (( $+commands[brew] )) \
#       && [[ -d "${nvm_path::="$(brew --prefix 2> /dev/null)"/opt/nvm}" ]]; then
#   source "$nvm_path/nvm.sh" --no-use
# fi

# unset local_n{odenv,vm}_paths nvm_path

# Return if requirements are not found.
if (( ! $+commands[node] && ! $#functions[(i)n(odenv|vm)] )); then
  return 1
fi

#
# Variables
#

N_PREFIX="${XDG_CONFIG_HOME:-$HOME/.config}/n"  # The path to 'n' cache.

#
# Aliases
#

if ! zstyle -t ':prezto:module:node:alias' skip; then
  # pnpm
  alias pn='pnpm'
  alias pni='pnpm install'
  alias pns='pnpm list'
  alias pno='pnpm outdated'
  alias pnp='pnpm publish'
  alias pnP='pnpm prune'
  alias pnr='pnpm run'
  alias pns='pnpm search'
  alias pnt='pnpm test'
  alias pnu='pnpm update'
  alias pnx='pnpm uninstall'

  alias pnpmci='pnpm ci'
  alias pnpmcit='pnpm cit'
  alias pnpmit='pnpm it'
fi
