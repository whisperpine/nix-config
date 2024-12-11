{ ... }:
let
  configuration =
    { pkgs, ... }:
    {
      # home.packages = with pkgs; [ ];
    };
in
{
  imports = [
    ./base.nix
    configuration
  ];
}
