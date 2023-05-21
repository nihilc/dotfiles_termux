#-> XDG Base dir <-#
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

#-> History files <-#
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

#-> Fixing paths <-#
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo

#-> Path <-#
export PATH="$PATH:$HOME/.local/bin";
export PATH="$PATH:$HOME/.local/share/npm/bin";
export PATH="$PATH:$HOME/.config/composer/vendor/bin";
