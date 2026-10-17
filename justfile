# error if a .env file doesn't exist.

set dotenv-required := true

# list all available subcommands
_default:
  @just --list

# ----- #
# build
# ----- #

# build nixos and switch after reboot (manually set HOSTNAME in .env)
[group("build")]
boot:
  echo ${HOSTNAME}
  nixos-rebuild boot --sudo \
    --flake .#$HOSTNAME \
    --impure

# build and switch nixos (manually set HOSTNAME in .env)
[group("build")]
deploy:
  echo ${HOSTNAME}
  nixos-rebuild switch --sudo \
    --flake .#$HOSTNAME \
    --impure

# build and switch on darwin (manually set HOSTNAME in .env)
[group("build")]
darwin:
  echo ${HOSTNAME}
  sudo darwin-rebuild switch \
    --flake .#$HOSTNAME \
    --impure

# -----
# debug
# -----

# build and show trace in verbose level
[group("debug")]
debug:
  echo ${HOSTNAME}
  nixos-rebuild build --sudo \
    --show-trace --verbose \
    --flake .#$HOSTNAME \
    --impure

# list generations and show profile history
[group("debug")]
history:
  nixos-rebuild list-generations
  nix profile history --profile /nix/var/nix/profiles/system

# -------- #
# maintain
# -------- #

# garbage collect all unused nix store entries
[group("maintain")]
gc:
  # clean up nix store and remove old profile generations
  sudo nix-collect-garbage --delete-old
  # clean up user profiles in XDG directories:
  # https://github.com/NixOS/nix/issues/8508
  nix-collect-garbage --delete-old
  # replace identical files in the store by hard links
  nix store optimise
