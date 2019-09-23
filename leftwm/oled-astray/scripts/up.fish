#! /usr/bin/env nix-shell
#! nix-shell deps.nix -i fish
# vim: ts=2:sw=2:et:ft=fish

set -g themeDir $argv[-1]
source $themeDir/../../lib/common.fish
source $themeDir/../../lib/leftwm.fish

leftwmLoadTheme --hook $themeDir/down --theme $themeDir/theme.toml

startCompton $themeDir/compton.config
startPolybar $themeDir/polybar.config
themeKitty $themeDir/kitty/kitty.config
setBackground --color black --mode fill \
  $themeDir/assets/h-heyerlein-riYdn15o96U-unsplash.jpg \
  $themeDir/assets/h-heyerlein-ndja2LJ4IcM-unsplash.jpg
