{
  myUser,
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
    ./gtk.nix
    ./packages.nix
    ./programs.nix
    ./ssh.nix
    ./gpg.nix
    ./symlinks.nix
  ];

  home.stateVersion = "25.11";
  home.username = myUser;
  home.homeDirectory = (if isLinux then "/home/${myUser}" else "/Users/${myUser}");
  home.shellAliases = {
    vi = "$(which nvim)";
    ls = "eza -l --icons -s name --group-directories-first";
    cat = "bat";
    lg = "lazygit";
    k = "kubectl";
  };
  home.sessionVariables = {
    EDITOR = "$(which nvim)";
    VISUAL = "$(which nvim)";
  };
}
