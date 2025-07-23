{ config, lib, pkgs, ... }:
{
    imports = [
        ../common/raine.nix
        ../common/sway-hm.nix
    ];

    # home.file."path/relative/to/home/root".source = ../files/file;
}