{ pkgs, ... }:
#---------- bun configuration ----------#
{
  systemd.user.services.bun-add = {
    description = "Install npm packages globally via bun";
    wantedBy = [ "default.target" ]; # starts when user session starts
    serviceConfig.Type = "oneshot";
    script = ''
      ${pkgs.bun}/bin/bun add -g @ansible/ansible-language-server
      ${pkgs.bun}/bin/bun pm cache rm --global
    '';
  };
}
