{ pkgs, ... }:
# ---------- google-chrome ---------- #
let
  # Note: This solution is meant to work around the bug of nvidia driver, with logs like:
  # `NVRM: dmaAllocMapping_GM107: can't alloc VA space for mapping`.
  # It happens occasionally when playing videos in Chrome, freezing the webpage.
  google-chrome-wrapped = pkgs.symlinkJoin {
    name = "google-chrome";
    paths = [ pkgs.google-chrome ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/google-chrome-stable \
        --add-flags "--disable-accelerated-video-decode" \
        --add-flags "--disable-gpu-memory-buffer-video-frames"
      sed -i "s|^Exec=.*google-chrome-stable|Exec=$out/bin/google-chrome-stable|" \
        $out/share/applications/google-chrome.desktop
    '';
  };
in
{
  environment.systemPackages = (
    pkgs.lib.optionals (pkgs.stdenv.hostPlatform.system == "x86_64-linux") [
      # "google-chrome" is unfree.
      google-chrome-wrapped
    ]
  );
}
