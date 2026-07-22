{
  flake.nixosModules.nix = { ... }: {
    # system.stateVersion = "25.11";
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
