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
  xdg.desktopEntries.xterm = {
    name = "XTerm"; # name is required to build
    noDisplay = true; # hide in app launchers (e.g. fuzzel)
  };
}
