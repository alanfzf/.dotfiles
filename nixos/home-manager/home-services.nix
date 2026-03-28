{ ... }:
{
  services.ssh-agent = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
