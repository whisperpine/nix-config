# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.show_banner = false # true or false to enable or disable the welcome banner at startup
$env.config.table.mode = 'none' # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
$env.config.shell_integration.osc133 = false
$env.config.cursor_shape = {
  emacs: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
  vi_insert: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
  vi_normal: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
}

## To add entries to PATH
use std "path add"
path add "/opt/homebrew/bin"
path add "/etc/nixos/scripts/"
