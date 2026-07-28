{
  flake.nixosModules.sway = { pkgs, ... }: {
    preferences.greetd.command = "${pkgs.sway}/bin/sway";
    programs.sway = {
      enable = true;
      package = pkgs.sway;
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
        sway-contrib.grimshot
        satty
      ];
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      wlr.settings.screencast = {
        chooser_type = "simple";
        chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        max_fps = 30;
        force_mod_linear = true;
      };
    };
  };
}
