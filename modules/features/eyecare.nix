{
  flake.nixosModules.eyecare = { pkgs, ... }: {
    systemd.user.services."20-20-20" = {
      description = "20-20-20 rule notifier";

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.libnotify}/bin/notify-send --hint int:transient:1 '20-20-20 rule' 'Take a break!'";
      };
    };

    systemd.user.timers."20-20-20" = {
      description = "20-20-20 rule notifier timer";

      timerConfig = {
        OnStartupSec = "20min";
        OnUnitActiveSec = "20min";
      };

      wantedBy = [ "timers.target" ];
    };
  };
}
