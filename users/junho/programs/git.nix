{
  config,
  lib,
  ...
}: let
  cfg = config.junho.programs.git;
in {
  options.junho.programs.git = {
    enable = lib.mkEnableOption "Git configuration settings" // {default = config.junho.enable;};
    gh.enable = lib.mkEnableOption "GitHub CLI support" // {default = cfg.enable;};
  };

  config = lib.mkIf cfg.enable {
    programs = {
      gh = lib.mkIf cfg.gh.enable {
        enable = true;
        settings = {
          git_protocol = "https";
          editor = "nvim";
          prompt = "enabled";
          # workaround for https://github.com/nix-community/home-manager/issues/474
          version = 1;
        };

        gitCredentialHelper = {
          enable = true;
          hosts = ["https://github.com" "https://github.example.com"];
        };
      };

      git = {
        enable = true;

        difftastic = {
          enable = true;
          background = "dark";
          display = "inline";
        };

        extraConfig = {
          init = {defaultBranch = "main";};
        };

        signing = {
          key = "D31BD0D494BBEE86";
          signByDefault = true;
        };

        userEmail = "junior.nascm@gmail.com";
        userName = "Júnior Nascimento";
      };
    };
  };
}
