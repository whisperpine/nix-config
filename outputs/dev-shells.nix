{ nixpkgs }:
let
  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  forEachSupportedSystem =
    f: nixpkgs.lib.genAttrs supportedSystems (system: f { pkgs = import nixpkgs { inherit system; }; });
in
forEachSupportedSystem (
  { pkgs }:
  {
    default = pkgs.mkShell {
      packages = with pkgs; [
        husky
        typos
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
