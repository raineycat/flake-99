{
  enable = true;
  systemd.enable = true;
  settings = {
    # interval = 5;
    main = {
      modules-left = [
        # "sway/workspaces"
        "mpris"
      ];
      modules-center = [
        # "sway/window"
        # "mpris"
        "sway/workspaces"
      ];
      modules-right = [
        "tray"
        "backlight"
        "pulseaudio"
        "memory"
        "battery"
        "clock"
      ];
      "sway/workspaces" = {
        format = "[{name}]";
        all-outputs = true;
      };
      "sway/window" = {
        format = "[{title}]";
        max-length = 50;
      };
      mpris = {
        format = "{player_icon} {dynamic}";
        format-paused = "{status_icon} <i>{dynamic}</i>";
        player-icons = {
          default = "▶";
          spotify = "🎵";
        };
        status-icons = {
          paused = "⏸";
        };
        dynamic-separator = " / ";
        dynamic-order = [
          "title"
          "artist"
          "position"
          "length"
        ];
      };
      backlight = {
        display = "intel_backlight";
        format = "[🔆{percent}%]";
        tooltip = true;
        tooltip-format = "{percent}% brightness";
      };
      battery = {
        weighted-average = false;
        format = "[🔋{capacity}%]";
      };
      clock = {
        interval = 1;
        format = "[⏰{:%T}]"; # {:%T / %a %d %b %Y}
        tooltip = true;
        tooltip-format = "⏰ {:%T / %a %d %b %Y}";
      };
      tray = {
        show-passive-icons = true;
        spacing = 5;
      };
      memory = {
        interval = 15;
        format = "[🐏{used:0.1f}GiB]";
        tooltip = true;
        tooltip-format = "{used:0.1f}GiB / {total:0.1f}GiB RAM used";
      };
      pulseaudio = {
        format = "[🔈{volume}%]";
      };
    };
  };
  style = ''
    * {
      border: none;
      border-radius: 0;
      font-family: monospace;
    }
    window#waybar {
      background: #16191c;
      color: #aab2bf;
    }
    #workspaces button {
      padding: 0 5px;
      color: #ffffff;
    }
    #backlight, #pulseaudio, #memory, #battery, #clock {
      margin: 0 5px;
    }
    #tray {
      margin: 0 5px;
      padding: 0 10px;
      background: #1e0b36;
    }
  '';
}
