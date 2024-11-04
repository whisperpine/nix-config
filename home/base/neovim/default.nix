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
    # formatters and linters
    # find all formatters here:
    # https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    nixfmt-rfc-style # nix formatter
    markdownlint-cli # markdown
    shellcheck # shell linter
    opentofu # terraform, opentofu
    rustfmt # rust
    stylua # lua
    shfmt # shell
    ruff # python
    deno # typescript, javascript, json

    # language servers
    # find all language servers here:
    # https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    vscode-langservers-extracted # json, css
    typescript-language-server # typescript, javascript
    tailwindcss-language-server # tailwind css
    bash-language-server # bash sh shell
    yaml-language-server # yaml
    lua-language-server # lua
    markdown-oxide # markdown
    rust-analyzer # rust
    terraform-ls # terraform
    basedpyright # python
    lemminx # xml, svg
    helm-ls # helm
    taplo # toml
    nil # nix
  ];
}
