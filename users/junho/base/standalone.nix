{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.junho.standalone;
  enable = config.junho.enable && cfg.enable;
in {
  options.junho.standalone = {
    enable = lib.mkEnableOption "Standalone options";
  };

  config = lib.mkIf enable {
    _module.args.osConfig = {};
    programs.home-manager.enable = true;

    home = {
      username = "junho";
      homeDirectory = "/home/${config.home.username}";
    };
  };
}
