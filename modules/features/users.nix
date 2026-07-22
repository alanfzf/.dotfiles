{
  flake.nixosModules.users =
    { pkgs, config, ... }:
    let
      user = config.preferences.user.name;
      hostName = config.preferences.host.name;
    in
    {
      users.mutableUsers = false;
      users.users.${user} = {
        hashedPassword = "$6$r7x6AGB/EBBQfXXH$.t6gthHYfu.VGjLav3T13d.pKwxfW/WYU6l8urddEY93Mvr0P7XdfOwBTO0z/K/3Ve6m6wn0AVygpDc4ASlLg/";
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
        ];
      };

      programs.zsh.enable = true;
      # networking.hostName = hostName;
    };
}
