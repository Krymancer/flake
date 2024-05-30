{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.junho.programs.neovim;
in {
  options.junho.programs.neovim = {
    enable = lib.mkEnableOption "Neovim configuration" // {default = config.junho.enable;};
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (let
        getchvim = inputs.getchvim.packages.${pkgs.system}.default;
      in
        # remove desktop file
        pkgs.symlinkJoin {
          name = "${getchvim.name}-nodesktop";
          paths = [getchvim];
          postBuild = ''
            rm -rf $out/share/{applications,icons}
          '';
        })
    ];
  };
}
