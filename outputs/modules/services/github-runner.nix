{ config, hostname, ... }:
# ---------- github-runner configs ---------- #
# Refer to the following NixOS options:
# https://search.nixos.org/options?channel=unstable&query=github-runner
{
  services.github-runners."everbid" = {
    enable = true;
    name = "nixos-${hostname}";
    tokenFile = config.sops.secrets."github-runner-token/everbid/org".path;
    url = "https://github.com/everbid";
    replace = true;
  };

  services.github-runners."whisperpine-notes" = {
    enable = true;
    name = "nixos-${hostname}";
    tokenFile = config.sops.secrets."github-runner-token/whisperpine/notes".path;
    url = "https://github.com/whisperpine/notes";
    replace = true;
  };

  services.github-runners."whisperpine-resume" = {
    enable = true;
    name = "nixos-${hostname}";
    tokenFile = config.sops.secrets."github-runner-token/whisperpine/resume".path;
    url = "https://github.com/whisperpine/resume";
    replace = true;
  };

  services.github-runners."whisperpine-business-email" = {
    enable = true;
    name = "nixos-${hostname}";
    tokenFile = config.sops.secrets."github-runner-token/whisperpine/business-email".path;
    url = "https://github.com/whisperpine/business-email";
    replace = true;
  };
}
