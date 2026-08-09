
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

