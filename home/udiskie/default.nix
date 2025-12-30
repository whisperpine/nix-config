{ ... }:
# --- disk automounter for udisks --- #
{
  services.udiskie = {
    enable = true;
    notify = false;
  };
}
