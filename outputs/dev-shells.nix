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
        typos # check misspelling
        just # just a command runner
        git-cliff # changelog generator
        cocogitto # conventional commit toolkit
        prek # better pre-commit
      ];
      # The shell script executed when the environment is activated.
      shellHook = /* sh */ ''
        # Print the last modified date of "flake.lock".
        git log -1 --format="%cd" --date=format:"%Y-%m-%d" -- flake.lock |
          awk '{printf "\"flake.lock\" last modified on: %s", $1}' &&
          echo " ($((($(date +%s) - $(git log -1 --format="%ct" -- flake.lock)) / 86400)) days ago)"
        # Install git hooks managed by prek.
        prek install --quiet
        # Insert legacy git hooks to prek-managed ones.
        sh ./scripts/insert-legacy-hooks.sh
      '';
    };
  }
)
