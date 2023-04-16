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
      location = "$HOME/.config";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = (                                               # NixOS configurations
        import ./hosts {                                                    # Imports ./hosts/default.nix
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs user location hyprland;                    # Also inherit home-manager so it does not need to be defined here.
        }
      );
    };
}
