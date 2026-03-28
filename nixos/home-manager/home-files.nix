{ config, ... }:
{
  home.file = {
    ".config/sway".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/sway"
    );
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/nvim"
    );
    ".config/git".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/git"
    );
    ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/tmux"
    );
    ".config/lazygit".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/lazygit"
    );
    ".config/bat".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/bat"
    );
    ".config/foot".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/foot"
    );
    ".config/mako".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/mako"
    );
    ".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/ideavim/ideavimrc"
    );
    ".config/swaylock".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/swaylock"
    );
    ".config/zathura".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/zathura"
    );
  };
}
