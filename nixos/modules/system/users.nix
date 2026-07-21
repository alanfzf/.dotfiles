{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    my.user = lib.mkOption {
      type = lib.types.str;
      description = "Name of the main system user.";
    };

    my.hostName = lib.mkOption {
      type = lib.types.str;
      description = "Name of the computer";
    };
  };

  config = {
    users.mutableUsers = false;
    users.users.${config.my.user} = {
      hashedPassword = "$6$r7x6AGB/EBBQfXXH$.t6gthHYfu.VGjLav3T13d.pKwxfW/WYU6l8urddEY93Mvr0P7XdfOwBTO0z/K/3Ve6m6wn0AVygpDc4ASlLg/";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    };

    networking.hostName = config.my.hostName;
  };
}
