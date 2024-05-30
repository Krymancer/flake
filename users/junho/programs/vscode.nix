{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.junho.programs.vscode;
in {
  options.junho.programs.vscode = {
    enable =
      lib.mkEnableOption "VSCode configuration"
      // {
        default = config.junho.desktop.enable;
      };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };
}
