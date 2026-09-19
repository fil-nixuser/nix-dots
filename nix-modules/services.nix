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
  networking.nameservers = ["111.88.96.50" "111.88.96.51"];

  networking.networkmanager.enable = true;

  #other
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  services.displayManager.ly.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.libinput.enable = true;

  services.udisks2.enable = true;

  security.pam.services.hyprlock = {};

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
