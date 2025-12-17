{
  pkgs,
  config,
  # neovim-nightly-overlay,
  ...
}:
let
  repoDir = builtins.getEnv "PWD";
  # Path to your nvim config directory.
  # NOTE: It should be a string on behalf of the full path. If a path is used
  # (e.g. `../nvim`), the files will be linked to nix store statically instead
  # of being linked to the source files dynamically (with write permission).
  nvimPath = "${repoDir}/home/nvim";
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
    ../fd # required by telescope.nvim
    ../marksman # markdown language server
    ../inotify # file watcher used by LSP
  ];

  home.packages = with pkgs; [
    # --- required by neovim plugins --- #
    lua5_1 # lazy.nvim
    luajitPackages.luarocks # lazy.nvim
    tree-sitter # nvim-treesitter
    yarn-berry # markdown-preview.nvim
    nodejs_22 # markdown-preview.nvim
    imagemagick # snacks.nvim
    ripgrep # telescope.nvim
    gnumake # avante.nvim
    zk # zk-nvim

    # --- formatters and linters --- #
    # Find all formatters here:
    # https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    python313Packages.cfn-lint # cloudformation
    nixfmt-rfc-style # nix formatter
    markdownlint-cli # markdown
    ansible-lint # ansible
    shellcheck # shell linter
    actionlint # github actions
    golangci-lint # go
    xmlstarlet # xml
    opentofu # terraform, opentofu
    rustywind # tailwind
    typstyle # typst
    htmlhint # html
    redocly # openapi
    rustfmt # rust
    tflint # terraform
    sqlfluff # sql
    stylua # lua
    kdlfmt # kdl
    shfmt # shell
    typos # spell checker
    biome # ts, js, css, json, graphql
    deno # ts, js, json, yaml, css, html
    ruff # python
    buf # protobuf
    zig # zig

    # --- language servers --- #
    # Find all language servers here:
    # https://github.com/neovim/nvim-lspconfig
    dockerfile-language-server # dockerfile
    graphql-language-service-cli # graphql
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
    tinymist # typst
    lemminx # xml, svg
    helm-ls # helm
    hyprls # hyprlang
    jinja-lsp # jinja
    vale # English
    texlab # latex
    taplo # toml
    gopls # go
    zls # zig
    nil # nix
    ty # python

    # Including lsp "clangd" and formatter "clang-format".
    # Lsp: c, cpp, objc. Formatter: c, cpp, objc, java, csharp.
    clang-tools
  ];
}
