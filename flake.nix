{
  description = "Alan's Nix system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # wsl
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim overlay
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      nixos-wsl,
      home-manager,
      ...
    }@inputs:
    let
      # overlay
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
      ];

      # functions
      importPkgs =
        system:
        import nixpkgs {
          inherit system overlays;
          config.allowUnfree = true;
        };

      # aarchSystem = "aarch64-darwin";
      # aarchPkgs = importPkgs aarchSystem;
    in
    {
      # NixOS
      nixosConfigurations = {
        nixos = import ./nixos/nix/alan {
          inherit inputs importPkgs nixpkgs;
        };

        # wpc = import ./nixos/wsl/alan/system.nix {
        #   inherit inputs importPkgs nixpkgs;
        # };
      };

      # MacOS
      # darwinConfigurations = {
      #   "mb-pro-m3" = nix-darwin.lib.darwinSystem {
      #     system = aarchSystem;
      #     pkgs = aarchPkgs;
      #     modules = [ ./nixos/darwin/alan ];
      #     specialArgs = { inherit inputs; };
      #   };
      # };
    };
}
