{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Yusong";
    userEmail = "yusong.lai@icloud.com";
    aliases = {
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      pushff = "push --force-with-lease --force-if-includes";
      sc = "sparse-checkout";
      sm = "submodule";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
      core = {
        longpaths = true;
        autocrlf = false;
        quotepath = false;
        fsmonitor = false;
        symlinks = true;
      };
      rerere = {
        enable = true;
      };
      fetch = {
        writeCommitGraph = true;
      };
      submodule = {
        recurse = true;
      };
      lfs = {
        locksverify = false;
      };
    };
  };
}
