{
  inputs,
  importPkgs,
  nixpkgs,
}:
let
  system = "x86_64-linux";
  pkgs = importPkgs system;
in
nixpkgs.lib.nixosSystem {
  inherit system pkgs;
  modules = [ ./default.nix ];
  specialArgs = {
    inherit inputs;
  };
}
