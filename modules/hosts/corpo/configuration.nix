{ self, inputs, ... }: {
  flake.nixosConfigurations.corpo = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.corpohardware-configuration
      self.nixosModules.base
      self.nixosModules.sway
      self.nixosModules.bluetooth
      self.nixosModules.bootloader
      self.nixosModules.docker
      self.nixosModules.env
      self.nixosModules.firefox
      self.nixosModules.gnome
      self.nixosModules.greetd
      self.nixosModules.locale
      self.nixosModules.network
      self.nixosModules.nix
      self.nixosModules.pipewire
      self.nixosModules.tailscale
      self.nixosModules.thunar
      self.nixosModules.users
      self.nixosModules.home-manager
    ];
  };
}
