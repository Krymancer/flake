{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.junho.programs.firefox;
in {
  options.junho.programs.firefox = {
    enable =
      lib.mkEnableOption "Firefox configuration"
      // {
        default = config.junho.desktop.enable;
      };
  };

  imports = [
    ./arkenfox.nix
  ];

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };

    programs.firefox = {
      enable = true;
      profiles.arkenfox = {
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          floccus
          ublock-origin
        ];

        isDefault = true;

        settings = {
          # disable firefox accounts & pocket
          "extensions.pocket.enabled" = false;
          "identity.fxaccounts.enabled" = false;

          # hw accel
          "media.ffmpeg.vaapi.enabled" = true;

          # widevine drm
          "media.gmp-widevinecdm.enabled" = true;
        };
      };
    };
  };
}
