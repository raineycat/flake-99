{ config, lib, pkgs, ... }:
{
    imports = [
        ../common/system.nix
    ]; 
    
    networking.hostName = "novus";

    boot.loader.systemd-boot.enable = lib.mkForce false;

    wsl.enable = true;
    wsl.defaultUser = "raine";
    wsl.useWindowsDriver = true; # Use OpenGL driver from Windows
    wsl.wslConf.user.default = "raine";

    # this allows you to access your wsl distro over ssh even if you have sshd running on windows
    services.openssh.ports = [ 2222 ]; 
}