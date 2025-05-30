{ pkgs, ... }:
{
  home.packages = [
    (pkgs.buildFHSEnv {
      name = "pixi";
      runScript = "pixi";
      targetPkgs = pkgs: with pkgs; [ pixi ];
    })
  ];
}
