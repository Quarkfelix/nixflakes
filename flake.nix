{
  description = " Yust work you ***** ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, hyprland, ... }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        modules = [ 
          hyprland.nixosModules.default 
          { programs.hyprland.enable = true; }
          ./nixos/configuration.nix
        ];
      };
    };
  };
}
