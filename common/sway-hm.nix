{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    swaylock = {
      enable = true;
      package = null;
      settings = {
        screenshots = true;
        clock = true;
        indicator = true;
        indicator-radius = 200;
        indicator-thickness = 7;
        effect-blur = "10x5";
        effect-vignette = "0.5:0.5";
        effect-greyscale = true;
        ring-color = "bb00cc";
        key-hl-color = "880033";
        line-color = "00000000";
        inside-color = "00000088";
        separator-color = "00000000";
        fade-in = 0.25;

        grace = 3;
        # image = "${../files/wallpaper.png}";
        # show-keyboard-layout = true;
        indicator-caps-lock = true;
        submit-on-touch = true; # i don't have a touchscreen but why not
        timestr = " < %H:%M > "; # ' < 07:22 > '
        datestr = "%A"; # 'Sunday'
      };
    };
    waybar = import ./waybar.nix;
    ghostty.settings.background-opacity = 0.4;
  };
  wayland.windowManager.sway = {
    enable = true;
    config = {
      menu = "fuzzel";
      modifier = "Mod4"; # super
      terminal = "ghostty";
      output."*".bg = "${../files/wallpaper.png} fill";
      input = {
        "type:keyboard" = {
          xkb_layout = "gb";
        };
      };
      bars = [ ];
      keybindings = lib.mkOptionDefault {
        "Mod4+l" = "exec ${pkgs.swaylock-effects}/bin/swaylock";
        "Print" = "exec flameshot gui -c";
      };
      defaultWorkspace = "1";
    };
    extraConfig = ''
      blur enable
      blur_xray enable
      corner_radius 5
      default_dim_inactive 0.1

      exec mako
      exec flameshot
      		'';
    package = null;
  };
  services.mako = {
    enable = true;
    settings = {
      max-visible = 5;
      max-history = 5;
      sort = "-time";
      layer = "overlay";
      anchor = "top-right";
      font = "monospace 10";
      background-color = "#161616ff";
      text-color = "#ffffffff";
      width = 300;
      height = 100;
      margin = 10;
      padding = 5;
      border-size = 1;
      border-color = "#383838ff";
      border-radius = 7;
      progress-color = "over #5588aaff";
      icons = true;
      max-icon-size = 64;
      markup = true;
      actions = true;
      format = "<b>%s</b>\\n%b";
      default-timeout = 6000;
      icon-border-radius = 15;

      "summary=Flameshot\\ Warning" = {
        invisible = 1;
      };
    };
  };
}
