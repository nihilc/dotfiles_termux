#!/bin/zsh

#-> Config <-#
source $ZDOTDIR/config/settings
#-> Keybinds <-#
source $ZDOTDIR/config/keybinds
#-> Aliases <-#
source $ZDOTDIR/config/aliases
#-> Plugins <-#
source $ZDOTDIR/config/plugins
#-> PROMPT <-#
ZSH_THEME="simple"
source $ZDOTDIR/themes/$ZSH_THEME.zsh-theme
