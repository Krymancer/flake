{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: let
  cfg = config.junho.desktop;
in {
  options.junho.desktop = {
    enable =
      lib.mkEnableOption "desktop"
      // {
        default = osConfig.desktop.enable or false;
      };
  };

  imports = [
    ./gnome
  ];

  config = lib.mkIf cfg.enable {
    home.packages = [
      (
        let
          inherit (pkgs) discord;
          flags = lib.concatStringsSep " " [
            "--enable-gpu-rasterization"
            "--enable-zero-copy"
            "--enable-gpu-compositing"
            "--enable-native-gpu-memory-buffers"
            "--enable-oop-rasterization"
            "--enable-features=UseSkiaRenderer,WaylandWindowDecorations"
          ];
        in
          if pkgs.stdenv.isLinux
          then
            discord.overrideAttrs (old: {
              desktopItem = old.desktopItem.override (old': {
                exec = "${old'.exec} ${flags}";
              });
            })
          else discord
      )

      pkgs.element-desktop
      pkgs.spotify
      (pkgs.prismlauncher.override {withWaylandGLFW = true;})
    ];
  };
}
