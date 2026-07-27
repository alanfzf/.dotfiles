{ inputs, self, ... }:
{
  flake.darwinModules.home-manager =
    { config, ... }:
    {
      imports = [
        inputs.home-manager.darwinModules.home-manager
      ];

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
}
