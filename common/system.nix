{ config, lib, pkgs, ... }:
{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    boot.loader.systemd-boot.enable = lib.mkDefault true;
    boot.loader.efi.canTouchEfiVariables = true;

    nixpkgs.config.allowUnfree = true;

    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_GB.UTF-8";

    nix.settings.trusted-users = ["raine" "root"];

    networking.networkmanager.enable = true;
    networking.nameservers = lib.mkDefault [ "1.1.1.1" "1.0.0.1" ];

    environment.sessionVariables = {
        "EDITOR" = "hx";
        "VISUAL" = "hx";
    };

    environment.systemPackages = with pkgs; [
        helix
        nushell
        starship
        wget
        btop
        ripgrep
        ripgrep-all
        carapace
        python3
        fastfetch
        kitty.terminfo
        ghostty.terminfo
        parted
        pciutils
        usbutils
        dig
        psmisc
        feh
        hyfetch
        p7zip-rar
        nixfmt-rfc-style
    ];

    users.defaultUserShell = pkgs.nushell;
    users.users.root.shell = pkgs.nushell;
    users.users.raine = {
        description = ""; # basically display name if you want to set this
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.nushell;
    };

    programs = {
        git = {
            enable = true;
            config = {
                init.defaultBranch = "mistress";
            };
        };
    };
    
    services = {
        openssh.enable = true;
    };

    security.sudo.enable = false;
    security.sudo-rs = {
        enable = true;
        wheelNeedsPassword = false;
    };

    networking.firewall.enable = lib.mkDefault false;

    system.stateVersion = "25.05"; # no touchy. bad.
}