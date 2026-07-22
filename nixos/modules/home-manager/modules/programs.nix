{ config, ... }:
{

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
        hostname = "172.31.89.33";
        user = "ubuntu";
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
          pass = "3FjTZTRIrldWJJSv-2mSZCzkSYTMvUyoE7q_";
        };
        mounts."" = {
          enable = true;
          autoMount = true;
          mountPoint = "${config.home.homeDirectory}/WebDAV";
          options = {
            vfs-cache-mode = "full";
          };
        };

      };
    };
  };
}
