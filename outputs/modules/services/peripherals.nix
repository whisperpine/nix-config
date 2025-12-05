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

  # ---------------- #
  # Printing configs
  # ---------------- #

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # ---------------- #
  # Lighting configs
  # ---------------- #

  # Enable OpenRGB.
  services.hardware.openrgb.enable = true;
  # Add OpenRGB udev rules to allow access without running as root.
  services.udev.extraRules = lib.readFile "${pkgs.openrgb}/lib/udev/rules.d/60-openrgb.rules";
  # Disable RGB lighting.
  systemd.services.no-rgb = {
    description = "Turn off all OpenRGB-controlled lighting";
    # Run at a crucial point in the boot sequence.
    wantedBy = [ "basic.target" ];
    # Make sure required OpenRGB services/devices are initialized.
    after = [
      "udev.service"
      "systemd-modules-load.service"
    ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.openrgb}/bin/openrgb --mode static --color 000000";
    };
  };

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
    # If you need low-latency Pro Audio (like Ardour, Jack).
    jack.enable = true;
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
