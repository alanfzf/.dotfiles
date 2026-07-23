{ inputs, ... }: {
  flake.nixosModules.nix = { ... }: {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];

    nix.gc = {
      automatic = true;
      dates = "09:30";
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
