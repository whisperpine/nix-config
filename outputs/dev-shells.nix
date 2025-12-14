# NOTE: manually run `direnv reload` after changing this file (as a workaround).
# This file change isn't automatically detected by direnv somehow.
inputs:
let
  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  forEachSupportedSystem =
    f:
    inputs.nixpkgs.lib.genAttrs supportedSystems (
      system: f { pkgs = import inputs.nixpkgs { inherit system; }; }
    );
in
forEachSupportedSystem (
  { pkgs }:
  {
    default = pkgs.mkShellNoCC {
      # The Nix packages installed in the dev environment.
      packages = with pkgs; [
        husky # managing git hooks
        just # just a command runner
        git-cliff # changelog generator
        cocogitto # conventional commit toolkit
      ];
      # The shell script executed when the environment is activated.
      shellHook = ''
        # Print the last modified date of "flake.lock".
        stat flake.lock | grep "Modify" |
          awk '{printf "\"flake.lock\" last modified on: %s", $2}' &&
          echo " ($((($(date +%s) - $(stat -c %Y flake.lock)) / 86400)) days ago)"
        # Install git hook managed by husky.
        if [ ! -e "./.husky/_" ]; then
          husky install
        fi
      '';
    };
  }
)
