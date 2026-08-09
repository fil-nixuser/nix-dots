
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
  services.netbird.clients.wt0 = {
    openFirewall = true;
    openInternalFirewall = true;
    port = 51821;
  };
  services.gnome.gnome-keyring.enable = true;
    services.zapret = {
    enable = true;
    
    params = [
      "--filter-tcp=80 ˂HOSTLIST˃"
      "--dpi-desync=fake,fakedsplit"
      "--dpi-desync-autottl=2"
      "--dpi-desync-fooling=md5sig"
      "--new"
      "--filter-tcp=443"
      "--dpi-desync=fake,multidisorder"
      "--dpi-desync-fooling=badseq"
      "--dpi-desync-split-pos=midsld"
      "--dpi-desync-fake-tls=0x00000000"
    ];
    whitelist = [
        "googleusercontent.com"
        "accounts.google.com"
        "googleadservices.com"
        "googlevideo.com"
        "gvt1.com"
        "jnn-pa.googleapis.com"
        "play.google.com"
        "wide-youtube.l.google.com"
        "youtu.be"
        "youtube-nocookie.com"
        "youtube-ui.l.google.com"
        "youtube.com"
        "youtube.googleapis.com"
        "youtubeembeddedplayer.googleapis.com"
        "youtubei.googleapis.com"
        "yt-video-upload.l.google.com"
        "yt.be"
        "ytimg.com"
        "ggpht.com"
      ];
  };
  services.xserver.videoDrivers = ["nvidia"];
  security.pam.services.hyprlock = {};
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

  networking.nameservers = ["111.88.96.50" "111.88.96.51"];

   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };
  services.displayManager.ly.enable = true;

   services.libinput.enable = true;

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

