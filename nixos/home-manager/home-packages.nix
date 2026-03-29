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
    git
    tmux
    lazygit
    ssm-session-manager-plugin
    copilot-language-server
    github-copilot-cli
    gcc
    lua-language-server
    nerd-fonts.jetbrains-mono
    nixfmt
    stylua
    tree-sitter
    unzip
    zip
    xmlstarlet
    # kubectl
    # kubernetes-helm
    (mkScript {
      name = "launcher";
      script = ../../scripts/linux/launcher.sh;
    })
  ];
}
