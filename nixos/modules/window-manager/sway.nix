{ user, pkgs, ... }:

{
  imports = [
    ../desktop
  ];

  my.greetd.command = "${pkgs.sway}/bin/sway";

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      playerctl
      brightnessctl
      foot
      grim
      libnotify
      mako
      slurp
      swaybg
      swaylock
      waypaper
      wdisplays
      wl-clipboard
      ristretto
    ];
  };

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings = {
        screencast = {
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
        };
      };
    };
    config = {
      common = {
        default = [ "wlr" ];
      };
    };
  };
}
