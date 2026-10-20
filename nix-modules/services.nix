{ config, pkgs, ...}:

{
  #networking
  ##netbird
  services.netbird.clients.wt0 = {
    openFirewall = true;
    openInternalFirewall = true;
    port = 51821;
  };
  
  systemd.services.netbird-wt0 = {
    serviceConfig = { TimeoutStopSec = 5; };
  };
  
  ##other
  services.openssh.enable = true;
  
  services.resolved.enable = true;
  networking.networkmanager.enable = true;
  #other
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "doom";
      animation_frame_delay = 50;
    };
  };

  services.gnome.gnome-keyring.enable = true;

  services.libinput.enable = true;

  services.udisks2.enable = true;

  security.pam.services.hyprlock = {};

  services.power-profiles-daemon.enable = true;

  services.supergfxd.enable = true;

  services.asusd.enable = true;

  #printing
    services.printing.enable = true;
    services.printing.drivers = [
      pkgs.hplipWithPlugin
    ];
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
}
