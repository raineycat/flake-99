{ config, lib, pkgs, ... }:
{
	environment.systemPackages = [(
		pkgs.catppuccin-sddm.override {
			flavor = "mocha";
			background = "${../files/wallpaper.png}";
			loginBackground = true;
		}
	)];
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
		theme = "catppuccin-mocha";
		package = pkgs.kdePackages.sddm;
	};
}