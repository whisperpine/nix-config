{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "custom";
      scroll_buffer_size = 1500;
      show_startup_tips = false;
      ui = {
        pane_frames = {
          rounded_corners = false;
        };
      };
      themes.custom = {
        fg = "#bdbdbd"; # selection foreground
        bg = "#3f3f3f"; # selection background
        black = "#161616";
        red = "#161616";
        green = "#879c54";
        yellow = "#e6be6f";
        blue = "#81a2be";
        magenta = "#b18fbb";
        cyan = "#79af98";
        white = "#bdbdbd";
        orange = "#de935f";
      };
    };
  };
}
