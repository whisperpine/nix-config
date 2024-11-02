{ config, pkgs, pkgs-stable, ... }:
let
  configuration = { pkgs, config, ... }: {
    home.username = "yusong";
    home.homeDirectory = "/home/yusong";
    home.packages = with pkgs; [
      lua-language-server
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
