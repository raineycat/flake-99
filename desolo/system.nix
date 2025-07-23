{
  config,
  lib,
  pkgs,
  ...
}:
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

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
