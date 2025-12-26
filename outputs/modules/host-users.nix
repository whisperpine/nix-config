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

  # Configure udev.
  services.udev.extraRules = ''
    # Add udev rule for i2c devices.
    SUBSYSTEM=="i2c-dev", GROUP="i2c"
    # Rule for Vial keyboards (detects the unique Vial serial tag).
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="${username}", TAG+="uaccess", TAG+="udev-acl"
  '';

  # To reduce the time waiting for the following task when shutting down:
  # "A stop job is running for user manager for user@1000.service"
  # This config modifies this file: "/etc/systemd/user.conf".
  systemd.user.extraConfig = "DefaultTimeoutStopSec=5";

  # Clean up old files under "~/.local/share/Trash".
  # Run the following command to list all user scope configs:
  # "systemd-tmpfiles --user --cat-config"
  systemd.user.tmpfiles.users."${username}".rules = [
    # Type Path Mode User Group Age Argument.
    "d /home/${username}/.local/share/Trash/files - - - bmA:15d -"
    "d /home/${username}/.local/share/Trash/info - - - bmA:15d -"
  ];
}
