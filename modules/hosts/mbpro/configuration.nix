{ self, inputs, ... }:
{
  flake.darwinConfigurations.macbook = inputs.nix-darwin.lib.darwinSystem {
    specialArgs = { inherit inputs; };
    modules = [
      self.darwinModules.base
      self.darwinModules.aerospace
      self.darwinModules.homebrew
      self.darwinModules.nix
      self.darwinModules.env
      self.darwinModules.system
      self.darwinModules.users
      self.darwinModules.home-manager
      self.darwinModules.tailscale
      self.darwinModules.firefox
      self.darwinModules.docker
      self.darwinModules.android-studio
      self.darwinModules.mbpro-hardware
    ];
  };
}
