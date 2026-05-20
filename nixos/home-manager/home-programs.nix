{ ... }:
{
  programs.home-manager = {
    enable = true;
  };

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

  programs.ssh = {
    enable = true;
    includes = [ "*.conf" ];
    enableDefaultConfig = false;
    settings = {
      "*" = {
        addKeysToAgent = "yes";
        forwardAgent = true;
        identityAgent = "SSH_AUTH_SOCK";
        serverAliveInterval = 240;
      };
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identitiesOnly = true;
        identityFile = "~/.ssh/id_ed25519_sk";
      };
      "corpo" = {
        hostname = "i-0bac6612747aab708";
        user = "ubuntu";
        port = 22;
        proxyCommand = "aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters portNumber=%p --profile dev-corpo";
        identityFile = "~/.ssh/corpo_ed25519";
      };
    };
  };

  programs.awscli = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.eza = {
    enable = true;
  };

  programs.fd = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.gh = {
    enable = true;
  };

  programs.jq = {
    enable = true;
  };

  programs.k9s = {
    enable = false;
  };

  programs.starship = {
    enable = true;
  };
}
