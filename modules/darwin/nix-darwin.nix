{ inputs, ... }: {
  flake.darwinModules.nix = {
    nixpkgs.hostPlatform = "aarch64-darwin";
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];

    nix.gc = {
      automatic = true;
      interval = {
        Hour = 9;
        Minute = 30;
      };
      options = "--delete-older-than 7d";
    };

    nix.settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
