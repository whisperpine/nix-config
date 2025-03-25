# error if a .env file doesn't exist.
set dotenv-required

# build and switch (manully set HOSTNAME in .env)
deploy:
    echo ${HOSTNAME}
    nixos-rebuild switch \
        --use-remote-sudo \
        --flake .#$HOSTNAME \
        --impure

# build and switch on darwin (manully set HOSTNAME in .env)
darwin:
    echo ${HOSTNAME}
    darwin-rebuild switch \
        --flake .#$HOSTNAME \
        --impure

# build and show trace in verbose level
debug:
    echo ${HOSTNAME}
    nixos-rebuild build \
        --use-remote-sudo \
        --show-trace --verbose \
        --flake .#$HOSTNAME \
        --impure

# nix flake update
up:
    nix flake update

# show profile hisotry
history:
    nix profile history --profile /nix/var/nix/profiles/system

# remove all generations older than 7 days
clean:
    sudo nix profile wipe-history \
        --profile /nix/var/nix/profiles/system --older-than 7d

# garbage collect all unused nix store entries
gc:
    sudo nix store gc --debug
    sudo nix-collect-garbage --delete-old
    nix-collect-garbage --delete-old
