{
  description = " just work you **** ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ...}: {
    
    nixosConfigurations.hyprland = nixpkgs.lib.nixosSystem {
      modules = [
        ./nixos/configuration.nix
      ];
    };

    #nixosConfigurations.bspwm = nixpkgs.lib.nixosSystem {
    #  modules = [ 
    #    ./nixos/configuration.nix
    #  ];
    #};
  };
}
