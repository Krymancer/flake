{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.traits.users.junho;
in {
  options.traits.users.junho = {
    enable = lib.mkEnableOption "Junho's user & home configurations";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      users.users.junho.shell = pkgs.fish;

      programs.fish.enable = true;

      home-manager.users.junho = {
        imports = [../../../../users/junho];
        junho = {
          enable = true;
          shell.fish.enable = true;
        };
      };
    })

    (lib.mkIf (cfg.enable && pkgs.stdenv.isDarwin) {
      users.users.junho = {
        home = lib.mkDefault "/Users/junho";
      };
    })

    (lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
      users.users.junho = {
        extraGroups = ["wheel"];
        isNormalUser = true;
      };
    })
    
  ];
}
