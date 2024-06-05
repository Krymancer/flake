{inputs, pkgs, ...}:
{
  users.users.junho = {
    isNormalUser = true;
    description = "junho";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
        git
    ];
  };

  home-manager = {
      extraSpecialArgs = {inherit inputs;};
      users = {
      	"junho" = import ./home-manager.nix;
      };
  };
}
