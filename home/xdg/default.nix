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
    # Prevent two "Google Chrome" listed by fuzzel.
    "com.google.Chrome" = {
      name = "Google Chrome";
      noDisplay = true;
    };
  };
}
