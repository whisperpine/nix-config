{
  pkgs,
  config,
  # neovim-nightly-overlay,
  ...
}:
let
  # Path to your nvim config directory.
  # NOTE: It should be a string on behalf of the full path. If a path is used
  # (e.g. `../nvim`), the files will be linked to nix store statically instead
  # of being linked to the source files dynamically (with write permission).
  # NOTE: "/etc/nixos" should be a symbolic link of this repo.
  nvimPath = "/etc/nixos/home/nvim";
in
{
  programs.neovim = {
    enable = true;
    # package = neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink nvimPath;
  };

  imports = [
    ../fd # telescope.nvim
    ../marksman # markdown language server
    ../inotify # file watcher used by LSP
  ];

  home.packages = with pkgs; [
    # required by neovim plugins
    lua5_1 # lazy.nvim
    luajitPackages.luarocks # lazy.nvim
    tree-sitter # tree-sitter.nvim
    yarn-berry # markdown-preview.nvim
    nodejs_22 # markdown-preview.nvim
    ripgrep # telescope.nvim
    gnumake # avante.nvim
    zig # tree-sitter.nvim
    zk # zk-nvim

    # formatters and linters
    # find all formatters here:
    # https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    nixfmt-rfc-style # nix formatter
    markdownlint-cli # markdown
    shellcheck # shell linter
    actionlint # github actions
    xmlstarlet # xml
    opentofu # terraform, opentofu
    rustywind # tailwind
    typstyle # typst
    htmlhint # html
    rustfmt # rust
    tflint # terraform
    sqruff # sql
    sqlfluff # sql
    stylua # lua
    shfmt # shell
    typos # spell checker
    biome # ts, js, css, json, graphql
    deno # ts, js, json, css
    ruff # python
    buf # protobuf

    # language servers
    # find all language servers here:
    # https://github.com/neovim/nvim-lspconfig
    dockerfile-language-server-nodejs # dockerfile
    vscode-langservers-extracted # json, css, html
    typescript-language-server # typescript, javascript
    tailwindcss-language-server # tailwind css
    svelte-language-server # svelte
    bash-language-server # bash sh shell
    yaml-language-server # yaml
    lua-language-server # lua
    wgsl-analyzer # wgsl
    rust-analyzer # rust
    terraform-ls # terraform
    basedpyright # python
    tinymist # typst
    lemminx # xml, svg
    helm-ls # helm
    harper # English
    vale-ls # English
    vale # English
    texlab # latex
    taplo # toml
    zls # zig
    nil # nix

    # including lsp "clangd" and formatter "clang-format"
    # lsp: c, cpp, objc. formatter: c, cpp, objc, java, csharp
    clang-tools
  ];
}
