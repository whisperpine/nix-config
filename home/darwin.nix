{ ... }:
let
  configuration =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        colima
        docker
        docker-compose
      ];
    };
in
{
  imports = [
    ./base.nix
    configuration
  ];
}
