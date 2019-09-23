function leftwmLoadTheme
  set -l options (fish_opt --short h --long hook -r)
  set -a options (fish_opt --short t --long theme -r)
  argparse $options -- $argv

  if set -q _flag_hook
    set hook $_flag_hook
  else
    echo "No hook specified"
    exit 1
  end

  if set -q _flag_theme
    set themeFile $_flag_theme
  else
    echo "No theme specified"
    exit 1
  end


  #down the last running theme
  if test -f "/tmp/leftwm-theme-down"
    /tmp/leftwm-theme-down
    rm /tmp/leftwm-theme-down
  end


  ln -s $hook /tmp/leftwm-theme-down

  echo "LoadTheme $themeFile" > $XDG_RUNTIME_DIR/leftwm/commands.pipe
end

function leftwmUnloadTheme
  echo "UnloadTheme" > $XDG_RUNTIME_DIR/leftwm/commands.pipe
end