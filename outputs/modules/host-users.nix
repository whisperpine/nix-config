{ hostname, username, ... }:
# ----------  host & users configs ---------- #
{
  networking.hostName = hostname;
  nix.settings.trusted-users = [ username ];

  # The group whose name is the same as username.
  users.groups."${username}" = { };
  # The "i2c" group, used by "i2c-dev" kernel module.
  users.groups.i2c = { };

  # User configs.
  users.users."${username}" = {
    name = username;
    description = username;
    home = "/home/${username}";
    # shell = "/etc/profiles/per-user/${username}/bin/nu";
    shell = "/etc/profiles/per-user/${username}/bin/zsh";
    # shell = "/sbin/bash";
    isNormalUser = true;
    group = "${username}";
    extraGroups = [
      "i2c" # used by the "i2c-dev" kernel module
      "wheel" # allow using "sudo"
    ];
  };

  # Add udev rule for i2c devices.
  services.udev.extraRules = ''
    SUBSYSTEM=="i2c-dev", GROUP="i2c"
  '';

  # Clean up old files under "~/.local/share/Trash".
  # Run the following command to list all user scope configs:
  # "systemd-tmpfiles --user --cat-config"
  systemd.user.tmpfiles.users."${username}".rules = [
    # Type Path Mode User Group Age.
    "d /home/${username}/.local/share/Trash/files - - - 30d"
    "d /home/${username}/.local/share/Trash/info - - - 30d"
  ];
}
