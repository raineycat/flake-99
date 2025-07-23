{
    imports = [
        ../common/home-manager.nix
    ];

    home-manager.users.raine = import ./raine.nix;
}