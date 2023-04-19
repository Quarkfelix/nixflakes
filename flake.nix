{
  description = " Yust work you ***** ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {self, nixpkgs, ...}: {
    
    nixosConfigurations.hyperland = nixpkgs.lib.nixosSystem {
      modules = [
        hyprland.nixosModules.default
        {programs.hyprland.enable = true;}
        # ...
      ];
    };

    #nixosConfigurations.bspwm = nixpkgs.lib.nixosSystem {
    #  modules = [ 
    #    ./nixos/configuration.nix
    #  ];
    #};
  };
}
