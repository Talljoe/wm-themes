#! /usr/bin/env nix-shell
#! nix-shell deps.nix -i fish
# vim: ts=2:sw=2:et:ft=fish

set -g themeDir $argv[-1]
source $themeDir/../../lib/common.fish
source $themeDir/../../lib/leftwm.fish

setBackground --color black --mode center $themeDir/assets/down.png

xresourcesRemove $themeDir/xresources
leftwmUnloadTheme

pkill compton
pkill polybar
