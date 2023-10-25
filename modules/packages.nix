{ config, pkgs, ... }:

{


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # essential apps
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neofetch
    neovim
    git
    htop
    wget
    alacritty
    xfce.xfce4-terminal
    pavucontrol
    killall
    pastel
    imagemagick #tool to convert images in cli
    oh-my-zsh
    gnumake


    # dev
    python39
    python39Packages.pip
    nodejs-19_x
    rustup
    docker
    docker-compose


    # software
    brave
    spotify
    vscode    
    discord
    filezilla
    wireguard-tools
    signal-desktop
    firefox

    # Desktop Environment
    sxhkd
    bspwm
    rofi
    polybar
    ksuperkey
    picom
    feh
    nerdfonts
    xorg.xprop
  ];


  # Thunar
  programs.thunar.enable = true;

  # docker
  virtualisation.docker.enable = true;

  
}
