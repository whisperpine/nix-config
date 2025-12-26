{ pkgs, lib, ... }:
# ---------- steam configs ---------- #
let
  # Check if the system is x86_64-linux.
  isX86_64 = pkgs.stdenv.hostPlatform.system == "x86_64-linux";
in
{
  config = lib.mkIf isX86_64 {
    # Enable steam.
    programs.steam.enable = true;
    # Enable Gamescope (highly recommended for Wayland/Niri).
    # This allows you to run games in a micro-compositor to fix resolution/focus issues.
    programs.steam.gamescopeSession.enable = true;
  };
}
