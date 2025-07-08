{
  pkgs,
  hostname,
  username,
  ...
}:
#----------  host & users configuration ----------#
{
  networking.hostName = hostname;
  nix.settings.trusted-users = [ username ];
  users.groups."${username}" = { };
  users.users."${username}" = {
    name = username;
    description = username;
    home = "/home/${username}";
    shell = pkgs.nushell;
    isNormalUser = true;
    group = "yusong";
  };
}
