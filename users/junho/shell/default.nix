{
  config,
  lib,
  ...
}: let
  cfg = config.junho.shell;
in {
  options.junho.shell = {
    aliases.enable = lib.mkEnableOption "Shell aliases" // {default = config.junho.enable;};
    variables.enable = lib.mkEnableOption "Shell variables" // {default = config.junho.enable;};
  };

  imports = [
    ./fish.nix
  ];

  config = {
    home = lib.mkMerge [
      (lib.mkIf cfg.variables.enable {
        sessionVariables = rec {
          EDITOR = "nvim";
          VISUAL = EDITOR;
          CARGO_HOME = "${config.xdg.dataHome}/cargo";
          LESSHISTFILE = "${config.xdg.stateHome}/less/history";
        };
      })

      (lib.mkIf cfg.aliases.enable {
        shellAliases = {
          diff = "diff --color=auto";
          g = "git";
          gs = "g status";
        };
      })
    ];
  };
}
