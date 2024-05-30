{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.desktop.defaultPrograms;
  enable = config.desktop.enable && cfg.enable;
in {
  options.desktop.defaultPrograms = {
    enable = lib.mkEnableOption "default desktop programs" // {default = true;};
  };

  config = lib.mkIf enable {
    environment = {
      noXlibs = lib.mkForce false;
      systemPackages = with pkgs; [wl-clipboard xclip];
    };

    programs = {
      firefox.enable = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };
}
