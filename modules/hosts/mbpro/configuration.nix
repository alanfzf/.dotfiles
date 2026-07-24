{ self, inputs, ... }:
{
  flake.darwinConfigurations.macbook = inputs.nix-darwin.lib.darwinSystem {
    modules = [ ];
    specialArgs = { };
  };
}
