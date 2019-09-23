function setBackground
  set -l options (fish_opt --short m --long mode -r)
  set -a options (fish_opt --short c --long color -r)
  argparse $options -- $argv

  switch $_flag_mode
    case fill max center tile scale
      set bgFlag --bg-$_flag_mode
    case "*"
      echo Unknown background mode: $_flag_mode
      return
  end

  if set -q _flag_color
    set bgColorFlag "-B $_flag_color"
  end

  feh $bgColorFlag $bgFlag $argv
end

function themeKitty -a kittyConfig
  if test -x kitty
    kitty @ set-colors -a -c $kittyConfig
  end
end

function startCompton -a config
  compton --config $config &
end

function startPolybar -a config
  # TODO: dynamic
  env MONITOR=eDP-1-1 polybar -c $config mainbar &
end

function xresourcesApply -a config
  xrdb -merge $config
end

function xresourcesRemove -a config
  xrdb -remove $config
end