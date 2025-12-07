{ pkgs, ... }:
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
}
