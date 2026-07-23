{ self, inputs, ... }:
{
  flake.nixosConfigurations.wpc = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.base
      self.nixosModules.docker
      self.nixosModules.locale
      self.nixosModules.nix
      self.nixosModules.users
      self.nixosModules.wsl
      self.nixosModules.home-manager
    ];
  };
}
