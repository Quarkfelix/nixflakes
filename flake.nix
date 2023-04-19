{
  description = " just work you **** ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {self, nixpkgs, hyprland, ...}@inputs: {
    
    nixosConfigurations = {
      # config for hyprland
      hyprland = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit self inputs; };
        modules = 
          [ (import ./nixos/base.nix) ] ++
          [ (import ./nixos/system.nix) ] ++
          [ (import ./nixos/packages.nix) ] ++
          [ (import ./nixos/io.nix) ] ++
          [ (import ./nixos/hyprland.nix) ];
      };

      # config for bspwm
      bspwm = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/base.nix
          ./nixos/system.nix
          ./nixos/packages.nix
          ./nixos/io.nix
          ./nixos/bspwm.nix
        ];
      };

      # config for gnome
      gnome = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/base.nix
          ./nixos/system.nix
          ./nixos/packages.nix
          ./nixos/io.nix
          ./nixos/gnome.nix
        ];
      };

    };
      

    #nixosConfigurations.bspwm = nixpkgs.lib.nixosSystem {
    #  modules = [ 
    #    ./nixos/configuration.nix
    #  ];
    #};
  };
}
