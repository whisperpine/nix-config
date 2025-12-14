{ ... }:
# ----------  fonts configs ---------- #
# This configuration cannot be shared with darwin.
# For darwin, please only import "./fonts-packages.nix".
{
  imports = [ ./fonts-packages.nix ];

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
}
