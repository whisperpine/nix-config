{ ... }:
{
  xdg.mimeApps.enable = true;

  # This option creates/manages files in both:
  # "~/.config/mimeapps.list" and "~/.local/share/applications/mimeapps.list".
  xdg.mimeApps.defaultApplications = {
    # google-chrome
    "text/html" = "google-chrome.desktop";
    "x-scheme-handler/http" = "google-chrome.desktop";
    "x-scheme-handler/https" = "google-chrome.desktop";
    "x-scheme-handler/about" = "google-chrome.desktop";
    "x-scheme-handler/mailto" = "google-chrome.desktop";
  };

  # This modifies files under:
  # /etc/profiles/per-user/yusong/share/applications
  xdg.desktopEntries = {
    xterm = {
      name = "XTerm";
      noDisplay = true;
    };
    nvim = {
      name = "Neovim";
      noDisplay = true;
    };
    btop = {
      name = "btop";
      noDisplay = true;
    };
    yazi = {
      name = "yazi";
      noDisplay = true;
    };
    Helix = {
      name = "Helix";
      noDisplay = true;
    };
    kbd-layout-viewer5 = {
      name = "Keyboard Layout Viewer";
      icon = "fcitx";
    };
  };
}
