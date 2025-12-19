{ config, username, ... }:
# ----------  sops-nix configs ---------- #
# NOTE: this module depends on:
# `sops-nix.darwinModules.sops` or `sops-nix.nixosModules.sops`
let
  homePath = config.users.users."${username}".home;
  keyFile = "${homePath}/.config/sops/age/keys.txt";
in
{
  sops.defaultSopsFile = ../../secrets/encrypted.yaml;
  # This is using an age key that is expected to already be in the filesystem.
  sops.age.keyFile = keyFile;
  # This is the actual specification of the secrets.
  sops.secrets."example-key" = { };
  sops.secrets."deepseek-api-key" = {
    owner = "${username}";
  };

  # Set system-wide environment variables.
  # Note: changes on these env vars need system reboot to take effect.
  # Note: ./nix-core.nix stores other env vars.
  environment.variables = {
    # This is required to override the default path.
    # https://github.com/getsops/sops?tab=readme-ov-file#23encrypting-using-age
    SOPS_AGE_KEY_FILE = keyFile;
    # This is used by avante.nvim, a neovim plugin. This makes nix "impure".
    AVANTE_DEEPSEEK_API_KEY =
      if builtins.pathExists config.sops.secrets.deepseek-api-key.path then
        "${builtins.readFile config.sops.secrets.deepseek-api-key.path}"
      else
        "";
  };
}
