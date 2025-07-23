{ config, lib, pkgs, ... }: 
{
	programs = {
		swaylock = {
			enable = true;
			package = null;
			settings = {
				grace = 2;
				image = "${../files/wallpaper.png}";
				show-keyboard-layout = true;
				indicator-caps-lock = true;
				effect-blur = "50x10";
			};
		};
	    waybar = {
      		enable = true;
	      	settings = {
        		main = {
					modules-left = [ "sway/workspaces" ];
                	modules-center = [ "sway/window" ];
                	modules-right = [ "backlight" "pulseaudio" "memory" "battery" "tray" "clock" ];
					"sway/workspaces" = {
            			format = "[{name}]";
            			all-outputs = true;
          			};	
          			"sway/window" = {
	            		format = "[{title}]";
            			max-length = 50;
          			};
		          	backlight = {
            			display = "intel_backlight";
            			format = "[{percent}%]";
          			};
          			battery = { 
						weighted-average = false; 
					};
          			clock = {
            			interval = 1;
            			format = "[{:%F %T}]";
          			};
          			tray = { 
						show-passive-icons = true; 
					};
                    memory = {
                        interval = 15;
                        format = "[{used:0.1f}/{total:0.1f}GiB]";
                    };
                    pulseaudio = {
                        format = "[{volume}%]";
                    };
        		};
      		};
    	};
		ghostty.settings.background-opacity = 0.4;
	};
	wayland.windowManager.sway = {
		enable = true;
		config = {
			menu = "fuzzel";
			modifier = "Mod4"; # super
			terminal = "ghostty";
			output."*".bg =
        		"${../files/wallpaper.png} fill";
			input = {
				"type:keyboard" = { xkb_layout = "gb"; };	
			};
			bars = [];
			keybindings = lib.mkOptionDefault {
				"Mod4+l" = "exec ${pkgs.swaylock-effects}/bin/swaylock";
			};
			defaultWorkspace = "1";
		};
		extraConfig = ''
			blur enable
			blur_xray enable
			corner_radius 5
			default_dim_inactive 0.1

			exec waybar
			exec mako
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
      		background-color = "#285577ff";
      		text-color = "#ffffffff";
      		width = 300;
      		height = 100;
      		margin = 10;
      		padding = 5;
      		border-size = 1;
      		border-color = "#4c7899ff";
      		border-radius = 7;
      		progress-color = "over #5588aaff";
		    icons = true;
      		max-icon-size = 64;
			markup = true;
      		actions = true;
      		format = "<b>%s</b>\\n%b";
      		default-timeout = 6000;
      		icon-border-radius = 15;
    	};
  	};
}