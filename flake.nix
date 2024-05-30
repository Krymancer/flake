{
  description = "krymancer's flake for system configurations";

  outputs = inputs:
  inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        ./lib
        ./modules
        ./systems
        ./users

	# dev outputs
        ./hydraJobs.nix
      ];

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };
    };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";
    
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "";
        systems.follows = "lanzaboote/flake-utils/systems";
      };
    };

    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
        pre-commit.follows = "";
        flake-utils.follows = "lanzaboote/flake-utils";
      };
    };

    catppuccin.url = "github:catppuccin/nix";

    firefox-addons = {
      url = "sourcehut:~rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "lanzaboote/flake-utils";
      };
    };

    flake-checks.url = "github:getchoo/flake-checks";

    getchvim = {
      url = "github:getchoo/getchvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    krunner-nix = {
      url = "github:pluiedev/krunner-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
        flake-parts.follows = "flake-parts";
        pre-commit-hooks-nix.follows = "";
      };
    };

    nixinate = {
      url = "github:MatthewCroughan/nixinate";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
        flake-utils.follows = "lanzaboote/flake-utils";
      };
    };
  };
}
