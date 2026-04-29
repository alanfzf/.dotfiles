{
  config,
  pkgs,
  ...
}:
let
  requiredPackages = with pkgs; [
    foot
    grim
    wl-clipboard
    slurp
    wdisplays
  ];
in
{
  programs.waybar.enable = false;
  programs.hyprland = {
    enable = false;
  };

  # xdg = {
  #   portal = {
  #     enable = true;
  #     xdgOpenUsePortal = true;
  #     config = {
  #       common.default = [ "gtk" ];
  #       hyprland.default = [
  #         "gtk"
  #         "hyprland"
  #       ];
  #     };
  #     extraPortals = [
  #       pkgs.xdg-desktop-portal-gtk
  #       pkgs.xdg-desktop-portal-hyprland
  #     ];
  #   };
  # };
}
