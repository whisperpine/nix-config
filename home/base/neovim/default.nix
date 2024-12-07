{ pkgs, neovim-nightly-overlay, ... }:
{
  programs.neovim = {
    enable = true;
    # package = neovim-nightly-overlay.packages.${pkgs.system}.default;
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
    xmlstarlet # xml
    opentofu # terraform, opentofu
    sqlfluff # sql
    rustfmt # rust
    stylua # lua
    shfmt # shell
    ruff # python
    deno # typescript, javascript, json
    buf # protobuf

    # language servers
    # find all language servers here:
    # https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    dockerfile-language-server-nodejs # dockerfile
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
    clang-tools # c, cpp, objc
    lemminx # xml, svg
    helm-ls # helm
    texlab # latex
    taplo # toml
    sqls # sql
    nil # nix
  ];
}
