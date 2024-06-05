{
  description = "Krymancer's Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        inputs.catppuccin.nixosModules.catppuccin
        inputs.home-manager.nixosModules.default

        ./configuration.nix
	./hardware-configuration.nix

	./bootloader.nix
 	./display-manager.nix
 	./environment-variables.nix
	./fonts.nix
 	./gc.nix
	./gnome.nix
	./hyprland.nix
	./internationalisation.nix
	./kernel.nix
	./networking.nix
	./nix-settings.nix
	./programs.nix
	./sound.nix
	./time.nix
    	./users.nix
      ];
    };
  };
}
