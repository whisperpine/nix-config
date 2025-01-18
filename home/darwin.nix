{ ... }:
let
  configuration =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        colima
        docker
      ];
    };
in
{
  imports = [
    ./base.nix
    configuration
  ];
}
