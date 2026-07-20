{
  imports = [
    ./gc.nix
    ./locale.nix
    ./packages.nix
    ./programs.nix
    ./users.nix
  ];

  system.stateVersion = "25.11";
}
