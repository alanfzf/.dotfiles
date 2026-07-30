{
  flake.darwinModules.nix = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [
      # inputs.neovim-nightly-overlay.overlays.default
    ];
    nixpkgs.hostPlatform = "aarch64-darwin";

    nix = {
      gc = {
        automatic = true;
        interval = {
          Hour = 9;
          Minute = 30;
        };
        options = "--delete-older-than 7d";
      };
      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
