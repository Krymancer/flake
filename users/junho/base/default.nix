{
  config,
  lib,
  ...
}: let
  cfg = config.junho;
in {
  options.junho = {
    enable = lib.mkEnableOption "Junhos's home configuration";
  };

  imports = [
    ./standalone.nix
  ];

  config = lib.mkIf cfg.enable {
    home.stateVersion = "23.11";
  };
}
