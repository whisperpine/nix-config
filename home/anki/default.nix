{ pkgs, ... }:
# --- spaced repetition flashcard --- #
{
  home.packages = with pkgs; [ anki ];

  # Force Anki to use Wayland.
  # https://docs.ankiweb.net/platform/linux/wayland.html
  home.sessionVariables.ANKI_WAYLAND = "1";
}
