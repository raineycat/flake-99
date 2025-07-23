{ config, lib, pkgs, ... }:
{
    imports = [ ./graphical.nix ];

    programs.sway = {
        enable = true;
        package = pkgs.swayfx;
        extraPackages = with pkgs; [
            swaybg
            swaylock-effects
            grim
            xdg-desktop-portal-wlr
            xdg-desktop-portal-gtk
            brightnessctl
            fuzzel
            nwg-look
        ];
    };

    environment.sessionVariables.MOZ_ENABLE_WAYLAND = 0;
}