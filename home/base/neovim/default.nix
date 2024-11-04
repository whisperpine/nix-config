{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };
  xdg.configFile.nvim = {
    enable = true;
    recursive = true;
    source = ./nvim;
  };
  home.packages = with pkgs; [
    # linters
    shellcheck # shell linter

    # formatters
    # find all formatters here:
    # https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    nixfmt-rfc-style # nix formatter
    markdownlint-cli # markdown
    superhtml # html
    rustfmt # rust
    shfmt # shell formatter
    deno # javascript, typescript, json

    # language servers
    # find all language servers here:
    # https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    vscode-langservers-extracted # json, css
    typescript-language-server # typescript, javascript
    tailwindcss-language-server # tailwind css
    bash-language-server # bash shell
    yaml-language-server # yaml
    lua-language-server # lua
    markdown-oxide # markdown
    rust-analyzer # rust
    lemminx # xml, svg
    helm-ls # helm
    ruff # python
    taplo # toml
    nil # nix
  ];
}
