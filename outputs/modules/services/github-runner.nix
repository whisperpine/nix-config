{
  lib,
  config,
  pkgs,
  hostname,
  ...
}:
# ---------- github-runner configs ---------- #
# Refer to the following NixOS options:
# https://search.nixos.org/options?channel=unstable&query=github-runner
let
  workDir = runner: "/var/lib/github-runner-work/${runner}";
  chownWorkDir =
    runner:
    pkgs.writeShellScript "github-runner-${runner}-chown-workdir.sh" ''
      chown --reference="$STATE_DIRECTORY" "$HOME"
    '';
  organization =
    { org, index }:
    let
      runner = "${org}-${index}";
    in
    {
      services.github-runners."${runner}" = {
        enable = true;
        replace = true;
        ephemeral = true;
        name = "nixos-${hostname}-${index}";
        tokenFile = config.sops.secrets."github-runner-token/${org}/org".path;
        url = "https://github.com/${org}";
        workDir = workDir runner;
        serviceOverrides.ExecStartPre = [ "+${chownWorkDir runner}" ];
      };
      systemd.tmpfiles.rules = [ "d ${workDir runner} 0777 root root -" ];
    };
  whisperpine =
    { repo, index }:
    let
      runner = "whisperpine-${repo}-${index}";
    in
    {
      services.github-runners."${runner}" = {
        enable = true;
        replace = true;
        ephemeral = true;
        name = "nixos-${hostname}-${index}";
        tokenFile = config.sops.secrets."github-runner-token/whisperpine/${repo}".path;
        url = "https://github.com/whisperpine/${repo}";
        workDir = workDir runner;
        serviceOverrides.ExecStartPre = [ "+${chownWorkDir runner}" ];
      };
      systemd.tmpfiles.rules = [ "d ${workDir runner} 0777 root root -" ];
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
    (organization {
      org = "everbid";
      index = "4";
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
