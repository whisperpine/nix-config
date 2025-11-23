# error if a .env file doesn't exist.

set dotenv-required := true

# list all available subcommands
_default:
  @just --list

# build and switch (manually set HOSTNAME in .env)
deploy:
  echo ${HOSTNAME}
  nixos-rebuild switch --sudo \
    --flake .#$HOSTNAME \
    --impure

# build and switch on darwin (manually set HOSTNAME in .env)
darwin:
  echo ${HOSTNAME}
  sudo darwin-rebuild switch \
    --flake .#$HOSTNAME \
    --impure

# build and show trace in verbose level
debug:
  echo ${HOSTNAME}
  nixos-rebuild build --sudo \
    --show-trace --verbose \
    --flake .#$HOSTNAME \
    --impure

# show profile history
history:
  nix profile history --profile /nix/var/nix/profiles/system

# remove all generations older than 7 days

# For non-home-manager profiles
clean:
  sudo nix profile wipe-history \
    --profile /nix/var/nix/profiles/system --older-than 7d

# garbage collect all unused nix store entries
gc:
  sudo nix store gc --debug
  # also removes old profile generations
  sudo nix-collect-garbage --delete-old
  # clean up user profiles in XDG directories:
  # https://github.com/NixOS/nix/issues/8508
  nix-collect-garbage --delete-old
