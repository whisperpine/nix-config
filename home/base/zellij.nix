{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "custom";
      scroll_buffer_size = 1500;
      ui = {
        pane_frames = {
          rounded_corners = false;
        };
      };
      themes.custom = {
        fg = "#aaaaaa";
        bg = "#202020";
        black = "#161616";
        red = "#161616";
        green = "#879c54";
        yellow = "#f3cd03";
        blue = "#4c90a8";
        magenta = "#aa739a";
        cyan = "#79af98";
        white = "#bdbdbd";
        orange = "#cc8b00";
      };
    };
  };
}
