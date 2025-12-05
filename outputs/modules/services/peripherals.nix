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

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
