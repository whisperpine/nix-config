{ hostname, username, ... }:
#----------  host & users configuration for darwin ----------#
{
  networking.hostName = hostname;
  nix.settings.trusted-users = [ username ];
  users.users."${username}" = {
    name = username;
    description = username;
    home = "/Users/${username}";
  };
}
