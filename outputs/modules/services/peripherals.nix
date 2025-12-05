{ ... }:
# ----------  peripherals configs ---------- #
{
  # Bluetooth configs.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

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
