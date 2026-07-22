{
  flake.nixosModules.home-manager =
    { ... }:
    let
      user = config.preferences.user.name;
      isWSL = config.wsl.enable or false;
    in
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = ".bckp";
        users.${user} = import ./modules;
        extraSpecialArgs = {
          myUser = user;
          isWSL = isWSL;
        };
      };
    };
}
