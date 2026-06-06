{
  config,
  pkgs,
  inputs,
  user,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${user}" = import ./hm/home-manager.nix;
    backupFileExtension = ".bckp";
    extraSpecialArgs = {
      homeUser = user;
      isWSL = config.wsl.enable or false;
    };
  };
}
