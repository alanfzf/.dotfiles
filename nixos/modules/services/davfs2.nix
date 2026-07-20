{
  lib,
  config,
  ...
}:
let
  user = config.my.user;
in
{
  options = {
    my.davfs.enable = lib.mkEnableOption "Enable davfs2 configuration";
  };

  config = lib.mkIf config.my.davfs.enable {
    fileSystems."/home/${user}/webdav" = {
      device = "https://my-webdav.fly.dev";
      fsType = "davfs";
      options = [
        "netdev"
        "rw"
        "user"
        "uid=1000"
        "filemode=0644"
        "dirmode=0755"
        "noauto"
        "x-systemd.automount"
      ];
    };

    services.davfs2 = {
      enable = true;
      davUser = user;
      settings = {
        globalSection = {
          gui_optimize = true;
          file_refresh = 30;
        };
        sections = {
          "/home/${user}/webdav" = {
            gui_optimize = true;
            file_refresh = 30;
          };
        };
      };
    };
  };
}
