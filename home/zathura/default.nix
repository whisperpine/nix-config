{ pkgs, config, ... }:
# --- keyboard-first pdf reader --- #
let
  repoDir = builtins.getEnv "PWD";
  zathurarc = "${repoDir}/home/zathura/zathurarc";
in
{
  # Zathura documents:
  # https://pwmt.org/projects/zathura/documentation/

  home.packages = with pkgs; [
    zathura
    zathuraPkgs.zathura_pdf_mupdf
  ];

  xdg.mimeApps.associations.added = {
    "application/pdf" = "zathura.desktop";
  };

  xdg.configFile.zathurarc = {
    source = config.lib.file.mkOutOfStoreSymlink zathurarc;
    target = "./zathura/zathurarc";
  };
}
