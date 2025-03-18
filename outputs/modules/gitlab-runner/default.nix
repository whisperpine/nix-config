{ ... }:
{
  # Run the following command to see the generated config file:
  # sudo cat /var/lib/gitlab-runner/.gitlab-runner/config.toml

  # https://nixos.wiki/wiki/Gitlab_runner
  services.gitlab-runner = {
    enable = true;
    services = {
      # runner for building in docker via host's nix-daemon
      # nix store will be readable in runner, might be insecure
      nix = {
        # File should contain at least these two variables:
        # `CI_SERVER_URL` and `CI_SERVER_TOKEN`.
        # A list of all supported environment variables can be found with:
        # gitlab-runner register --help
        authenticationTokenConfigFile = toString ./gitlab-runner.env;
        registrationFlags = [
          ''--url ${builtins.getEnv "CI_SERVER_URL"}''
          ''--token ${builtins.getEnv "CI_SERVER_TOKEN"}''
        ];

        dockerImage = "alpine";
        dockerVolumes = [
          "/nix/store:/nix/store:ro"
          "/nix/var/nix/db:/nix/var/nix/db:ro"
          "/nix/var/nix/daemon-socket:/nix/var/nix/daemon-socket:ro"
        ];
        dockerDisableCache = true;

        environmentVariables = {
          ENV = "/etc/profile";
          USER = "root";
          NIX_REMOTE = "daemon";
          PATH = "/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:/bin:/sbin:/usr/bin:/usr/sbin";
          NIX_SSL_CERT_FILE = "/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt";
        };
      };
    };
  };
}
