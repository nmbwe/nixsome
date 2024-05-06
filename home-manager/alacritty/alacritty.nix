{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      # Font settings
      font.size = 10;
      font.normal.family = "Monospace";
      font.bold.family = "Monospace";
      font.italic.family = "Monospace";

      # Colors
      colors = {
        primary = {
          background = "#282828";
          foreground = "#dddddd";
        };
        cursor = {
          text = "#aaaaaa";
          cursor = "#ffffff";
        };
        normal = {
          black = "#444444";
          red = "#ff0000";
          green = "#00ff00";
          yellow = "#ffff00";
          blue = "#0000ff";
          purple = "#ff00ff";
          cyan = "#00ffff";
          white = "#ffffff";
        };
        bright = {
          black = "#666666";
          red = "#ff6666";
          green = "#33ff33";
          yellow = "#ffff66";
          blue = "#6666ff";
          purple = "#ff66ff";
          cyan = "#66ffff";
          white = "#ffffff";
        };
      };

      # Window settings
      window.dimensions = {
        columns = 100;
        lines = 30;
      };

      # Scrollback settings
      scrollback.lines = 10000;

      # Other settings
      live_config_reload = true;
      dynamic_title = true;
    };
  };
}