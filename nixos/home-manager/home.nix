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

  home.username = homeUser;
  home.stateVersion = "24.11";
  home.homeDirectory = (
    if isLinux then "/home/${config.home.username}" else "/Users/${config.home.username}"
  );

  home.shellAliases = {
    ls = "eza -l --icons -s name --group-directories-first";
    cat = "bat";
    lg = "lazygit";
    k = "kubectl";
  };

  home.packages = with pkgs; [
    awscli2
    ssm-session-manager-plugin
    bat
    copilot-language-server
    github-copilot-cli
    dconf
    eza
    fd
    fzf
    gcc
    gh
    git
    jq
    k9s
    kubectl
    kubernetes-helm
    lazygit
    lua-language-server
    nerd-fonts.jetbrains-mono
    nixfmt
    stylua
    tmux
    tree-sitter
    unzip
    zip
    xmlstarlet
    (writeShellApplication {
      name = "launcher";
      runtimeInputs = [ ];
      text = builtins.readFile ../../scripts/linux/launcher.sh;
    })
  ];

  home.file = {
    ".config/qtile".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/qtile"
    );
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
    ".config/lf".source = config.lib.file.mkOutOfStoreSymlink (
      config.home.homeDirectory + "/.dotfiles/config/lf"
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

  programs.home-manager = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    autocd = true;
    completionInit = ''
      autoload -Uz compinit && compinit
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    '';
  };

  programs.readline = {
    enable = true;
    variables = {
      expand-tilde = true;
      completion-ignore-case = true;
      show-all-if-ambiguous = true;
    };
  };

  programs.zoxide = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
    config = {
      global = {
        warn_timeout = "5m";
      };
      whitelist = {
        prefix = [
          "~/projects"
          "~/Projects"
        ];
      };
    };
  };

  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
      "--follow"
      "--glob=!{.git,node_modules,vendor}"
      "--glob=!*.{lock}"
      "--glob=!{package-lock.json}"
      "--max-columns=10000"
      "--smart-case"
      "--sort=path"
    ];
  };

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };

  services.ssh-agent = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  services.dropbox = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    includes = [ "*.conf" ];
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        serverAliveInterval = 240;
        forwardAgent = true;
        addKeysToAgent = "yes";
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519.pub";
      };
      "corpo" = {
        hostname = "i-0bac6612747aab708";
        user = "ubuntu";
        identityFile = "~/.ssh/Corposistemas.pem";
        port = 22;
        proxyCommand = "aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters portNumber=%p --profile dev-corpo";
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    gtk4 = {
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };
  };
}
