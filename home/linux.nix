{ config, pkgs, pkgs-stable, ... }:
let
  configuration = { pkgs, config, ... }: {
    home.username = "yusong";
    home.homeDirectory = "/home/yusong";
    home.packages = with pkgs; [
      helm
    ];
  };
in
{
  imports = [
    ./base
    configuration
  ];
}
