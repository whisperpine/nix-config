{ pkgs, ... }:
#----------  fonts configuration ----------#
{
  # Install fonts.
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    sarasa-gothic
    cascadia-code
  ];
}
