let
  nixModule = { inputs, ... }: {
    # nixpkgs
    nixpkgs = {
      config.allowUnfree = true;
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
      ];
    };

    # nix garbage collector
    nix.gc = {
      automatic = true;
      interval = {
        Hour = 9;
        Minute = 30;
      };
      options = "--delete-older-than 7d";
    };

    # nix settings
    nix.settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
in
{
  flake.darwinModules.nix = nixModule;
  flake.nixosModules.nix = nixModule;
}
