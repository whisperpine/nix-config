{ pkgs, ... }:
# ----------  fonts packages configs ---------- #
# Darwin only supports "fonts.packages" but not other fonts configs.
{
  # Install fonts.
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    sarasa-gothic
    cascadia-code
    noto-fonts-cjk-sans
    noto-fonts
  ];
}
