{ pkgs, ... }:

let
  mkScript =
    {
      name,
      script,
      runtimeInputs ? [ ],
    }:
    pkgs.writeShellApplication {
      inherit name runtimeInputs;
      text = builtins.readFile script;
    };
in
{
  home.packages = with pkgs; [
    emacs
    pinentry-curses
    neovim
    git
    tmux
    lazygit
    copilot-language-server
    opencode
    gcc
    lua-language-server
    nerd-fonts.jetbrains-mono
    nixfmt
    stylua
    tree-sitter
    unzip
    zip
    xmlstarlet
    (mkScript {
      name = "launcher";
      script = ../../../scripts/linux/launcher.sh;
    })
  ];
}
