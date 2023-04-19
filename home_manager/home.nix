{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marc";
  home.homeDirectory = "/home/marc";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  programs.git = {
    enable = true;
    userName = "marc";
    userEmail = "marc-felix.schmitz@protonmail.com";
  };

  # Enable the BSPWM Desktop Environment
  xsession.windowManager.bspwm.enable = true;
  services.xserver.displayManager.defaultSession = "none+bspwm";
  services.xserver.windowManager.bspwm.configFile = "/home/marc/.config/dotfiles-nixos/bspwmrc";
  services.xserver.windowManager.bspwm.sxhkd.configFile = "/home/marc/.config/dotfiles-nixos/sxhkdrc";

}