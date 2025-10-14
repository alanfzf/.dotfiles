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
      # users
      user = "alan";

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

      homeConfig =
        user: system: pkgs:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./nixos/home-manager/home.nix
          ];
          extraSpecialArgs = {
            homeUser = user;
          };
        };

      # architecture declaration
      system = "x86_64-linux";
      pkgs = importPkgs system;

      aarchSystem = "aarch64-darwin";
      aarchPkgs = importPkgs aarchSystem;

    in
    {
      # NixOS
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          modules = [ ./nixos/nix/configuration.nix ];
          specialArgs = {
            inherit inputs user;
          };
        };

        wpc = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          modules = [ ./nixos/wsl/configuration.nix ];
          specialArgs = {
            inherit inputs user;
          };
        };
      };

      # MacOS
      darwinConfigurations = {
        "mb-pro-m3" = nix-darwin.lib.darwinSystem {
          system = aarchSystem;
          pkgs = aarchPkgs;
          modules = [ ./nixos/darwin/darwin.nix ];
          specialArgs = { inherit inputs user; };
        };
      };

      # HM
      homeConfigurations = {
        "${user}" = homeConfig user system pkgs;
      };
    };
}
