{
  description = " just work you **** ";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { nixpkgs, home-manager, self, impermanence, hyprland, nix-colors, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "x86_64-linux"
      ];
    in
      rec {
        # Your custom packages
        # Acessible through 'nix build', 'nix shell', etc
        packages = forAllSystems (system:
          let pkgs = nixpkgs.legacyPackages.${system};
          in import ./pkgs { inherit pkgs; }
        );


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
}
