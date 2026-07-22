{
  flake.nixosModules.thunar = { ... }: {
    programs.thunar.enable = true;
    # to see thumbnails
    services.tumbler.enable = true;
    # so we can connect other filesystems like (ftp, webdav and such)
    services.gvfs.enable = true;
  };
}
