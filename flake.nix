{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }@inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit hyprland; };
        modules = [ 
          ./nixos/configuration.nix
          hyprland.nixosModules.default 
          { programs.hyprland.enable = true; }
        ];
      };
    };
  };
}
