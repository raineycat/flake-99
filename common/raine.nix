{ config, lib, pkgs, ... }: {
    home.stateVersion = "25.05"; # also no touchy

    home.username = "raine";
    home.homeDirectory = "/home/raine";

    programs = {
        home-manager.enable = true;
        ssh = {
            enable = false; # keep this unless you do the patching thing
        };
        helix = {
            enable = true;
            defaultEditor = true;
            settings = {
                theme = "catppuccin_mocha";
            };
        };
        git = {
            enable = true;
            userName = "raineycat";
            userEmail = "raineybc9@gmail.com";
        };
        nushell = {
            enable = true;
            configFile.source = ../files/config.nu;
        };
        ghostty = {
            enable = true;
            settings.theme = "catppuccin-mocha";
        };
        btop = import ./btop.nix;
        starship = {
            enable = true;
            settings = {
                character = {
                    success_symbol = "[▶](bold green)";
                    error_symbol = "[▶](bold red)";
                };
                cmd_duration = {
                    disabled = true;
                };
                directory = {
                    home_symbol = "▲ ";
                    use_os_path_sep = false;
                    truncation_symbol = "▼ /";
                    truncation_length = 3;
                };
                dotnet = {
                    symbol = ".NET ";
                    detect_extensions = ["csproj" "fsproj" "xproj" "sln"];  
                };
            };
        };
    };
    home.file = {
        ".ssh/authorized_keys".source = ../files/id_ed25519.pub;
        ".config/nushell/autoload/mommy.nu".source = ../files/nu/mommy.nu;
        ".config/nushell/autoload/completion.nu".source = ../files/nu/completion.nu;
    };
}