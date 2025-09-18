# Shell Scripts

This directory contains shell scripts:

- Some of them are meant to be executed as commands, see [#scripts-as-commands](#scripts-as-commands).
- Some of them are meant to be copied and executed elsewhere, see [#copy-and-run](#copy-and-run).

## Scripts as Commands

Scripts that are meant to be executed as commands require these conditions:

- The directory is added to the PATH environment variable
  (see [zsh](../home/zsh/default.nix), [bash](../home/bash/default.nix), [nushell](../home/nushell/config.nu)).
- The script files have execution permission (run `ls -lh scripts/as-commands/`
  to check permissions). Thus don't forget to run `chmod +x FILEPATH` to grant
  execution permission for these files when adding new one.

Scripts:

- [convert-to-webp.sh](./as-commands/convert-to-webp.sh):
  batch-convert PNG and JPG files to WebP.
- [punctuation-cjk-to-ascii.sh](./as-commands/punctuation-cjk-to-ascii.sh):
  convert CJK punctuations to ASCII ones.

## Copy and Run

- [auto-commit-push.sh](./auto-commit-push.sh):
  git commit all changes and push.
- [check-typos-in-files.sh](./check-typos-in-files.sh):
  check typos in pre-commit hook and CI.
