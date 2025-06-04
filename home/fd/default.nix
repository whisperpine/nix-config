{ pkgs, ... }:
{
  home.packages = with pkgs; [ fd ];

  home.file.".fdignore".source = ./.fdignore;
}
