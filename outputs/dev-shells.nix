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
    default = pkgs.mkShell {
      packages = with pkgs; [
        husky # managing git hooks
        just # just a command runner
        git-cliff # changelog generator
        cocogitto # conventional commit toolkit
      ];
      shellHook = ''
        # install git hook managed by husky
        if [ ! -e "./.husky/_" ]; then
          husky install
        fi
      '';
    };
  }
)
