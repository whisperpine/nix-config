{ ... }:
{
  programs.mpv.enable = true;

  xdg.mimeApps.associations.added = {
    # Video types.
    "video/mp4" = "mpv.desktop";
    "video/webm" = "mpv.desktop";
    "video/x-matroska" = "mpv.desktop"; # .mkv
    "video/quicktime" = "mpv.desktop"; # .mov
    "video/x-flv" = "mpv.desktop"; # .flv
    "video/mpeg" = "mpv.desktop";
    "video/avi" = "mpv.desktop";
    "video/3gpp" = "mpv.desktop";

    # Audio types.
    "audio/mp3" = "mpv.desktop";
    "audio/ogg" = "mpv.desktop";
    "audio/flac" = "mpv.desktop";
    "audio/wav" = "mpv.desktop";
    "audio/m4a" = "mpv.desktop";
    "audio/aac" = "mpv.desktop";
    "audio/x-matroska" = "mpv.desktop"; # .mka

    # Playlist and Subtitle files.
    "application/vnd.apple.mpegurl" = "mpv.desktop"; # .m3u8, HLS
    "audio/x-scpls" = "mpv.desktop"; # .pls
  };
}
