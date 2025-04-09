{
  pkgs,
  # neovim-nightly-overlay,
  ...
}:
{
  programs.neovim = {
    enable = true;
    # package = neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  xdg.configFile.nvim = {
    enable = true;
    recursive = true;
    source = ../nvim;
  };

  imports = [
    ../marksman # markdown language server
    ../fd # telescope.nvim
  ];

  home.packages = with pkgs; [
    # required by neovim plugins
    lua5_1 # lazy.nvim
    luajitPackages.luarocks # lazy.nvim
    tree-sitter # tree-sitter.nvim
    yarn-berry # markdown-preview.nvim
    nodejs_22 # markdown-preview.nvim
    inotify-tools # file watcher used by LSP
    ripgrep # telescope.nvim
    gnumake # avante.nvim
    zk # zk-nvim

    # formatters and linters
    # find all formatters here:
    # https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    nixfmt-rfc-style # nix formatter
    markdownlint-cli # markdown
    shellcheck # shell linter
    xmlstarlet # xml
    opentofu # terraform, opentofu
    sqruff # sql
    rustfmt # rust
    stylua # lua
    shfmt # shell
    biome # ts, js, css, json, graphql
    deno # ts, js, json, css
    ruff # python
    buf # protobuf

    # language servers
    # find all language servers here:
    # https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    dockerfile-language-server-nodejs # dockerfile
    vscode-langservers-extracted # json, css, html
    typescript-language-server # typescript, javascript
    tailwindcss-language-server # tailwind css
    svelte-language-server # svelte
    bash-language-server # bash sh shell
    yaml-language-server # yaml
    lua-language-server # lua
    rust-analyzer # rust
    terraform-ls # terraform
    basedpyright # python
    lemminx # xml, svg
    helm-ls # helm
    harper # English
    vale-ls # English
    vale # English
    texlab # latex
    taplo # toml
    nil # nix

    # including lsp "clangd" and formatter "clang-format"
    # lsp: c, cpp, objc. formatter: c, cpp, objc, java, csharp
    clang-tools
  ];
}
