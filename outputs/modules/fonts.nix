{ pkgs, ... }:
# ----------  fonts configs ---------- #
{
  # Install fonts.
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    sarasa-gothic
    cascadia-code
  ];
}
