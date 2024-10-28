{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      cmd_duration.disabled = true;
      battery.disabled = true;
      character = {
        success_symbol = "[##](default)";
        error_symbol = "[##](red)";
        vimcmd_symbol = "[##](default)";
      };
      git_status = {
        ahead = ">";
        behind = "<";
        diverged = "<>";
        renamed = "r";
        deleted = "x";
      };
    };
  };
}
