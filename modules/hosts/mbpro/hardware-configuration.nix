{ inputs, ... }:
{
  flake.darwinModules.mbpro-hardware = { lib, ... }: {
    system.stateVersion = 5;
    system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
  };
}
