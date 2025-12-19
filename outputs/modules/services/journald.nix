{ ... }:
# ---------- journald configs ---------- #
{
  # For a comprehensive manual, please refer to:
  # https://manpages.debian.org/testing/systemd/journald.conf.5.en.html

  # This config modifies "/etc/systemd/journald.conf".
  services.journald.extraConfig = ''

    # --- services.journald.extraConfig --- #

    # Limits the total log size.
    SystemMaxUse=1G

    # How large an individual log file can get before
    # it's "rotated" and becomes eligible for cleanup.
    SystemMaxFileSize=50M

    # Automatically deletes logs older than 30 days,
    # even if you haven't hit the "SystemMaxUse" limit.
    MaxRetentionSec=1month

    # --- services.journald.extraConfig --- #
  '';
}
