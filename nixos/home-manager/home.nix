{
  homeUser,
  config,
  lib,
  pkgs,
  ...
}:
let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
in
{
  imports = [
    ./home-programs.nix
    ./home-packages.nix
    ./home-desktop.nix
    ./home-files.nix
    ./home-services.nix
  ];

  home.stateVersion = "24.11";
  home.username = homeUser;
  home.homeDirectory = (
    if isLinux then "/home/${config.home.username}" else "/Users/${config.home.username}"
  );

  home.shellAliases = {
    ls = "eza -l --icons -s name --group-directories-first";
    cat = "bat";
    lg = "lazygit";
    k = "kubectl";
  };
}
