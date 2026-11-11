{ pkgs, lib, ... }:
# ----------  peripherals configs ---------- #
{
  # ----------------- #
  # Bluetooth configs
  # ----------------- #

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # ------------------- #
  # USB storage devices
  # ------------------- #

  services.udisks2.enable = true;

  # ---------------- #
  # Logitech devices
  # ---------------- #

  # Logitech wireless devices.
  programs.solaar.enable = true;

  # # ---------------- #
  # # OpenTabletDriver
  # # ---------------- #
  #
  # hardware.opentabletdriver.enable = true;

  # ---------------- #
  # Printing configs
  # ---------------- #

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # ---------------- #
  # Power management
  # ---------------- #

  services.upower.enable = true;

  # ---------------------- #
  # Temperature management
  # ---------------------- #

  # thermald 2.5.12+ refuses to start on non-mobile platforms (pm_profile != 2/8),
  # which fatally aborts on this desktop. Upstream only validates tables for
  # mobile/tablet anyway; kernel thermal management still applies.
  services.thermald.enable = false;

  # ---------------- #
  # Lighting configs
  # ---------------- #

  # Enable OpenRGB.
  services.hardware.openrgb.enable = true;
  # Add OpenRGB udev rules to allow access without running as root.
  services.udev.extraRules = lib.readFile "${pkgs.openrgb}/lib/udev/rules.d/60-openrgb.rules";
  # Disable RGB lighting. The D_LED headers default to 0 LEDs, so they must
  # be resized before any color/mode command has an effect. OpenRGB has no
  # "Off" mode for the motherboard or GPU; Direct black is their off state.
  systemd.services.no-rgb = {
    description = "Turn off all OpenRGB-controlled lighting";
    # Run in the boot sequence.
    wantedBy = [ "multi-user.target" ];
    # Make sure the OpenRGB server and its devices are initialized first.
    after = [ "openrgb.service" ];
    wants = [ "openrgb.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStartPre = [
        # Give the OpenRGB server time to finish detecting devices.
        "${pkgs.coreutils}/bin/sleep 10"
        "${lib.getExe pkgs.openrgb} -d B760M -m direct -c 000000 -z 0 -sz 64 -z 1 -sz 64"
        "${lib.getExe pkgs.openrgb} -d B760M -m direct -c 000000"
        "${lib.getExe pkgs.openrgb} -d ENE -m off"
      ];
      ExecStart = "${lib.getExe pkgs.openrgb} -d RTX -m direct -c 000000";
    };
  };
  # Re-apply the off state after suspend/resume; firmware often restores
  # lighting during resume. Restart the server so it re-detects the devices.
  powerManagement.resumeCommands = ''
    systemctl restart openrgb.service || true
    systemctl restart no-rgb.service || true
  '';
  # Clean up old files under "/var/lib/OpenRGB/logs".
  systemd.tmpfiles.rules = [
    # Type Path Mode UID GID Age Argument.
    "d /var/lib/OpenRGB/logs - - - bmA:3d -"
  ];

  # ------------- #
  # Audio configs
  # ------------- #

  # Enable pipewire itself.
  services.pipewire = {
    enable = true;
    # Enable support for older ALSA clients (low-level access).
    alsa.enable = true;
    # Recommended for some 32-bit applications (like WINE).
    alsa.support32Bit = true;
    # Enable support for older PulseAudio clients (most desktop apps).
    pulse.enable = true;
    # # Note: LD_LIBRARY_PATH will be set if jack is enabled, which conflicts
    # # with other configs that also set LD_LIBRARY_PATH. Hence jack is commented.
    # # If you need low-latency Pro Audio (like Ardour, Jack).
    # jack.enable = true;
  };

  # Recommended to allow PipeWire to run with real-time scheduling for
  # lower latency and better audio performance.
  security.rtkit.enable = true;

  # Disable the older PulseAudio (PipeWire provides pulse support).
  services.pulseaudio.enable = false;

  # Advanced Linux Sound Architecture (ALSA).
  # Prevent volume issues on reboot.
  hardware.alsa.enablePersistence = true;
}
