{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix = {
    gc = {
      automatic = true;
      dates = "09:30";
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
}
