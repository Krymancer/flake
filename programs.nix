{pkgs, ...}:
{

  environment.systemPackages = with pkgs; [
    gcc
    pkgs.makeWrapper
    fzf
    ripgrep
    git
  ];
}

