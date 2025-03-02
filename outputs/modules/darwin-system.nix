{ pkgs, config, ... }:
{
  # activationScripts are executed every time you boot the system
  # or run `nixos-rebuild` / `darwin-rebuild`.
  system.activationScripts.postUserActivation.text = ''
    # activateSettings -u will reload the settings from the database and apply
    # them to the current session, so we do not need to logout and login again
    # to make the changes take effect.
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  # Fix macOS Spotlight indexing issue.
  system.activationScripts.applications.text =
    # env: /nix/store/qn19jn8g89sggs7pk88hw7c04dswzgqd-system-applications
    # copying /nix/store/z2iqr3c02fg9mzgnmhdxagqhpilik8ic-wezterm-0-unstable-2025-02-23/Applications/WezTerm.app
    # copying /nix/store/nj3xprcrqyizlcykink7x5va474xp6vp-alacritty-0.15.1/Applications/Alacritty.app
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      echo "env: ${env}"
      rm -rf /Applications/NixApps
      mkdir -p /Applications/NixApps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/NixApps/$app_name"
      done
    '';

  # System preference.
  system.defaults = {
    dock.autohide = true;
    menuExtraClock.Show24Hour = true;
    finder.FXPreferredViewStyle = "clmv";
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
  };
}
