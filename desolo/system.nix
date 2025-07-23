{ config, lib, pkgs, ... }:
{
    imports = [
        ../common/system.nix
        ./hardware.nix
        ../common/bluetooth.nix
        ../common/sway.nix
        ../common/sddm.nix
    ]; 
    
    services.displayManager.defaultSession = "sway";

    networking.hostName = "desolo";
}