{
  config,
  lib,
  ...
}: let
  cfg = config.desktop;
in {
  options.desktop = {
    enable = lib.mkEnableOption "desktop settings";
  };

  imports = [
    ./audio.nix
    ./fonts.nix
    ./programs.nix
    ./gnome
  ];

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
  };
}
