{
  config,
  pkgs,
  user,
  ...
}:
{
  imports = [
    # common
    ../common/common-home.nix
    ../common/common-programs.nix
    ../common/common-services.nix
    ../common/common-users.nix
    # nix specific
    ./locale.nix
    ./bootloader.nix
    ./services.nix
    ./programs.nix
    ./hardware.nix
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "09:30";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
