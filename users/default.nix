{
  self,
  withSystem,
  ...
}: {
  flake.homeConfigurations = let
    inherit (self.lib) homeManagerConfiguration;
    pkgsFor = system: withSystem system ({pkgs, ...}: pkgs);
  in {
    junho = homeManagerConfiguration {
      junho = pkgsFor "x86_64-linux";
      modules = [./junho/home.nix];
    };
  };
}
