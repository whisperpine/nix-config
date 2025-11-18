{ hostname, username, ... }:
# ----------  host & users configs ---------- #
{
  networking.hostName = hostname;
  nix.settings.trusted-users = [ username ];
  users.groups."${username}" = { };
  users.users."${username}" = {
    name = username;
    description = username;
    home = "/home/${username}";
    # shell = "/etc/profiles/per-user/${username}/bin/nu";
    shell = "/etc/profiles/per-user/${username}/bin/zsh";
    # shell = "/sbin/bash";
    isNormalUser = true;
    group = "yusong";
  };

  # Clean up old files under "~/.local/share/Trash".
  # Run the following command to list all user scope configs:
  # "systemd-tmpfiles --user --cat-config"
  systemd.user.tmpfiles.users."${username}".rules = [
    # Type Path Mode User Group Age.
    "d /home/${username}/.local/share/Trash/files - - - 30d"
    "d /home/${username}/.local/share/Trash/info - - - 30d"
  ];
}
