{ lib, config, ... }:
let
  dotfiles = [
    "config/sway"
    "config/nvim"
    "config/git"
    "config/tmux"
    "config/lazygit"
    "config/bat"
    "config/foot"
    "config/mako"
    "config/swaylock"
    "config/zathura"
    "config/ideavim/ideavimrc"
  ];
in
{
  home.file = lib.listToAttrs (
    map (path: {
      name = ".${path}";
      value.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/${path}";
    }) dotfiles
  );
}
