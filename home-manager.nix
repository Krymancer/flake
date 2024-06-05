{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  home.username = "junho";
  home.homeDirectory = "/home/junho";
  home.stateVersion = "24.05"; 

  home.packages = [
   
  ];

  home.file = {
  
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;


  programs.neovim.enable = true;
  programs.firefox.enable = true;
  programs.kitty.enable = true;
}
