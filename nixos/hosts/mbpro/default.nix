{
  inputs,
  importPkgs,
  nixpkgs,
}:
let
  system = "aarch64-darwin";
  pkgs = importPkgs system;
in
nix-darwin.lib.darwinSystem {
  inherit system pkgs;
  modules = [ ./configuration.nix ];
  specialArgs = {
    inherit inputs;
  };
}
