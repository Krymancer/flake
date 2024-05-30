{pkgs, ...}: {
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
  ];

  archetypes.personal.enable = true;

  desktop = {
    enable = true;
  };

  environment.systemPackages = [pkgs.obs-studio];

  networking.hostName = "ciri";

  security.tpm2 = {
    enable = true;
    abrmd.enable = true;
  };

  services = {
    flatpak.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
  };

  system.stateVersion = "23.11";

  traits = {
    nvidia = {
      enable = true;
      nvk.enable = true;
    };
  };
}
