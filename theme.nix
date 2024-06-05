{inputs, ...}:
{
  imports = [inputs.catppuccin.homeManagerModules.catppuccin];

  catppuccin = {
    accent = "mauve";
    flavor = "mocha";
    enable = true;
  };

  gtk = {
    enable = true;
    catppuccin.enable = true;
    catppuccin.gnomeShellTheme = true;
  };
}
