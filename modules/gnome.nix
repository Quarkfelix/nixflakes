{ config, pkgs, ... }:

{

##
# Seting up GUI
##

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # NVIDIA drivers
  # services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.opengl.enable = true;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}
