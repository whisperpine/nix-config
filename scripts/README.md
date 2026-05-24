# Shell Scripts

This directory contains shell scripts:

- Some of them are meant to be executed as commands, see [Scripts as Commands](#scripts-as-commands).
- Some of them are meant to be copied and executed elsewhere, see [Copy and Run](#copy-and-run).

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
- [delete-github-default-labels.sh](./as-commands/delete-github-default-labels.sh):
  delete all default labels of github issues.
- [punctuation-cjk-to-ascii.sh](./as-commands/punctuation-cjk-to-ascii.sh):
  convert CJK punctuations to ASCII ones.
- [print-github-contributions.sh](./as-commands/print-github-contributions.sh):
  print your github contributions today.
- [validate-skills.sh](./as-commands/validate-skills.sh):
  validate all skills under the give directory.

## Copy and Run

- [auto-commit-push.sh](./auto-commit-push.sh):
  git commit all changes and push.
