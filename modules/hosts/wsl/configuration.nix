{ self, inputs, ... }:
{
  flake.nixosConfigurations.wpc = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.nixos-wsl.nixosModules.default
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
