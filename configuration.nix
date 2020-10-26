# https://nixos.org/manual/nixos/stable/options.html
{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # networking.hostName = "nixos"; # Define your hostname.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens18.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.desktopManager.xterm.enable = true;

  users.users.test = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMOlEzksQh2pKQ1V6daqoKlcUdCRSTlab9nk9TPzR9dLiC+zsJyJg8nWEu1q+1+QfPtco2+mswoJujnSl7hgQIb+7QmeoqEZXTG2YtixOtucdIoRc6rW0713JVQcT6zET8juj2ydyswGad4buMP3oYAX5pQswyfLVtugokw5szdklOPKEWgsKqPvWeeawV4fi7xZ3WYpP/sJt+Gv6X4R6k5RvaSm4l4bH9FnZS2VN2Qg+obO+XDa+tukuL6lvVtvY9c3aVh6xR9El54SYNmEeOPaWS/KIGAniRGXzXmgUXshZGZ+LxtJIBTpHmSyaPglJzrPNJqDtkBNhSVTrBTihsfJuLp6i+rihAJ8YFNT5zEH19SaSJeI+vATImSprMe3qkHVIDRRb4bCrOFxHgrj7GPWSYkPphZTi5hOCIimuEY1IRZaaDVflfBsw4xC/gkZLenZ2sw2sKoSy4QwuE+P0pOLwfAchvtpFt/tg/Zp8t1EP+Qo6M9yY16j20aptWe20= kr" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
  
  environment.systemPackages = with pkgs; [
     ag chromium firefox gitAndTools.gitFull htop qemu-utils screen wget
  ];
}
