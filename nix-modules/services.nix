{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.omnisearch.nixosModules.default
  ];
  #networking
  ##netbird
  services.netbird.clients.wt0 = {
    openFirewall = true;
    openInternalFirewall = true;
    port = 51821;
  };

  systemd.services.netbird-wt0 = {
    serviceConfig = {TimeoutStopSec = 5;};
  };

  ##other
  services.openssh.enable = true;

  services.resolved.enable = true;
  networking.nameservers = ["212.109.221.20" "212.109.195.93"];
  networking.networkmanager.enable = true;
  ##searxng
  services.omnisearch = {
    enable = true;
    settings = {
      server.port = 1234;
      server.host = "127.0.0.0";
      engines.engines = "ddg, startpage";
    };
  };
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

  services.upower.enable = true;

  security.pam.services.hyprlock = {};

  services.power-profiles-daemon.enable = true;

  services.supergfxd.enable = true;

  services.asusd.enable = true;

  #printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
