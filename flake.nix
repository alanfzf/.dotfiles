{
  description = "Alan's Nix system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # home manager
    home-manager.url = "github:nix-community/home-manager";
    # darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    # wsl
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    # neovim overlay
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    # dendritic pattern
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
