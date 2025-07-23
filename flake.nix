{
    description = "the silly";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, nixos-wsl }: {
        nixosConfigurations = {
            desolo = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs self; };
                
                modules = [
                    ./desolo/system.nix
                    home-manager.nixosModules.home-manager
                    ./desolo/home-manager.nix
                ];
            };
            
            novus = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs self; };

                modules = [
                    nixos-wsl.nixosModules.default
                    ./novus/system.nix
                ];
            };
        };
    };
}