{
  config,
  username,
  sops-nix,
  ...
}:
#----------  sops-nix configuration ----------#
{
  imports = [ sops-nix.nixosModules.sops ];

  sops.defaultSopsFile = ../../secrets/encrypted.yaml;
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
  # This is the actual specification of the secrets.
  sops.secrets."example-key" = { };
  sops.secrets."deepseek-api-key" = {
    owner = "${username}";
  };

  environment.variables = {
    DEEPSEEK_API_KEY = "${builtins.readFile config.sops.secrets.deepseek-api-key.path}";
  };
}
