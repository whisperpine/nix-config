{ pkgs, lib, ... }:
# ---------- binfmt and qemu ---------- #
{
  config = lib.mkMerge [
    (lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
      # Enable binfmt emulation for extra platforms.
      boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
      # Explicitly register aarch64 with the 'F' (fixBinary) flag.
      boot.binfmt.registrations.aarch64-linux = {
        interpreter = "${pkgs.qemu}/bin/qemu-aarch64";
        matchCredentials = true;
        fixBinary = true;
      };
    })

    (lib.mkIf pkgs.stdenv.hostPlatform.isAarch64 {
      # Enable binfmt emulation for extra platforms.
      boot.binfmt.emulatedSystems = [ "x86_64-linux" ];
      # Explicitly register aarch64 with the 'F' (fixBinary) flag.
      boot.binfmt.registrations.x86_64-linux = {
        interpreter = "${pkgs.qemu}/bin/qemu-x86_64";
        matchCredentials = true;
        fixBinary = true;
      };
    })
  ];
}
