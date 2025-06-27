# Yusong's Nix Config

[![Nix](https://img.shields.io/badge/Nix-5277C3?logo=nixos&logoColor=white)](https://github.com/NixOS)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/whisperpine/nix-config)](https://github.com/whisperpine/nix-config/commits/main/)
[![GitHub Issues or Pull Requests](https://img.shields.io/github/issues-pr-closed/whisperpine/nix-config)](https://github.com/whisperpine/nix-config/pulls)
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/whisperpine/nix-config/ci.yml)](https://github.com/whisperpine/nix-config/actions)
[![GitHub Tag](https://img.shields.io/github/v/tag/whisperpine/nix-config)](https://github.com/whisperpine/nix-config/tags)
[![GitHub License](https://img.shields.io/github/license/whisperpine/nix-config)](https://github.com/whisperpine/nix-config/blob/main/LICENSE)

This repository contains all my Nix configurations for desktops (NixOS and
macOS) and homelab servers.

Nix declaratively defines: operating system, software and their configurations.
This ensures consistency, reproducibility and hassle-free rolling back, which is
impossible to achieve just with dotfiles. Nix is also a good approach to manage
development environments.
See [whisperpine/dev-templates](https://github.com/whisperpine/dev-templates) to
learn more.

## Screenshots

[Neovim](https://github.com/neovim/neovim)
(based on [NvChad](https://github.com/NvChad/NvChad))
running inside [Zellij](https://github.com/zellij-org/zellij)
in [WezTerm](https://github.com/wezterm/wezterm):

![neovim-zellij](./assets/neovim-zellij.webp)

## Get Started

### NixOS-WSL

Download `nixos-wsl.tar.gz` from the [latest release](https://github.com/nix-community/NixOS-WSL/releases).

<details><summary>Install WSL and run NixOS with the default configuration.</summary>

```sh
# make sure wsl feature is enabled
wsl --install --no-distribution

# import the tarball into WSL
wsl --import DISTRO INSTALL_LOCATION FILENAME
# for example run the following command
wsl --import NixOS ~/NixOS/ path/to/nixos-wsl.tar.gz

# now you can run NixOS
wsl -d NixOS

# follow this instruction to change username:
# https://nix-community.github.io/NixOS-WSL/how-to/change-username.html
```

</details>

<details><summary>Pull this repository and apply the configurations.</summary>

```sh
# generate ssh key pairs
ssh-keygen -t rsa -b 2048
# add pub key to github user settings...

# enter a shell environment with git command included
nix shell --extra-experimental-features "nix-command flakes" nixpkgs#git
# clone this repo under user home directory
cd ~ && git clone git@github.com:whisperpine/nix-config.git
# back up the original /etc/nixos
sudo mv /etc/nixos /etc/nixos.bak
# create a symlink to /etc/nixos
sudo ln -s ~/nix-config /etc/nixos
# create .env file from template
cd ~/nix-config && cp example.env .env
# edit .env (follow the comment inside)
vim .env
# tada
sudo nixos-rebuild switch
```

</details>

### Nix-Darwin

<details><summary>Install nix and apply configurations on macOS.</summary>

```sh
# install nix
curl -L https://nixos.org/nix/install | sh
# generate ssh key pairs, add pub key to github user settings...

# clone this repo under user home directory
cd ~ && git clone git@github.com:whisperpine/nix-config.git

# create .env file from template
cd ~/.config/nix-config && cp example.env .env
# edit .env (follow the comment inside)
vim .env

# tada
nix --extra-experimental-features "nix-command flakes" \
  run nix-darwin -- switch --flake ~/.config/nix-config

# now darwin-rebuild is available
darwin-rebuild switch --flake ~/nix-config
```

</details>

Tip: `darwin-help` will open an HTML version of the man-page in the default browser.\
`man 5 configuration.nix` will open the manual of nix-darwin right in the terminal.

## Secret Management

Secrets are managed by [sops-nix](https://github.com/Mic92/sops-nix),
which is based on [sops](https://github.com/getsops/sops).\
Considering [age](https://github.com/FiloSottile/age) is used,
make sure *~/.config/sops/age/keys.txt* exists.

```sh
# decrypt and edit the encrypted file
sops secrets/encrypted.yaml
```

## Code Structure

```mermaid
flowchart LR
  flake(flake.nix)
  h_base(base)
  h_desktop(desktop)
  h_linux_wsl(linux-wsl)
  h_linux_server(linux-server)
  h_linux_desktop(linux-desktop)
  h_darwin_desktop(darwin-desktop)

  o_linux_wsl(linux-wsl)
  o_linux_server(linux-server)
  o_linux_desktop(linux-desktop)
  o_darwin_desktop(darwin-desktop)
  o_default(default)

  flake --> o_default

  subgraph outputs/
    o_default --> o_linux_desktop
    o_default --> o_linux_wsl
    o_default --> o_linux_server
    o_default --> o_darwin_desktop
  end

  subgraph home/
    o_linux_desktop -.-> h_linux_desktop
    o_linux_wsl -.-> h_linux_wsl
    o_linux_server -.-> h_linux_server
    o_darwin_desktop -.-> h_darwin_desktop

    h_linux_server --> h_base
    h_desktop --> h_base
    h_linux_desktop --> h_desktop
    h_linux_wsl --> h_desktop
    h_darwin_desktop --> h_desktop
  end
```

## Contributing

As this repository is for personal use, Pull Requests regarding new features or
refactor will *not* be accepted, but fixes are welcome and appreciated.
If you have any question, recommendation or related things to share,
feel free to [open a discussion](https://github.com/whisperpine/nix-config/discussions).

## References

- Learn Nix as a beginner: [An unofficial book for beginners](https://nixos-and-flakes.thiscute.world/).
- Find the nixpkgs git SHA of a given version of a package: [Nixhub](https://www.nixhub.io/).
- Search Home Manger options: [Home Manager Option Search](https://home-manager-options.extranix.com/).
- Search packages and system options: [NixOS Search](https://search.nixos.org/packages).
