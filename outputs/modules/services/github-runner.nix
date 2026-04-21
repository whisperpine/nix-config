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
  organization =
    { org, index }:
    {
      services.github-runners."${org}-${index}" = {
        enable = true;
        replace = true;
        ephemeral = true;
        name = "nixos-${hostname}-${index}";
        tokenFile = config.sops.secrets."github-runner-token/${org}/org".path;
        url = "https://github.com/${org}";
      };
    };
  whisperpine =
    { repo, index }:
    {
      services.github-runners."whisperpine-${repo}-${index}" = {
        enable = true;
        replace = true;
        ephemeral = true;
        name = "nixos-${hostname}-${index}";
        tokenFile = config.sops.secrets."github-runner-token/whisperpine/${repo}".path;
        url = "https://github.com/whisperpine/${repo}";
      };
    };
in
{
  config = lib.mkMerge [
    # ---------------------- #
    # organization "everbid"
    # ---------------------- #

    (organization {
      org = "everbid";
      index = "0";
    })
    (organization {
      org = "everbid";
      index = "1";
    })
    (organization {
      org = "everbid";
      index = "2";
    })
    (organization {
      org = "everbid";
      index = "3";
    })

    # --------------------- #
    # personal repositories
    # --------------------- #

    (whisperpine {
      repo = "notes";
      index = "0";
    })
    # (whisperpine {
    #   repo = "resume";
    #   index = "0";
    # })
    # (whisperpine {
    #   repo = "business-email";
    #   index = "0";
    # })
  ];
}
