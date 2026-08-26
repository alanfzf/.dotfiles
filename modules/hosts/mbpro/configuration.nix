{ self, inputs, ... }:
{
  flake.darwinConfigurations.macbook = inputs.nix-darwin.lib.darwinSystem {
    specialArgs = { inherit inputs; };

    modules = [
      self.darwinModules.base
      self.darwinModules.aerospace
      self.darwinModules.homebrew
      self.darwinModules.nix
      self.darwinModules.packages
      self.darwinModules.system
      self.darwinModules.users
      self.darwinModules.home-manager

      {
        preferences.user.name = "alan";
      }
    ];
  };
}
