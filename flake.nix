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
          [ (import ./modules/base.nix) ] ++
          [ (import ./modules/system.nix) ] ++
          [ (import ./modules/packages.nix) ] ++
          [ (import ./modules/io.nix) ] ++
          [ (import ./modules/hyprland.nix) ];
      };

      # config for bspwm
      bspwm = nixpkgs.lib.nixosSystem {
        modules = 
          [ (import ./modules/base.nix) ] ++
          [ (import ./modules/system.nix) ] ++
          [ (import ./modules/packages.nix) ] ++
          [ (import ./modules/io.nix) ] ++
          [ (import ./modules/bspwm.nix) ];
      };

      # config for gnome
      gnome = nixpkgs.lib.nixosSystem {
        modules = 
          [ (import ./modules/base.nix) ] ++
          [ (import ./modules/system.nix) ] ++
          [ (import ./modules/packages.nix) ] ++
          [ (import ./modules/io.nix) ] ++
          [ (import ./modules/gnome.nix) ];
      };
    };
  };
}
