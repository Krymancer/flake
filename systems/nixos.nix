{self, ...}: {
  flake = {
    nixosConfigurations = let
      inherit (self.lib) nixosSystem nixosSystemStable;
    in {
      ciri = nixosSystem {
        modules = [./ciri];
      };
    };
  };
}
