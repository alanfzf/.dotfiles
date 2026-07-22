{
  flake.nixosModules.bootloader = { pkgs, ... }: {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
    };
  };
}
