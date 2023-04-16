{
  description = "A very basic flake";
  
  inputs = { 
    
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";            # Nix Packages

    hyprland = {                                                          # Official Hyprland flake
      url = "github:vaxerski/Hyprland";                                   # Add "hyprland.nixosModules.default" to the host modules
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, hyprland }:
    let
      user = "marc";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        desktop_home = lib.nixosSystem {
          inherit system;
          modules = [
            ./systems/base.nix
          ];
        };
      };
    };
}
