{
  config,
  inputs,
  ...
}:
let
  user = config.my.user;
  isWSL = config.wsl.enable or false;
in
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

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
}
