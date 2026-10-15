{ inputs, self, ... }:
let
  mkHomeManager = hmModule: { config, ... }: {
    imports = [ hmModule ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
      backupFileExtension = ".bckp";

      users.${config.preferences.user.name}.imports = [
        self.homeModules.default
      ];
    };
  };
in
{
  flake.nixosModules.home-manager = mkHomeManager inputs.home-manager.nixosModules.home-manager;
  flake.darwinModules.home-manager = mkHomeManager inputs.home-manager.darwinModules.home-manager;
}
