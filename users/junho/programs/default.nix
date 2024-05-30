{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.junho.programs;
in {
  options.junho.programs = {
    basePrograms.enable =
      lib.mkEnableOption "base programs and configurations"
      // {
        default = config.junho.enable;
      };
  };

  imports = with inputs; [
    catppuccin.homeManagerModules.catppuccin
    nix-index-database.hmModules.nix-index

    ./firefox
    ./git.nix
    ./gpg.nix
    ./neovim.nix
    ./vim.nix
    ./vscode.nix
  ];

  config = lib.mkIf cfg.basePrograms.enable {
    home.packages = with pkgs; [
      fd
      nix-output-monitor
      nurl
      rclone
      restic
    ];

    catppuccin = {
      enable = true;
      flavor = "mocha";
    };

    programs = {
      bat.enable = true;
      btop.enable = true;

      eza = {
        enable = true;
        icons = true;
      };

      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      ripgrep.enable = true;

      nix-index-database.comma.enable = true;
    };

    xdg.enable = true;
  };
}
