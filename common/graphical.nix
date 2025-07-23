{ config, lib, pkgs, ... }: 
{
    environment.systemPackages = with pkgs; [
        firefox
        ghostty
        equibop
        kdePackages.dolphin
        vscode-fhs
        spotify
    ];

    hardware.graphics = {
        enable = true;
        extraPackages = [ pkgs.libGL ];
    };

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = true;
        pulse.enable = true;
    };
}