{ self, ... }:
{
  flake.homeModules.default =
    {
      pkgs,
      lib,
      config,
      osConfig,
      ...
    }:
    let
      user = osConfig.preferences.user.name;
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
        "config/starship.toml"
        "config/emacs"
        "config/opencode"
        "config/alacritty"
      ];
    in
    {

      home = {
        username = user;
        homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/${user}" else "/home/${user}";
        stateVersion = "25.11";
      };

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

      # here is symlinks
      home.file = lib.listToAttrs (
        map (path: {
          name = ".${path}";
          value.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/${path}";
        }) dotfiles
      );

      # home packages
      home.packages = with pkgs; [
        copilot-language-server
        gcc
        git
        lazygit
        lua-language-server
        mariadb.client
        mpls
        neovim
        nerd-fonts.jetbrains-mono
        nixfmt
        opencode
        pinentry-tty
        stylua
        tmux
        tree-sitter
        unzip
        xmlstarlet
        zip
      ];

      # home-programs
      programs.bash = {
        enable = true;
        enableCompletion = true;
      };

      programs.readline = {
        enable = true;
        variables = {
          expand-tilde = true;
          completion-ignore-case = true;
          show-all-if-ambiguous = true;
        };
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

      programs.ssh = {
        enable = true;
        includes = [ "*.conf" ];
        enableDefaultConfig = false;
        settings = {
          "*" = {
            addKeysToAgent = "no";
            forwardAgent = true;
            identityAgent = "SSH_AUTH_SOCK";
            serverAliveInterval = 240;
          };
          "git" = {
            hostname = "github.com";
            user = "git";
          };
          "corpo" = {
            hostname = "172.31.40.160";
            user = "admin";
            identityFile = "~/.ssh/id_ed25519";
          };
          "corpo-db" = {
            hostname = "172.31.92.86";
            user = "admin";
            identityFile = "~/.ssh/id_ed25519";
          };
        };
      };

      programs.home-manager.enable = true;
      programs.awscli.enable = true;
      programs.bat.enable = true;
      programs.eza.enable = true;
      programs.fd.enable = true;
      programs.fzf.enable = true;
      programs.gh.enable = true;
      programs.jq.enable = true;
      programs.password-store.enable = true;
      programs.starship.enable = true;
      programs.zoxide.enable = true;
      programs.delta.enable = true;
      programs.emacs.enable = false;
      programs.rclone = {
        enable = true;
        remotes = {
          webdav = {
            config = {
              type = "webdav";
              url = "https://my-webdav.fly.dev";
              vendor = "other";
              user = "admin";
            };
            secrets.pass = "${config.home.homeDirectory}/.config/secrets/webdav-pass";
            mounts = {
              "" = {
                enable = true;
                autoMount = true;
                mountPoint = "${config.home.homeDirectory}/WebDAV";
                options = {
                  # vfs-cache-mode = "off";
                  vfs-cache-mode = "full";
                  vfs-write-back = "5s";
                  dir-cache-time = "5m";
                };
              };
            };

          };
        };
      };

      # gpg
      programs.gpg.enable = true;
      services.gpg-agent = {
        enable = true;
        pinentry.package = pkgs.pinentry-tty;
        enableSshSupport = true;
      };
    };
}
