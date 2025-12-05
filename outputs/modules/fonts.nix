{ pkgs, ... }:
# ----------  fonts configs ---------- #
{
  fonts = {
    # Keep default fonts installed.
    enableDefaultPackages = true;
    # Expose fonts to /run/current-system/sw/share/X11/fonts.
    fontDir.enable = true;
  };

  fonts.fontconfig = {
    enable = true;
    hinting.enable = false; # for high DPI
    subpixel.lcdfilter = "none"; # for high DPI
  };

  fonts.fontconfig.defaultFonts = {
    sansSerif = [
      "Noto Sans"
      "Noto Sans CJK SC"
      "Noto Sans CJK HK"
      "Noto Sans CJK TC"
      "Noto Sans CJK JP"
      "Noto Sans CJK KR"
    ];
    serif = [ "Noto Serif" ];
    monospace = [ "Noto Sans Mono" ];
    emoji = [ "Noto Color Emoji" ];
  };

  # Install fonts.
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    sarasa-gothic
    cascadia-code
    noto-fonts-cjk-sans
    noto-fonts
  ];
}
