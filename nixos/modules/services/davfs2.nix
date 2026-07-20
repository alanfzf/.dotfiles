{ user, ... }:
{
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

}
