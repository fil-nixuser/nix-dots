
{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    nvidiaSettings = true;

    prime = {

      sync.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nil";

  networking.networkmanager.enable = true;

  environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal" ];
  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";

  nixpkgs.config.allowUnfree = true; 

  services.printing.enable = true;

  services.resolved.enable = true;

  networking.nameservers = ["31.192.108.180" "176.99.11.77"];

   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };
  services.displayManager.ly.enable = true;

   services.libinput.enable = true;

   services.zapret.enable = true;
  services.zapret.params = [
    "--wf-tcp=80,443,2053,2083,2087,2096,8443" "--wf-udp=443,19294-19344,50000-50100" "--filter-udp=443" "--hostlist=/var/lib/zapret/list-general.txt" "--hostlist=/var/lib/zapret/list-general-user.txt" "--hostlist-exclude=/var/lib/zapret/list-exclude.txt" "--hostlist-exclude=/var/lib/zapret/list-exclude-user.txt" "--ipset-exclude=/var/lib/zapret/ipset-exclude.txt" "--ipset-exclude=/var/lib/zapret/ipset-exclude-user.txt" "--dpi-desync=fake" "--dpi-desync-repeats=11" "--dpi-desync-fake-quic=/var/lib/zapret/quic_initial_www_google_com.bin" "--new" "--filter-udp=19294-19344,50000-50100" "--filter-l7=discord,stun" "--dpi-desync=fake" "--dpi-desync-fake-discord=/var/lib/zapret/ACTIVE_DISCORD_UDP.bin" "--dpi-desync-fake-stun=/var/lib/zapret/ACTIVE_DISCORD_UDP.bin" "--dpi-desync-repeats=6" "--new" "--filter-tcp=2053,2083,2087,2096,8443" "--hostlist-domains=discord.media" "--dpi-desync=fake,multisplit" "--dpi-desync-split-seqovl=681" "--dpi-desync-split-pos=1" "--dpi-desync-fooling=ts" "--dpi-desync-repeats=8" "--dpi-desync-split-seqovl-pattern=/var/lib/zapret/tls_clienthello_www_google_com.bin" "--dpi-desync-fake-tls=/var/lib/zapret/tls_clienthello_www_google_com.bin" "--new" "--filter-tcp=443" "--hostlist=/var/lib/zapret/list-google.txt" "--ip-id=zero" "--dpi-desync=fake,multisplit" "--dpi-desync-split-seqovl=681" "--dpi-desync-split-pos=1" "--dpi-desync-fooling=ts" "--dpi-desync-repeats=8" "--dpi-desync-split-seqovl-pattern=/var/lib/zapret/tls_clienthello_www_google_com.bin" "--dpi-desync-fake-tls=/var/lib/zapret/tls_clienthello_www_google_com.bin" "--new" "--filter-tcp=80,443" "--hostlist=/var/lib/zapret/list-general.txt" "--hostlist=/var/lib/zapret/list-general-user.txt" "--hostlist-exclude=/var/lib/zapret/list-exclude.txt" "--hostlist-exclude=/var/lib/zapret/list-exclude-user.txt" "--ipset-exclude=/var/lib/zapret/ipset-exclude.txt" "--ipset-exclude=/var/lib/zapret/ipset-exclude-user.txt" "--dpi-desync=fake,multisplit" "--dpi-desync-split-seqovl=664" "--dpi-desync-split-pos=1" "--dpi-desync-fooling=ts" "--dpi-desync-repeats=8" "--dpi-desync-split-seqovl-pattern=/var/lib/zapret/tls_clienthello_max_ru.bin" "--dpi-desync-fake-tls=/var/lib/zapret/stun.bin" "--dpi-desync-fake-tls=/var/lib/zapret/tls_clienthello_max_ru.bin"
  ];


   users.users.fil = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

  programs.zsh.enable = true;
  programs.niri.enable = true;
  programs.steam.enable = true;  
   environment.systemPackages = with pkgs; [
     helix
     ghostty
     git
     wget
     curl
     fastfetch
     nil
     wl-clipboard
     inputs.fetch3d.packages.${pkgs.stdenv.hostPlatform.system}.default
     inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
   ];
	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
	];
 	programs.mtr.enable = true;
	 programs.gnupg.agent = {
   	enable = true;
   	enableSSHSupport = true;
 	};
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
	

  system.stateVersion = "26.05"; # Did you read the comment? yeah, bro. i totally read that comment

}

