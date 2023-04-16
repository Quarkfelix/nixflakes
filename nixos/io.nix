{ config, pkgs, ... }:

{
##
# Configure Mouse and Keyboard
##

  # Mouse
  services.xserver.libinput.mouse = {
    accelProfile = "flat";
    transformationMatrix = "0.8 0 0 0 0.8 0 0 0 1";
  };
  
  services.xserver.libinput.mouse.leftHanded = false; 
  services.xserver.libinput.enable = true;
  services.xserver.exportConfiguration = true;

  # Configure keyboard
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable CUPS to print documents.
  services.printing.enable = true;

##
# Sound
##

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

}