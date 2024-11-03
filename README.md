# README

Yusong's NixOS Config.

## Reference

- [An unofficial book for beginners](https://nixos-and-flakes.thiscute.world/).
- [Home Manager Option Search](https://home-manager-options.extranix.com/).

## Get Started

### NixOS-WSL

Download `nixos-wsl.tar.gz` from the
[latest release](https://github.com/nix-community/NixOS-WSL/releases).

```sh
# make sure wsl feature is enabled
wsl --install --no-distribution

# import the tarball into WSL
wsl --import [Distro] [InstallLocation] [FileName]
# for example run the following command
wsl --import NixOS ~/NixOS/ path/to/nixos-wsl.tar.gz

# now you can run NixOS
wsl -d NixOS
```

Follow the instructions
[How to change the username](https://nix-community.github.io/NixOS-WSL/how-to/change-username.html)
to change username.

```sh
# generate ssh key pairs
cd ~ && ssh-keygen -t rsa -b 2048
# add pub key to github user settings...

# enter a shell environment with git command included
nix shell --extra-experimental-features "nix-command flakes" nixpkgs#git
# clone this repo under user home directory
git clone git@github.com:whisperpine/nix-config.git
# back up the original /etc/nixos
sudo mv /etc/nixos /etc/nixos.bak
# create a symlink to /etc/nixos
sudo ln -s ~/nix-config /etc/nixos
# tada
sudo nixos-rebuild switch
```

### Nix-Darwin

```sh
# install nix
curl -L https://nixos.org/nix/install | sh
# generate ssh key pairs, add pub key to github user settings...

# clone this repo under ~/.config
mkdir -p ~/.config && cd ~/.config
git clone git@github.com:whisperpine/nix-config.git

# tada
nix --extra-experimental-features "nix-command flakes" \
  run nix-darwin -- switch --flake ~/nix-config

# now darwin-rebuild is available
darwin-rebuild switch --flake ~/nix-config
```

Tip: `darwin-help` will open a HTML version of the man-page in the default browser.\
`man 5 configuration.nix` will open the manual of nix-darwin right in the terminal.
