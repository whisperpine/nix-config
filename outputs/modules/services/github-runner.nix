{
  lib,
  config,
  hostname,
  ...
}:
# ---------- github-runner configs ---------- #
# Refer to the following NixOS options:
# https://search.nixos.org/options?channel=unstable&query=github-runner
let
  everbidOrg = index: {
    services.github-runners."everbid-${index}" = {
      enable = true;
      replace = true;
      ephemeral = true;
      name = "nixos-${hostname}-${index}";
      tokenFile = config.sops.secrets."github-runner-token/everbid/org".path;
      url = "https://github.com/everbid";
    };
  };
  whisperpineNotes = index: {
    services.github-runners."whisperpine-notes-${index}" = {
      enable = true;
      replace = true;
      ephemeral = true;
      name = "nixos-${hostname}-${index}";
      tokenFile = config.sops.secrets."github-runner-token/whisperpine/notes".path;
      url = "https://github.com/whisperpine/notes";
    };
  };
  whisperpineResume = index: {
    services.github-runners."whisperpine-resume-${index}" = {
      enable = true;
      replace = true;
      ephemeral = true;
      name = "nixos-${hostname}-${index}";
      tokenFile = config.sops.secrets."github-runner-token/whisperpine/resume".path;
      url = "https://github.com/whisperpine/resume";
    };
  };
  whisperpineBusinessEmail = index: {
    services.github-runners."whisperpine-business-email-${index}" = {
      enable = true;
      replace = true;
      ephemeral = true;
      name = "nixos-${hostname}-${index}";
      tokenFile = config.sops.secrets."github-runner-token/whisperpine/business-email".path;
      url = "https://github.com/whisperpine/business-email";
    };
  };
in
{
  config = lib.mkMerge [
    (everbidOrg "0")
    (everbidOrg "1")
    (everbidOrg "2")
    (whisperpineNotes "0")
    (whisperpineResume "0")
    (whisperpineBusinessEmail "0")
  ];
}
