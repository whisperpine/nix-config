{ ... }:
# ----------  networking configs ---------- #
{
  # Enable network manager.
  networking.networkmanager.enable = true;

  # Setup network proxy (in conjunction with e.g. clash).
  networking.proxy.default = "http://127.0.0.1:7897";
  networking.proxy.noProxy = "127.0.0.1,localhost";

  # Enable clash-verge and its service mode.
  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    autoStart = true;
  };
}
