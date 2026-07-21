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
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
      ];

      importPkgs =
        system:
        import nixpkgs {
          inherit system overlays;
          config.allowUnfree = true;
        };
    in
    {
      nixosConfigurations = {
        corpo = import ./nixos/hosts/corpo {
          inherit inputs importPkgs nixpkgs;
        };

        wpc = import ./nixos/hosts/wsl {
          inherit inputs importPkgs nixpkgs;
        };
      };

      darwinConfigurations = {
        "mb-pro-m3" = import ./nixos/hosts/mbpro {
          inherit inputs importPkgs nixpkgs;
        };
      };
    };
}
